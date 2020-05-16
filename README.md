# saab-sid-re-board
SAAB SID Reverse-Engineering Board.
A board to go in between the SAAB SID/HPD connector on 2003-2006 9-3 (Second Generation) Models, so that the UART-based protocol can be reverse engineered.

<img src="https://i.imgur.com/MEXQa4u.jpg" data-canonical-src="https://i.imgur.com/MEXQa4u.jpg" width="250" height="250" />

# Project structure
- /software
    - /esp8266_sid_board
      - This is the PlatformIO project, which is used to interface an esp8266 with the sid-board.
      - (Without a microcontroller driving the sid-board, nothing happens.)
      - For the prototype development, I'm using a NodeMCU v1.0 esp8266 dev board.
    - /esp86266_direct_pca82c250
      - Attempt to talk to can interfaces over software serial, and perform MITM that way.
    - /esp8266_serial_i2c_bridge
      - Attempt to use two ESP8266 boards, one for the SID and one for the ICM, and send data between them over I2C.
      - The logic here is that, the ESP8266 does not like switching between two SoftwareSerial interfaces on a single board.
- /sid-board-kicad 
  - This is the KiCad 5 project, currently holding the designs for a future SID BOARD V2.

# Project Status
- ~PCB has been made by JLPCB, is currently being shipped to me.~
- ~Components have been ordered, currently being shipped also.~
- First prototype PCB has been made, see observations below.

# Prototype #1
**General Notes**
- Very difficult to hand solder everything, especially the IC's, need to invest in solder paste.
- Bypass mode worked briefly, but then "burnt out". The tracks are too thin. Oops.

**Issues Faced / Current Project State**
CURRENTLY WAITING FOR VERSION 2 BOARD TO ARRIVE.

I didn't do any level shifting because I rushed the design, and I'm an idiot. Although I could talk to the dual UART to SPI/I2C chip, and I could even toggle it's GPIO pins, I could not get any serial data to or from the SID/ICM. 
By the time I had considered bodge-wiring the situation, I had accidentally killed the SCI16IS762 chip, which at the time was actually too expensive to justify buying another of. Hence, I attempted another approach:
 
I experimented heavily using software serial, as seen in the "esp8266_direct_pca82c250_sw_serial" folder, which was ultimately unsuccessful. I also experimented with using a 3.3V-compatible CAN controller interface, the SN65HVD232D, but that was also unsuccessful. It seems software serial, especially on the esp8266, is a terrible way to approach this.

I also tried using dual ESP8266 boards, and sending serial data over I2C between them, but even that didn't work!

After all that I was pretty busy with University, Work, building a bluetooth audio/handsfree module for the SAAB, COVID-19 life, and reverse-engineering the ICM2 display unit, so this project has been on the backburner.

**Improvements to be made in the second revision**
- [x] Add 5V TO 3.3V LEVEL SHIFTING between UART IC (TTL) and CAN-BUS INTERFACES (CMOS).
- [ ] Add test points to check power supplies and UART IC connections.
- [ ] Add IC orientation dots on silkscreen.
- [x] Increase track-widths between the two ICM<->SID connectors, as it can't handle the current load.
- [x] Tie UART RESET pin HIGH.
- [x] Add LED's to UART IC GPIO pins, for debugging and extra street cred.
- [ ] Use UART IC GPIO to enable/disable a CAN-bus true-bypass switch?
