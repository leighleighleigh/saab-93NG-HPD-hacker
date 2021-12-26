# saab-93NG-HPD-hacker
A reverse-engineering and interfacing board for the Saab Information Display / High Position Display, on 2003-2006 9-3 (Second Generation) Models.

<p align="center">
<img src="https://github.com/leighleighleigh/saab-933NG-HPD-hacker/blob/main/media/pcb_v3.jpg?raw=true" width="640" height="303" alt="A square black circuit board with white text marked 'SAAB HPD INTERFACE v3' rests on a cream coloured benchtop." />
</p>

## Project Status (DEC **2021**)
The **third** prototype of the PCB has been assembled and tested, as of August **2020**.
During this testing period, mild success was had, and some text/images were displayed. The exact protocol is yet to be determined.

## Protocol Reverse Engineering
Please see [UART PROTOCOL](/UART_PROTOCOL.md) 

## Hardware Diagram
![hardware_diagram](/media/hardware_diagram.png)

## Project structure
```bash
├── data_dumps # Raw UART data, CSV files exported from 'KingstVIS' software
├── hardware # KICAD v5+ projects
├── media # Images and diagrams
├── software # PlatformIO projects for the microcontrollers used here
└── PROTOCOL.md # This is where the results of our efforts is stored
```