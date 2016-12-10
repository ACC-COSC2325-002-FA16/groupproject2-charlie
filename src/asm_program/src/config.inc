; configuration for LCD
#include <avr/io.h>
#include "../include/AVRSpecialRegs.inc"

#define LCD_DPRT 	11
#define LCD_DDDR 	10

#define LCD_CPRT 	5
#define LCD_CDDR 	4


#define LCD_RS 		0
#define LCD_RW 		1
#define LCD_EN 		2