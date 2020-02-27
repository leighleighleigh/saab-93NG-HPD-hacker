#include <Arduino.h>
#include <SoftwareSerial.h>
#include <math.h>

SoftwareSerial sidSerial(D5, D6); // RX, TX
SoftwareSerial icmSerial(D2, D3); // RX, TX
#define sw_ser_baud 56000

bool testMode = false; // In test mode, the TX pins are set high.
bool passthroughICMTOSID = true;
bool passthroughSIDTOICM = true;

void setup()
{
  Serial.begin(115200);
  Serial.println("Start PCA82C250 Software Serial Monitor");

  sidSerial.begin(sw_ser_baud);
  icmSerial.begin(sw_ser_baud);

  delay(2000);

  Serial.println("START!");
  if (testMode)
  {
    Serial.println("TEST MODE ENGAGED");
  }

  icmSerial.flush();
  sidSerial.flush();
  icmSerial.listen();
}

char inbound = ' ';
char buffer[128] = {0x0};
uint8_t bufindex = 0; // Dual function, is reset to zero before filling buffer, represents last filled char after buffer filled.

void loop()
{
  if (!testMode)
  {
    // Reset buffer index
    bufindex = 0;

    while (icmSerial.available())
    {
      inbound = icmSerial.read();
      // Store in buffer, increment bufindex
      buffer[bufindex++] = inbound;

      // Debugging
      Serial.print("ICMrx: ");
      Serial.print(inbound, HEX);
      Serial.println("");

      // Check for buffer overflow
      if(bufindex == 128)
      {
        // Break
        break;
      }
    }

    // If we filled some chars, then read them out to the sidSerial.
    if (bufindex != 0 && passthroughICMTOSID)
    {
      // Stop listening, this prevents doubled-up data.
      sidSerial.stopListening();

      for (int i = 0; i < bufindex; i++)
      {
        sidSerial.write(buffer[i]);
      }
      
      // Debug output
      Serial.print("SIDtx buflen ");
      Serial.println(bufindex);

      // Begin listening again
      sidSerial.listen();
    }

    return;
    
    // Reset buffer index
    bufindex = 0;

    while (sidSerial.available())
    {
      inbound = sidSerial.read();

      // Store in buffer, increment bufindex
      buffer[bufindex++] = inbound;

      // Debugging
      Serial.print("SIDrx: ");
      Serial.print(inbound, HEX);
      Serial.println("");

      // Check for buffer overflow
      if(bufindex == 128)
      {
        // Break
        break;
      }
    }

    // If we filled some chars, then read them out to the icmSerial.
    if (bufindex != 0 && passthroughSIDTOICM)
    {
      // Stop listening to prevent doubled-up data
      icmSerial.stopListening();

      for (int i = 0; i < bufindex; i++)
      {
        icmSerial.write(buffer[i]);
      }

      // Debug output
      Serial.print("ICMtx buflen ");
      Serial.println(bufindex);

      icmSerial.listen();
    }
  }
  else
  {
    delay(1000);

    // ICM -> SID
    // Clear buffers
    icmSerial.flush();
    sidSerial.flush();
    Serial.println(">ICM tx");
    // icmSerial.println("hello sid!");
    icmSerial.println("testtinjaowijdoiawjtesttinjaowijdoiawj!");
    delay(20);

    Serial.println("SID rx");
    // Print on ICM, read from SID
    while (sidSerial.available())
    {
      inbound = sidSerial.read();
      Serial.write(inbound);
    }

    delay(1000);

    // SID -> ICM
    // Clear buffers
    icmSerial.flush();
    sidSerial.flush();
    Serial.println(">SID tx");
    sidSerial.println("hello icm!");
    delay(20);

    Serial.println("ICM rx");
    // Print on ICM, read from SID
    while (icmSerial.available())
    {
      inbound = icmSerial.read();
      Serial.write(inbound);
    }
  }
}
