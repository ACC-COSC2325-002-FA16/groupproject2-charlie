; configuration for LCD
#include <avr/io.h>
#include "../include/AVRSpecialRegs.inc"


#define LCD_DPRT 	_PORTD	
#define LCD_DDDR 	_DDRD	 

#define LCD_CPRT 	_PORTB	
#define LCD_CDDR 	_DDRB	

; bit for register select
#define LCD_RS 		0

; bit for enable	
#define LCD_EN 		2	