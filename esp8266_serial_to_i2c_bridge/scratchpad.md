Issues I think
- When transmitting on the softwareserial, it also sticks itself into the "recieving" buffer of the other softwareserial.
- This creates a feedback loop I think, or atleast that is the behaviour that is being exhibited.

Maybe things to try.
- Use an ESP32 with hardwareserial capabilities. 
- This might behave better but idek.
- Or use the SCI61 dual UART thing like I was going to originally.

Try another SoftwareSerial library, like ALT SOFT SERIAL?
Definitely try AltSoftSerial.