#include "libc.h"

int main(int argc, char const *argv[])
{
    char * const args[5] = {
        "", "-1", "-l", "vendor_id", 0
    };
    execute("/bin/cpuid", args);    
    return 0;
}
