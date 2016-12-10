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

Table of Contents
=================

Assigned to Casey.

Something like...

	- Title page ----------------------------- 1
	- Table of contents ---------------------- 2
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