# saab-sid-re-board
A board to go in between the SAAB SID/HPD connector on 2003+ 93 Gen2 Models, so that the UART-based protocol can be reverse engineered.

# Project structure
- /sid-board 
  - This is the KiCad 5 project!

# Project Status
- ~PCB has been made by JLPCB, is currently being shipped to me.~
- ~Components have been ordered, currently being shipped also.~
- First prototype PCB has been made, see observations below.

# Prototype #1
![Prototype1](https://i.imgur.com/MEXQa4u.jpg)

- ### General Notes
- Very difficult to hand solder everything, especially the IC's, need to invest in solder paste.
- Bypass mode worked briefly, but then "burnt out". The tracks are too thin. Oops.

- ### Improvements to be Made
- Add test points to check power supply, and the UART/CAN lines.
- Adjust layout of components for hand-soldering. Potentially replace some with through-hole components?
	- Alternatively, go "all-in" on SMD components.
- ADD IC ORIENTATION TO THE SILKSCREENS
- INCREASE TRACK WIDTH FOR SID-PASSTHROUGH
- Check TRACK WIDTH for LDO OUTPUTS.
- BYPASS SWITCH resets and breaks the UART IC. Need to rethink this.
- RESET PIN on UART IC is left floating, oops. It still works like this, but should be held HIGH.
- Add LED's to GPIO pins? Might be useful for debugging. Plus, LED's are cool.
