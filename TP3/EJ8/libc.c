//libc.c
#include "libc.h"
#define STDOUT 1
#define O_RDWR 2

int sys_open(const char *pathname, int flags, int mode);
int sys_close(int fd);
int sys_write(int fd, void *buffer, int size);
int sys_read(int fd, void *buf, int count);
int sys_kill(int pid, int sig);

int strlen(const char* str);

int open(const char* path) {
    return sys_open(path, O_RDWR, 0100);
}

int close (int fileid) {
    return sys_close(fileid);
}

int write(int fd, const char *str) {
    int len = strlen(str);
    return sys_write(fd, (void *) str, len);
}

int read(int fd) {
    char buffer[1024];
    int bytes_read;
    while ((bytes_read = sys_read(fd, buffer, sizeof(buffer))) > 0) {
        sys_write(STDOUT, buffer, bytes_read); 
    }
}

int kill(int pid) {
    return sys_kill(pid, 15);
}

int puts(const char* str) {
    return write(STDOUT, str);
}

