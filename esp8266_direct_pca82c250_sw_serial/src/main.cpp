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
  sidSerial.stopListening();

  // Flush buffers
  icmSerial.flush();
  sidSerial.flush();
}

char inbound = ' ';
uint8_t inboundCount = 0;
char busState = 'I';

void loop()
{
  if (busState == 'I')
  {
    // Stop listening to sidSerial while we send on it
    sidSerial.stopListening();

    bool printedHeader = false;

    while (icmSerial.available())
    {
      if (!printedHeader)
      {
        // Get all the icmSerial stuff
        Serial.print("ICM rx: ");
        printedHeader = true;
      }
      // Read from ICM
      inbound = icmSerial.read();
      // Write out to SID
      sidSerial.write(inbound);
      // Increment inboundCOUnt
      inboundCount++;
      // Debug that
      Serial.print(inbound, HEX);
    }
    if (printedHeader)
    {
      // Newline
      Serial.println("");
    }

    // Re-listen on SID
    sidSerial.listen();

    // If we have printed more than 2 chars, then we can go look for a reply!
    if (inboundCount >= 2)
    {
      Serial.println("Switching to bus state S");
      // Change busstate
      busState = 'S';
      // Reset inboundCount
      inboundCount = 0;
    }
  }
  else
  {
    // Stop listening to sidSerial while we send on it
    icmSerial.stopListening();

    bool printedHeader = false;

    // Get all the icmSerial stuff
    Serial.print("SID rx: ");
    while (sidSerial.available())
    {
      if (!printedHeader)
      {
        // Get all the icmSerial stuff
        Serial.print("SID rx: ");
        printedHeader = true;
      }
      // Read from SID
      inbound = sidSerial.read();
      // Write out to ICM
      icmSerial.write(inbound);
      // Increment inboundCOUnt
      inboundCount++;
      // Debug that
      Serial.print(inbound, HEX);
    }
    if (printedHeader)
    {
      // Newline
      Serial.println("");
    }

    // Re-listen on ICM
    icmSerial.listen();

    // If we have printed more than 2 chars, then we can go look for a reply!
    if (inboundCount >= 2)
    {
      Serial.println("Switching to bus state I");
      // Change busstate
      busState = 'I';
      // Reset inboundCount
      inboundCount = 0;
    }
  }
}
