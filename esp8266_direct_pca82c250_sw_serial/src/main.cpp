#include <Arduino.h>
#include <SoftwareSerial.h>

SoftwareSerial sidSerial(D5, D6); // RX, TX
SoftwareSerial icmSerial(D2, D3); // RX, TX
#define sw_ser_baud 56000

bool testMode = false;
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
  // delay(50);
  if(!testMode){
  // sidSerial.listen();
  while (sidSerial.available())
  {
    inbound = sidSerial.read();

    Serial.print("  SID: ");
    Serial.print(inbound, HEX);
    Serial.println("");

    if (passthroughSIDTOICM)
    {
      if(inbound != 0)
      {
      // If it's a zero, don't send
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
  }

  // icmSerial.listen();
  while (icmSerial.available())
  {
    inbound = icmSerial.read();

    Serial.print("ICM: ");
    Serial.print(inbound, HEX);
    Serial.println("");

    if (passthroughICMTOSID)
    {
      if(inbound != 0)
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
  }else{    
    while (icmSerial.available())
    {
      inbound = icmSerial.read();

      Serial.print("ICM: ");
      Serial.print(inbound, HEX);
      Serial.println("");
    }
  }
}
