#ifndef LIBC_H
    #define LIBC_H
    int puts(const char* str);

    int open(const char* path);

    int close (int fileid);

    int write(int fd, const char *str);

    int read(int fd);

    int kill(int pid);
#endif