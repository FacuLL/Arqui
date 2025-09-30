#ifndef pollingKeyboard_h
#define pollingKeyboard_h

    int readKeyBoard(unsigned char * output);


    // Ejemplo uso en kernel space
    // ncPrint("Teclas presionadas: ");

	// unsigned char output;
	// while (1) {
	// 	if (readKeyBoard(&output)) {
	// 		ncPrintChar(output);
	// 	}
	// }

#endif