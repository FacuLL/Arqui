#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define STRING_BUFFER_SIZE 10

int isValidChar(char c) {
    return c >= ' ' && c <= '}';
}

int main(int argc, char const *argv[]) {
    if (argc < 2) {
        printf("No arguments\n");
        return 1;
    }

    char * string = NULL;
    int dim = 0;
    
    FILE * file = fopen(argv[1], "r");

    char c = '\0';
    do {
        if (isValidChar(c)) {
            if (dim % STRING_BUFFER_SIZE == 0) 
                string = realloc(string, dim + STRING_BUFFER_SIZE + 1);
            string[dim] = c;
            string[++dim] = '\0';
        } else {
            if (dim > 3) printf("%s\n", string);
            dim = 0;
        }
        c = fgetc(file);
    } while (!feof(file));

    return 0;
}
