
C program to write to 16-pin LCD from Arduino
=============================================

* To load to board, edit Makefile for proper port, then:

..  code-block::    bash

    $ make load

* For disassembly, try:

..  code-block::    bash

    $ make
    $ make lcd.elf
    $ avr-objdump -S lcd.elf > lcd.s

* So far tested only for Mac.