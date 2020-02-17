#include <Arduino.h>
#include <SoftwareSerial.h>

SoftwareSerial sidSerial(D5,D6); // RX, TX
SoftwareSerial icmSerial(D7,D8); // RX, TX
#define sw_ser_baud 57600

bool passthrough = true;

void setup()
{
  Serial.begin(115200);
  Serial.println("Start PCA82C250 Software Serial Monitor");  

  if(passthrough)
  {
    Serial.println("PASSTHROUGH ENABLED");
  }

  sidSerial.begin(sw_ser_baud);
  icmSerial.begin(sw_ser_baud);
  delay(2000);
}

void loop()
{
  while(sidSerial.available() > 0)
  {
    char inbound = sidSerial.read();

    Serial.print("SID: ");
    Serial.write(inbound);
    Serial.println("");

    if(passthrough)
    {
      icmSerial.write(inbound);
    }
  }
  while(icmSerial.available() > 0)
  {
    char inbound = icmSerial.read();

    Serial.print("ICM: ");
    Serial.write(inbound);
    Serial.println("");

    if(passthrough)
    {
      sidSerial.write(inbound);
    }
  }
  if(printed){
   Serial.println("");
}
}
