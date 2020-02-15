#include <Arduino.h>
#include <SoftwareSerial.h>

SoftwareSerial swSer(D5,D6); // RX, TX
#define sw_ser_baud 55555

void setup()
{
  Serial.begin(115200);
  Serial.println("Start PCA82C250 Software Serial Monitor");  
  swSer.begin(sw_ser_baud);
  delay(2000);
}

void loop()
{
  bool printed = false;
  while(swSer.available() > 8)
  {
    Serial.print(swSer.read(),HEX);
    Serial.print(",");
    printed = true;
  }
  if(printed){
   Serial.println("");
}
}
