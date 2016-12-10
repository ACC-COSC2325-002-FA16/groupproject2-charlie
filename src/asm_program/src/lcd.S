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
            out     LCD_DPRT, r24           
            cbi     LCD_CPRT, LCD_RS        
            cbi     LCD_CPRT, LCD_RW        
            sbi     LCD_CPRT, LCD_EN                        
            
            ldi     r24, 0x01              
            ldi     r25, 0x00              
            call    delay                            
            
            cbi     LCD_CPRT, LCD_EN        

            ldi     r24, 0x64               ; 100
            ldi     r25, 0x00              
            jmp     delay                 

datawrite:
            out     LCD_DPRT, r24           
            sbi     LCD_CPRT, LCD_RS        
            cbi     LCD_CPRT, LCD_RW        
            sbi     LCD_CPRT, LCD_EN        
            
            ldi     r24, 0x01              
            ldi     r25, 0x00               
            call    delay                
            
            cbi     LCD_CPRT, LCD_EN        
            
            ldi     r24, 0x64               ; 100
            ldi     r25, 0x00             
            jmp     delay                 

main:
            ldi     R24,0xFF;               
            out     LCD_DDDR, R24   
            out     LCD_CDDR, R24   
            cbi     LCD_CPRT,LCD_EN 
    
            ldi     r24, 0xD0               ; 208
            ldi     r25, 0x07               ; 7
    
            call    delay            
            ldi     r24,0x38                ; 6           
            CALL    commandwrite 
    
            ldi     r24, 0xD0               ; 208
            ldi     r25, 0x07               ; 7
    
            call    delay            
            ldi     r24,0x0E                ; 14             
            CALL    commandwrite 
    
            ldi     R24,0x01                
            CALL    commandwrite 
    
            ldi r24, 0xD0                   ; 208
            ldi r25, 0x07                   ; 7
    
            call    delay             
            ldi     r24, 0x06               ; 6
            call    commandwrite             
    
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

            rjmp    exit

exit:
        rjmp exit


