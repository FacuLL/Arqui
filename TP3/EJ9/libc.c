//libc.c
#include "libc.h"

int sys_execve(const char *filename, char *const argv[], char *const envp[]);

int execute(const char* command, char * const args[]) {
    char *const envp[1] = {0};
    return sys_execve(command, args, envp);    
}
