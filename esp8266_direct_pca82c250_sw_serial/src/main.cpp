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
  if(testMode)
  {
    Serial.println("TEST MODE ENGAGED");
  }

  icmSerial.flush();
  sidSerial.flush();
}

char inbound = ' ';

void loop()
{
  if (!testMode)
  {
    while (icmSerial.available())
    {
      inbound = icmSerial.read();

      Serial.print("ICMrx: ");
      Serial.print(inbound, HEX);
      Serial.println("");

      if (passthroughICMTOSID)
      {
          sidSerial.stopListening();
          sidSerial.write(inbound);
          sidSerial.listen();
      }
    }
    while (sidSerial.available())
    {
      inbound = sidSerial.read();

      Serial.print("SIDrx: ");
      Serial.print(inbound, HEX);
      Serial.println("");

      if (passthroughSIDTOICM)
      {
        icmSerial.stopListening();
        icmSerial.write(inbound);
        icmSerial.listen();
      }
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
