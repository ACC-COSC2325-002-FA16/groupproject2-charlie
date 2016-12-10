; configuration for LCD
#include <avr/io.h>
#include "../include/AVRSpecialRegs.inc"

; PortD is LCD data port
#define LCD_DPRT 	11	
#define LCD_DDDR 	10	 

; PortB is LCD command port
#define LCD_CPRT 	5	
#define LCD_CDDR 	4	

; bit for register select
#define LCD_RS 		0
; bit for read/write	 
#define LCD_RW 		1 
; bit for enable	
#define LCD_EN 		2	