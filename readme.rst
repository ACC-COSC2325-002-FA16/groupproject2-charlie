#############
Report Format
#############

******************
Writing the report
******************

We will be compiling the following information into a Microsoft word report. It has been recommended we include screenshots in the report.

For now this is a temporary file that will serve as a starting point. 

Each segment has an official person assigned to it, but feel free and contribute to any segment you like in addition to your own.

**************
Report Outline
**************

Title page
==========

Assigned to Casey.

- identify the device and microcontroller platform your project used. 
- list all the team members names.

Group Project 2

LCD Display For Arduino

- Casey Sanchez
- Evan Coffey
- Bryan Newsome
- Amanda Hooge

Table of Contents
=================

Assigned to Casey.

Something like...

	- Introduction --------------------------- 3
	- The microcontroller platform ----------- 4
	- The test device ------------------------ 5
	- Development tools --------------------- 6
	- Your experiment ----------------------- 7
	- Conclusions -------------------------- 8
	- Contributions -------------------------- 9
	- Project code -------------------------- 10

Introduction
============

Assigned to Casey.

- describe the basic hardware components you chose to experiment with. 
- You should also describe the experiment you are going to conduct that demonstrates that hardware. 
- This section is not a detailed report on those components, just a basic introduction to the parts you ended up with, and the demonstration you decided to set up.

For our project, we decided to use the 16x2 LCD display and an Arduino microcontroller. To get it working all that was needed was around twelve jumper wires, a basic breadboard and the microcontroller. We decided to display a simple message on the LCD screen. This proved a very daunting task. After much research and meticulous reading of wiring diagrams, we were successful. [[[As soon as we were comfortable with the assembly language for the LCD, we were eager to add more components to our demonstration. Being in the holiday mood, we added blinking LED lights and a nice tune with the buzzer.]]

The Microcontroller Platform
============================

Assigned to Bryan.

- Describe the microcontroller board you are using. 
- This description should indicate where such boards can be obtained, and lay out the basic architecture of the board. 
- You can paste screen captures of diagrams from any documentation you find online. 
- You should describe the basic capabilities of the actual processor on the board. 
- Show a block diagram of the device indicating any special features you find that are interesting and useful in conducting your experiment.

The Test Device
===============

Assigned to Amanda.

- Describe the LCD and give an overview of what it might be used for. 
- Basically, describe what is involved in interacting with the device.
- Again, use screen captures of diagrams from documentation if you can.

Our project utilized an LCD, or Liquid Crystal Display, to display text on a screen. LCDs are widely available and can be more advantageous than their predecessor the LED display. Both technologies debuted in the early '60s and have low costs. The LCD though uses less power than the LED display and normally offers more graphics to print. Because they are easily programmed, LCDs can be found everywhere from TVs to tablets. LCDs even made flat screen TVs possible.  

The LCD used for our project has a 16x2 character grid, meaning 16 characters wide, 2 lines deep. Each character is a 5x7 pixel matrix. Other commonly used LCDs vary in size including 40x2, 20x2, 20x4, 16x1, 16x4, 40x4, and 8x1.

What makes programming the LCD so easy is it has its own chip. A lot of LCDs, ours included, are controlled by the HD44780 Hitachi Controller. These chips are all the same for whichever format display so it is up to the programmer to keep in mind the display's size. Memory is contained in 80 bytes of Display Data Random Access Memory, arranged in 2 lines of 40 addresses. Each memory location controls the corresponding location on the display even when there is no display there, as is the case for a 16x2 display. On the other hand, the larger 40x4 displays contain 2 chips to house twice the data. 

The LCDs come with either 14 or 16 interface pins and an LED backlight. The pins are ordered as follows:

- Vss Ground
- Vcc 5v power supply
- V0 contrast adjustment pin. Receives analog voltage input to adjust the display's contrast. 
- RS register select: command register (0) or data register (1)
- Rw read/write: write (0) or read (1), like check for busy flag
	rw to ground is permanently in write
- E enable: allows lcd to latch data at the pins when a high-to-pulse occurs
- DB0-DB7
	8-bit parallel data port
	or operation in 4 bit (db4-db7) 
- anode
- cathode for led backlight

The data pins can write to information sent with ASCII codes to the screen. To save I/O pins, the LCDs may be operated in 4-bit mode, instead of 8-bit mode. In either mode, the programmer can also choose to use time delays or utilize the busy flag to take the polling approach to delays.

The following table lists the commands available to interface with the LCD:

For our code, we initialized the 5x7 display, set the cursor and turned on the display, cleared the display, set the cursor to move right, and sent a message. In doing so, we utilized two functions one for sending commands, the other data. Our instructions were sent to the functions in R24. Each function either set the RS bit to send data or cleared the bit to send commands. Then a high to low pulse was sent through the enable pin. Of course, we also had to set up a delay function so each command would have enough time to finish before starting the next. 

Here is a cheat sheet of the commands:

(Hex)	Command

-  1	Clear display screen
-  2	Return home
-  4	Decrement cursor (shift cursor to left)
-  6	Increment cursor (shift cursor to right)
-  5	Shift display right
-  7	Shift display left
-  8	Display off, cursor off
-  A	Display off, cursor on
-  C	Display on, cursor off
-  E	Display on, cursor blinking
-  F	Display on, cursor blinking
-  10	Shift cursor position to left
-  14	Shift cursor position to right
-  18	Shift the entire display to the left
-  1C	Shift the entire display to the right
-  80	Force cursor to beginning of 1st line
-  C0	Force cursor to beginning of 2nd line
-  28	Initiate 2 lines of 5x7 matrix (D4-D7, 4-bit)
-  38	Initiate 2 lines of 5x7 matrix (D0-D7, 8-bit)

Once we had working code up and running (in assembly!), we played around with scrolling the text. Given more time, we plan on making our own characters to write to the LCD.

Development tools
=================

Assigned to Evan.

- Detail the tools you needed to obtain to work with the microcontroller and the device. 
- You also need to identify any additional software you needed to interact with your test device.

When we began our experiment, we used the Arduino IDE 1.6.13.  The software is open-source, written in Java, and works on Windows, Mac OS X, and Linux platforms.  It can load code in various different languages onto any Arduino microcontroller.  It was very easy to install and get started right away.  It even came pre-packaged with some helpful example code.  Eventually, we stopped using the IDE and started loading code onto the Arduino via the command line on Amanda’s Mac machine.

- with avr-gcc compiler
- The disassembler we used to get assembly language out of our C code is [__To__Be__Added___].

We communicated through email and collaborated on Github.  We also used Google to find various pieces of documentation which helped us complete the assignment.  No other development tools were needed.


Your Experiment
===============

Assigned to Evan.

- Describe the experiment you set up. 
- What led you to pick this particular experiment (hopefully it was not because it was easy!) 
- Be sure to show how your experiment was set up. 
- Show how the device is connected to the microcontroller.

Our objective from the beginning was simply to get the 16x2 LCD to display some text.  Given that that none of our group members felt confident writing the assembly language from scratch, we decided to think of other options.

We ended up trying a few, but before we could, we had to properly connect the LCD and our Arduino to a mutual breadboard.  A google search or two later, and we had documentation which assisted us with this.  We leaned in, put the wires in their place, and the screen lit up.  “Hello world,” at last!

The first code we loaded onto our microcontroller was C code that we ran through the Arduino IDE.  We knew that we’d eventually be turning in assembly language, but we wanted to make sure it worked before we got our hands dirty with the tough stuff.  It worked like a charm, so we packed up for the day.
The above took place a few days after the group project was assigned.  A week or so later, after some communication through email, chatting during lab time, and some internet research, we reconvened to try to get the LCD to work with assembly language code.

This is where things got hairy.  As I mentioned before, we wanted to find assembly language code and modify it for our specific needs, but at this point, we had a hard time finding working code anywhere on the internet.  We got very close with one attempt, finding some code that got the LCD to light up.  Unfortunately, however, we couldn’t successfully modify it to display text.  As much as we tried, for some reason, the only working assembly code we were able to produce was our disassembled C code.

Eventually, we decided that our best bet was simply to dig into the disassembled C code, make sense of it, trim the fat to make it more readable, and submit that.  After breaking once more to complete our assigned sections of the lab report and look over the assembly language code, we came together one last time to piece the report together and agree on the assembly language code we wanted to turn in.

Conclusions
===========

Assigned to Evan.

- What did you learn about hardware control from this project? 
- Did you get any ideas for other projects you might try in the future?

We learned that transmitting data from a computer to a device is as simple as buying some wires, a breadboard, and an Arduino, and sitting down to write (or find!) some code.  We only worked with one device, but it’s clear to see that one could let his or her imagination run wild with all of the gizmos available on the market today.

Our assignment was to submit code written in assembly language, but that’s not at all a requirement of using these gadgets.  Anyone with a basic understanding of programming and some experience with any popular high-level language could get started with microcontrollers.

Contributions
=============

Assigned to Casey, but we may each want to write something for ourselves?
Include a summary of each team members contributions to the project.

i.e. ...

Casey: 	
		- Title page
		- Table of contents 
		- Introduction
		- Contributions
Bryan:	
		- The microcontroller platform 
Amanda:	
		- The test device 
Evan:	
		- Development tools 
		- Your experiment
		- Conclusions

Project code
============

We all are working on this part.

- Include a listing of the code you used for this project.

***********************
Presenting your project
***********************

Our presentation may include our report projected onto the screen.

**********************
Submitting your report
**********************

We need to ask about this... each member has been asked to submit a copy of the report in their repos, but our repo is all together as a group...?