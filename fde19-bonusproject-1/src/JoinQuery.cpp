#include "JoinQuery.hpp"
#include "MemoryMappedFile.hpp"
#include <assert.h>
#include <fstream>
#include <thread>
#include <unordered_map>
#include <vector>
#include <iostream>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <emmintrin.h>
#include <pmmintrin.h>
#include <immintrin.h>

using namespace std;

#define L_ORDERKEY_COL  1
#define L_QUANTITY_COL  5
#define O_ORDERKEY_COL  1
#define O_CUSTKEY_COL   2
#define C_CUSTKEY_COL   1
#define C_MKTSEG_COL    7
// NOTE: https://docs.snowflake.net/manuals/user-guide/sample-data-tpch.html

/**
 * Find the nth occurrence of the given character, c.
 * @param file pointer to binary file.
 * @param n number of times to find c.
 * @param c the character to search for.
 * @return pointer to the given file after finding n occurrences of c.
 */
//template <char c>
//static inline const char* findNth(const char* file, const char* limit, uint n) {
//    // TODO substitute with efficient getNth from class slides
//    if (n == 0) return file;
//    for (; file != limit; ++file) {
//        if (*file == c) --n;
//        if (n == 0) return file;
//    }
//    return nullptr;
//}
//
//template <char c>
//static inline const char* find(const char* file, const char* limit) {
//    return findNth<c>(file, limit, 1);

template <char c>
static inline const char* find(const char* iter, const char* limit)
{
    auto limit8=limit-8;
    while (iter<limit8) {
        auto block = *reinterpret_cast<const uint64_t*>(iter);
        constexpr uint64_t pattern = (static_cast<uint64_t>(c)<<56)|(static_cast<uint64_t>(c)<<48)|(static_cast<uint64_t>(c)<<40)|(static_cast<uint64_t>(c)<<32)|(static_cast<uint64_t>(c)<<24)|(static_cast<uint64_t>(c)<<16)|(static_cast<uint64_t>(c)<<8)|(static_cast<uint64_t>(c)<<0);
        constexpr uint64_t lowerBits = 0x7F7F7F7F7F7F7F7Full;
        constexpr uint64_t topBits = ~lowerBits;
        uint64_t asciiChars = (~block)&topBits;
        uint64_t foundPattern = ~((((block&lowerBits) ^ pattern)+lowerBits)&topBits);
        uint64_t matches = foundPattern & asciiChars;
        if (matches) {
            return iter+__builtin_ctzll(matches)/8;
        } else {
            iter+=8;
        }
    }
    while ((iter!=limit)&&((*iter)!=c)) ++iter;
    return iter;
}

template <char c>
static inline const char* findNth(const char* iter, const char* limit, unsigned n)
{
    auto limit8=limit-8;
    while (iter<limit8) {
        auto block = *reinterpret_cast<const uint64_t*>(iter);
        constexpr uint64_t pattern = (static_cast<uint64_t>(c)<<56)|(static_cast<uint64_t>(c)<<48)|(static_cast<uint64_t>(c)<<40)|(static_cast<uint64_t>(c)<<32)|(static_cast<uint64_t>(c)<<24)|(static_cast<uint64_t>(c)<<16)|(static_cast<uint64_t>(c)<<8)|(static_cast<uint64_t>(c)<<0);
        constexpr uint64_t lowerBits = 0x7F7F7F7F7F7F7F7Full;
        constexpr uint64_t topBits = ~lowerBits;
        uint64_t asciiChars = (~block)&topBits;
        uint64_t foundPattern = ~((((block&lowerBits) ^ pattern)+lowerBits)&topBits);
        uint64_t matches = foundPattern & asciiChars;
        if (matches) {
            unsigned hits=__builtin_popcountll(matches);
            if (hits<n) {
                n-=hits;
                iter+=8;
            } else {
                while (n>1) {
                    matches&=matches-1;
                    --n;
                }
                return iter+__builtin_ctzll(matches)/8;
            }
        } else {
            iter+=8;
        }
    }
    while ((iter!=limit)&&((*iter)!=c)) ++iter;
    return iter;
}

/**
 * Converts a given c-string into its corresponding number;
 * reads up to the given delimiter character.
 * @param it iterator to the c-string.
 * @param delim delimiter character.
 * @return the integer value.
 */
uint str_to_uint(const char * it, char delim = '|') {
    uint sum = 0;
    while (true) {
        char c = *(it++);
        if (c == delim) break;
        sum = sum * 10 + c - '0';
    }
    return sum;
}

//---------------------------------------------------------------------------
JoinQuery::JoinQuery(std::string lineitem, std::string order,
                     std::string customer)
{
    // Extract (multi)mapping l_orderkey -> l_quantity
    auto f_lineitem = MemoryMappedFile(lineitem.c_str());
    for (auto it = f_lineitem.begin(), limit = f_lineitem.end(); it != limit; ) {
        // Get lineitem[orderkey]
        uint okey = str_to_uint(it);

        // Get lineitem[quant]
        it = findNth<'|'>(it, limit, L_QUANTITY_COL - 1) + 1;
        uint quant = str_to_uint(it);

        this->orderkey_quant.insert(make_pair(okey, quant));

        // Advance to next line
        it = find<'\n'>(it, limit);
        if (it != limit) ++it;
    }

    // Extract mapping o_orderkey -> o_custkey
    auto f_order = MemoryMappedFile(order.c_str());
    for (auto it = f_order.begin(), limit = f_order.end(); it != limit; ) {
        // Get orders[orderkey]
        uint okey = str_to_uint(it);

        // Get orders[custkey]
        it = findNth<'|'>(it, limit, O_CUSTKEY_COL - 1) + 1;
        uint custkey = str_to_uint(it);

        this->custkey_orderkey.insert(make_pair(custkey, okey));

        // Advance to next line
        it = find<'\n'>(it, limit);
        if (it != limit) ++it;
    }

    // Extract mapping c_custkey -> c_mktsegment
    auto f_customer = MemoryMappedFile(customer.c_str());
    for (auto it = f_customer.begin(), limit = f_customer.end(); it != limit; ) {
        // Get customer[custkey]
        uint custkey = str_to_uint(it);

        // Get customer[mktsegment]
        it = findNth<'|'>(it, limit, C_MKTSEG_COL - 1) + 1;
        auto next_it = find<'|'>(it, limit);
        string mktsegment = string(it, next_it - it);

        this->mktseg_custkey.insert(make_pair(mktsegment, custkey));

        // Advance to next line
        it = find<'\n'>(next_it, limit);
        if (it != limit) ++it;
    }
}


/**
 * In bash:
 * join -t '|' -1 4 -2 1 -o 1.1,1.2,1.3,1.4,2.1,2.7
 *      <(join -t '|' -1 1 -2 1 -o 1.1,1.5,2.1,2.2 lineitem.tbl orders.tbl) customer.tbl |
 *          grep <segmentParam> | cut -d '|' -f 2
 */
size_t JoinQuery::avg(std::string segmentParam)
{
    uint sum = 0, n = 0;
    for (auto it = mktseg_custkey.equal_range(segmentParam); it.first != it.second; ++it.first) {
        uint ckey = it.first->second;
        for (auto inner = custkey_orderkey.equal_range(ckey); inner.first != inner.second; ++inner.first) {
            uint okey = inner.first->second;
            for (auto ininner = orderkey_quant.equal_range(okey); ininner.first != ininner.second; ++ininner.first) {
                uint quant = ininner.first->second;
                sum += quant * 100;
                n += 1;
            }
        }
    }

    return sum / n;
}
//---------------------------------------------------------------------------
size_t JoinQuery::lineCount(std::string rel)
{
   std::ifstream relation(rel);
   assert(relation);  // make sure the provided string references a file
   size_t n = 0;
   for (std::string line; std::getline(relation, line);) n++;
   return n;
}
//---------------------------------------------------------------------------
