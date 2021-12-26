# saab-sid-re-board
SAAB SID Reverse-Engineering Board.
A board to go in between the SAAB SID/HPD connector on 2003-2006 9-3 (Second Generation) Models, so that the UART-based protocol can be reverse engineered.

<img src="https://github.com/leighleighleigh/saab-sid-re-board/blob/main/media/pcb_v3.jpg?raw=true" width="250" height="250" alt="A square black circuit board with white text marked 'SAAB HPD INTERFACE v3' rests on a cream coloured benchtop." />

## Project Status (DEC **2021**)
The **third** prototype of the PCB has been assembled and tested, as of August **2020**.
During this testing period, mild success was had, and some text/images were displayed. The exact protocol is yet to be determined.

## Protocol Reverse Engineering
Please see [PROTOCOL](/PROTOCOL.md) 

## Project structure
```bash
├── data_dumps # CSV files exported from 'KingstVIS' Digital Logic Analyser software, from the SID UART signals.
├── hardware # KICAD v5+ projects
├── media # Images and diagrams
├── software # PlatformIO projects for the microcontrollers used here
└── PROTOCOL.md # This is where the results of our efforts is stored
```