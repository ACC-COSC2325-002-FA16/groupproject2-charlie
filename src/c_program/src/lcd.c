#include <avr/io.h>
#include <util/delay.h>

#define LCD_DPRT PORTD
#define LCD_DDDR DDRD
#define LCD_DPIN PIND
#define LCD_CPRT PORTB
#define LCD_CDDR DDRB
#define LCD_CPIN PINB
#define LCD_RS 0
#define LCD_RW 1
#define LCD_EN 2

void delay_us(unsigned int d)
{
    while (d-- > 0) 
    {
        _delay_us(1);
    }
}

void lcdCommand(unsigned char cmnd)
{
    LCD_DPRT = cmnd;
    LCD_CPRT &= ~ (1<<LCD_RS);
    LCD_CPRT &= ~ (1<<LCD_RW);
    LCD_CPRT |= (1<<LCD_EN);
    delay_us(1);
    LCD_CPRT &= ~ (1<<LCD_EN);
    delay_us(100);
}

void lcdData(unsigned char data)
{
    LCD_DPRT = data;
    LCD_CPRT |= (1<<LCD_RS);
    LCD_CPRT &= ~ (1<<LCD_RW);
    LCD_CPRT |= (1<<LCD_EN);
    delay_us(1);
    LCD_CPRT &= ~ (1<<LCD_EN);
    delay_us(100);
}

void lcd_init()
{
    LCD_DDDR = 0xFF;
    LCD_CDDR = 0xFF;

    LCD_CPRT &=~(1<<LCD_EN);
    delay_us(2000);
    lcdCommand(0x38);
    lcdCommand(0x0E);
    lcdCommand(0x01);
    delay_us(2000);
    lcdCommand(0x06);
}

void lcd_gotoxy(unsigned char x, unsigned char y)
{
    unsigned char firstCharAdr[] = {0x80, 0xC0, 0x94, 0xD4} ;
    lcdCommand(firstCharAdr[y-1]+x-1);
    delay_us(100);
}

void lcd_print (char * str)
{
    unsigned char i = 0;
    while (str[i] != 0)
    {
        lcdData (str[i]);
        i++;
    }
}

int main (void)
{
    lcd_init();
    lcd_gotoxy(1,1);
    lcd_print("Merry");
    lcd_gotoxy(1,2);
    lcd_print("Christmas");

    while(1);
    return 0;
}