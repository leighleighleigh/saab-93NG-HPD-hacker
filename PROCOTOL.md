Thanks to users ruthenianboy and bojer of trionictuning.com for their work in reverse-engineering the protocol of the SID!
I have documented their findings here for future reference:

Interface: 115200baud UART over CAN physical layer.
Command frame format: DLC[1] + CONTENT[x] + CRC[1], CRC being the MSB of the sum of all previous bytes.
Response frame types: ACK, NACK, ERROR, VALUE ...

MISC:
Panel resolution (green) is 384x64 px
Icon resolution (orange) is 64x64 px
