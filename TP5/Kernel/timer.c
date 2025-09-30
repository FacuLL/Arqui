#include <time.h>

extern int getFromTime(int position);

int bcd2dec(int v) {
    return (v & 0x0F) + ((v >> 4) * 10);
}

int getSeconds() {
    return bcd2dec(getFromTime(0));
}

int getMinutes() {
    return bcd2dec(getFromTime(2));
}

int getHours() {
    return bcd2dec(getFromTime(4));
}

int getDayOfMonth() {
    return bcd2dec(getFromTime(7));
}

int getMonth() {
    return bcd2dec(getFromTime(8));
}

int getYear() {
    return bcd2dec(getFromTime(9));
}
