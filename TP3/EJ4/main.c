#include "libc.h"

int siete();

int main(int argc, char const *argv[])
{
    char str[3];
    str[0] = siete() + '0';
    str[1] = '\n';
    str[2] = 0;
    puts(str);
    return 0;
}