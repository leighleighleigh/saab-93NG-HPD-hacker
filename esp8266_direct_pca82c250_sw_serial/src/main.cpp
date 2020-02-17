#include <Arduino.h>
#include <SoftwareSerial.h>

SoftwareSerial sidSerial(D6, D7); // RX, TX
SoftwareSerial icmSerial(D4, D5); // RX, TX
#define sw_ser_baud 56000

bool passthroughICMTOSID = true;
bool passthroughSIDTOICM = true;
bool showTX = false;

void setup()
{
  Serial.begin(115200);
  Serial.println("Start PCA82C250 Software Serial Monitor");

  sidSerial.begin(sw_ser_baud);
  icmSerial.begin(sw_ser_baud);

  delay(2000);

  Serial.println("START!");
}

char inbound = ' ';

void loop()
{
  // sidSerial.listen();
  if (sidSerial.available())
  {
    inbound = sidSerial.read();

    Serial.print("SID: ");
    Serial.print(inbound, HEX);
    Serial.println("");

    if (passthroughSIDTOICM)
    {
      icmSerial.stopListening();
      icmSerial.write(inbound);
      if (showTX)
      {
        Serial.print(">>>ICM: ");
        Serial.print(inbound, HEX);
        Serial.println("");
      }
      icmSerial.listen();
    }
  }

  // icmSerial.listen();
  if (icmSerial.available())
  {
    inbound = icmSerial.read();

    Serial.print("ICM: ");
    Serial.print(inbound, HEX);
    Serial.println("");

    if (passthroughICMTOSID)
    {
      sidSerial.stopListening();
      if (showTX)
      {
        Serial.print(">>>SID: ");
        Serial.print(inbound, HEX);
        Serial.println("");
      }
      sidSerial.write(inbound);
      sidSerial.listen();
    }
  }
}
