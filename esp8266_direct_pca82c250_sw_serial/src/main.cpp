#include <Arduino.h>
#include <SoftwareSerial.h>
#include <math.h>

SoftwareSerial sidSerial(D2, D3); // RX, TX
SoftwareSerial icmSerial(D5, D6); // RX, TX
#define sw_ser_baud 56000         // This is a known working BAUD rate for the DLA UART decoder.

void setup()
{
  Serial.begin(115200);
  Serial.println("\n\n\nSTART!");

  // Begin the software serials
  sidSerial.begin(sw_ser_baud);
  icmSerial.begin(sw_ser_baud);

  // Listen on icmSerial first
  icmSerial.listen();
  sidSerial.listen();

  // Flush buffers
  icmSerial.flush();
  sidSerial.flush();
}

char inbound[64] = {0};
uint8_t inboundIndex = 0;

void loop()
{
  while(icmSerial.available() > 2)
  {
    inbound[inboundIndex++] = icmSerial.read();
  }

  // Send it if it filled up
  if(inboundIndex != 0)
  {
    sidSerial.stopListening();
    Serial.print("sid tx: ");
    for(int i = 0; i<inboundIndex; i++)
    {
      sidSerial.write(inbound[i]);
      Serial.print(inbound[i],HEX);
    }
    Serial.println("");
    sidSerial.listen();
    inboundIndex = 0;
  }
}
