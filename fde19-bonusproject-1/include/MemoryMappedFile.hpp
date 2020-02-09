#ifndef BONUSTPCHJOIN_MEMORYMAPPEDFILE_HPP
#define BONUSTPCHJOIN_MEMORYMAPPEDFILE_HPP

#include <unistd.h>
#include <stdint.h>

/**
 * Class representing a memory mapped file;
 * from the class slides/files.
 */
class MemoryMappedFile
{
    int handle = -1;
    uintptr_t size = 0;
    char* mapping = nullptr;

public:
    MemoryMappedFile() = default;
    MemoryMappedFile(const char* file);
    ~MemoryMappedFile() { close(); }

    bool open(const char* file);
    void close();

    const char* begin() const { return mapping; }
    const char* end() const { return mapping+size; }
};

#endif //BONUSTPCHJOIN_MEMORYMAPPEDFILE_HPP
