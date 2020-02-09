#include "MemoryMappedFile.hpp"
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <stdexcept>

using std::invalid_argument;

MemoryMappedFile::MemoryMappedFile(const char* file)
{
    if (! this->open(file))
        throw invalid_argument("provided file is not valid");
}

bool MemoryMappedFile::open(const char* file)
{
    close();

    int h = ::open(file, O_RDONLY);
    if (h<0) return false;

    lseek(h,0,SEEK_END);
    size=lseek(h,0,SEEK_CUR);

    auto m = mmap(nullptr, size, PROT_READ, MAP_SHARED, h, 0);
    if (m == MAP_FAILED) {
        ::close(h);
        return false;
    }

    handle=h;
    mapping=static_cast<char*>(m);
    return true;
}

void MemoryMappedFile::close()
{
    if (handle>=0) {
        munmap(mapping, size);
        ::close(handle);
        handle=-1;
    }
}
