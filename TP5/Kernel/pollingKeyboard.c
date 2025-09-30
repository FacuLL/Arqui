#include <pollingKeyboard.h>
#define SCANCODE_LSHIFT 0x2A
#define SCANCODE_RSHIFT 0x36

extern int tryReadKeyBoard(unsigned char * output);

// Variable para trackear el estado de Shift
static int shift_pressed = 0;

// Tabla de scancode a ASCII (teclado US)
static const char scancode_to_ascii[] = {
    0,   27,  '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '=', '\b',
    '\t', 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',
    0,   'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';', '\'', '`',
    0,   '\\', 'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/', 0,
    '*', 0,  ' '
};

// Tabla para mayúsculas/shift
static const char scancode_to_ascii_shift[] = {
    0,   27,  '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '\b',
    '\t', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '{', '}', '\n',
    0,   'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ':', '"', '~',
    0,   '|', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', '<', '>', '?', 0,
    '*', 0,  ' '
};

int readKeyBoard(unsigned char * output) {
    unsigned char scancode;
    if (tryReadKeyBoard(&scancode)) {
        int is_release = scancode & 0x80;
        scancode &= 0x7F;  // Remover el bit de release
        
        // Detectar Shift presionado/soltado
        if (scancode == SCANCODE_LSHIFT || scancode == SCANCODE_RSHIFT) {
            shift_pressed = !is_release;
            return 0;
        }
        
        // Solo procesar cuando se presiona (no release)
        if (is_release) {
            return 0;
        }
        
        // Traducir usando la tabla correcta
        if (scancode < sizeof(scancode_to_ascii)) {
            char ascii;
            if (shift_pressed) {
                ascii = scancode_to_ascii_shift[scancode];
            } else {
                ascii = scancode_to_ascii[scancode];
            }
            
            if (ascii != 0) {
                *output = ascii;
                return 1;
            }
        }
    }
    return 0;
}