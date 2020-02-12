# saab-sid-re-board
A board to go in between the SAAB SID/HPD connector on 2003+ 93 Gen2 Models, so that the UART-based protocol can be reverse engineered.

# Project structure
- /esp8266_sid_board
  - This is the PlatformIO project, which is used to interface an esp8266 with the sid-board.
  - (Without a microcontroller driving the sid-board, nothing happens.)
  - For the prototype development, I'm using a NodeMCU v1.0 esp8266 dev board.
- /sid-board 
  - This is the KiCad 5 project!

# Project Status
- ~PCB has been made by JLPCB, is currently being shipped to me.~
- ~Components have been ordered, currently being shipped also.~
- First prototype PCB has been made, see observations below.

# Prototype #1
![Prototype1](https://i.imgur.com/MEXQa4u.jpg)

- **General Notes**
- Very difficult to hand solder everything, especially the IC's, need to invest in solder paste.
- Bypass mode worked briefly, but then "burnt out". The tracks are too thin. Oops.

- **Improvements to be Made**
- Add 5V TO 3.3V LEVEL SHIFTING between UART IC (TTL) and CAN-BUS INTERFACES (CMOS).
- Add test points to check power supplies and UART IC connections.
- Add IC orientation dots on silkscreen.
- Increase track-widths between the two ICM<->SID connectors, as it can't handle the current load.
- Make CAN-bus bypass driven by the UART IC GPIOs.
- Tie UART RESET pin HIGH.
- Add LED's to UART IC GPIO pins, for debugging and extra street cred.
