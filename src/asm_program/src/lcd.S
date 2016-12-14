; LCD for AVR
#include "config.inc"

        .section .text
        .global     main        
        .org        0x0000

        ; set up the stack
            ldi     r28, (RAMEND & 0x00ff)
            ldi     r29, (RAMEND >> 8)
            out     _SPH, r29
            out     _SPL, r28    
            eor     r1, r1                  
            out     _SREG, r1     
            call    main
            jmp     exit

delay:
            sbiw    r24, 0x00              
            breq    3f            
            ldi     r18, 0x05               
        2:      
            dec     r18
            brne    2b  
            nop
            sbiw    r24, 0x01               
            rjmp    delay        
        3:
            ret

commandwrite:
            out     LCD_DPRT, r24           ; load the command 
            cbi     LCD_CPRT, LCD_RS        ; turn on commanding
            
            sbi     LCD_CPRT, LCD_EN        ; enable = 1                          
            ldi     r24, 0x01              
            ldi     r25, 0x00              
            call    delay                                       
            cbi     LCD_CPRT, LCD_EN        ; enable = 0 for H->L pulse

            ldi     r24, 0x64               ; 100
            ldi     r25, 0x00              
            jmp     delay                 

datawrite:
            out     LCD_DPRT, r24           ; load the data 
            sbi     LCD_CPRT, LCD_RS        ; turn on data sending

            sbi     LCD_CPRT, LCD_EN        ; enable = 1                       
            ldi     r24, 0x01              
            ldi     r25, 0x00               
            call    delay                            
            cbi     LCD_CPRT, LCD_EN        ; enable = 0 for H->L pulse
            
            ldi     r24, 0x64               ; 100
            ldi     r25, 0x00             
            jmp     delay                 

message:
            ldi     R24, 0x4d               ;'M'                 
            call    datawrite
            ldi     R24, 0x65               ;'e'                 
            call    datawrite
            ldi     R24, 0x72               ;'r'                 
            call    datawrite
            ldi     R24, 0x72               ;'r'                 
            call    datawrite
            ldi     R24, 0x79               ;'y'                 
            call    datawrite
            ldi     R24, 0x20               ;' '                 
            call    datawrite
            ldi     R24, 0x58               ;'X'                 
            call    datawrite
            ldi     R24, 0x2d               ;'-'                 
            call    datawrite
            ldi     R24, 0x6d               ;'m'                 
            call    datawrite
            ldi     R24, 0x61               ;'a'                 
            call    datawrite
            ldi     R24, 0x73               ;'s'                 
            call    datawrite
            ret

main:
            ldi     R24,0xFF                
            out     LCD_DDDR, R24           ; turning on output mode
            out     LCD_CDDR, R24           ; turning on output mode
            cbi     LCD_CPRT,LCD_EN         ; enable = 0
    
            ldi     r24, 0xD0               ; 208
            ldi     r25, 0x07               ; 7  
            call    delay            
            ldi     r24,0x38                ; command to init LCD to 5x7 matrix           
            CALL    commandwrite 
    
            ldi     r24, 0xD0               ; 208
            ldi     r25, 0x07               ; 7   
            call    delay            
            ldi     r24,0x0E                ; command to turn display on, & cursor blink             
            CALL    commandwrite 
    
start:
            ldi     R24,0x01                ; clear display
            CALL    commandwrite 
    
            ldi     r24, 0xD0               ; 208
            ldi     r25, 0x07               ; 7   
            call    delay             
            ldi     r24, 0x06               ; command to shift cursor right
            call    commandwrite             
    
            call    message

            ldi     r26, 7                  ; seven spaces before next message
spaces:        
            ldi     R24, 0x20               ;' '                 
            call    datawrite
            dec     r26
            cpi     r26, 0
            brne    spaces

            call    message

scroll:  
            ldi     r24, 0xFF               
            ldi     r25, 0xFF                
            call    delay
            ldi     r24, 0xFF               
            ldi     r25, 0xFF                
            call    delay
            ldi     r24, 0xFF               
            ldi     r25, 0xFF                
            call    delay
            ldi     r24, 0xFF               
            ldi     r25, 0xFF                
            call    delay

            ldi     R24,0x18                ; command to move display to the left
            call    commandwrite

            jmp    scroll

exit:
            rjmp exit
