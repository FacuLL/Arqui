#include "libc.h"

int main(int argc, char const *argv[])
{
    int archivo = open("./hola.txt");
    read(archivo);
    close(archivo);
    return 0;
}
