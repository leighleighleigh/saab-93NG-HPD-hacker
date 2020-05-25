#include <Arduino.h>
#include <SoftwareSerial.h>
#include <math.h>

SoftwareSerial sidSerial(D2, D3); // RX, TX

#define sw_ser_baud 115200         // This is a known working BAUD rate for the DLA UART decoder.


void send_sid_data(byte len,byte* data)
{
  uint16_t sum;
  
  sum += len;

  sidSerial.write(3);
  
  Serial.println(len,HEX);

  for(byte i = 0; i<len; i++)
  {
    sidSerial.write(*data);
    Serial.println(*data,HEX);
    sum += *data;
    data = data + sizeof(byte);
  }

  sidSerial.write(sum);
  Serial.println(sum,HEX);
}

void setup()
{
  Serial.begin(115200);
  Serial.println("\n\n\nSTART!");

  delay(1000);

  pinMode(D2, INPUT);
  pinMode(D3, INPUT);
  pinMode(D5, INPUT);
  pinMode(D6, INPUT);

  // Begin the software serials
  sidSerial.begin(sw_ser_baud);

  sidSerial.flush();

  sidSerial.listen();

  byte dat[3] = {0x10,0x11,0x12};
  send_sid_data(sizeof(dat) / sizeof(byte),dat);
  delay(10);
}

void loop()
{
  if(sidSerial.available() > 0){
    Serial.println("READ: ");
  }
  while(sidSerial.available() > 0)
  {
    Serial.print(sidSerial.read());
    Serial.print(",");
  } 
}
