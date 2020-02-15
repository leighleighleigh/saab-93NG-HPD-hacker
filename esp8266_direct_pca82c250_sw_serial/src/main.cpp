#include <Arduino.h>
#include <SoftwareSerial.h>

SoftwareSerial swSer(D5,D6); // RX, TX
#define sw_ser_baud 57600

void setup()
{
  Serial.begin(115200);
  Serial.println("Start PCA82C250 Software Serial Monitor");  
  swSer.begin(sw_ser_baud);
  delay(2000);
}

void loop()
{
  while(swSer.available() > 0)
  {
    Serial.write(swSer.read());
  }
}
