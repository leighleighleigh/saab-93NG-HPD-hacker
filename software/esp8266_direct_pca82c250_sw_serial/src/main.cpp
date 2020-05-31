#include <Arduino.h>
#include <SoftwareSerial.h>
#include <math.h>

SoftwareSerial serialPort(D5, D6); // RX, TX

#define sw_ser_baud 115200         // This is a known working BAUD rate for the DLA UART decoder.

void send_sid_data(byte len,byte* data)
{
  uint16_t sum = 0;
  
  sum += len;

  serialPort.write(len);
  
  //Serial.print("WRITE: "); 
  Serial.print(len,HEX);

  for(byte i = 0; i<len; i++)
  {
    serialPort.write(*data);
    Serial.print(",");
    Serial.print(*data,HEX);
    sum += *data;
    data = data + sizeof(byte);
  }

  Serial.print(",");
  serialPort.write(sum);
  Serial.print(sum,HEX);
}

void setup()
{
  Serial.begin(115200);
  Serial.println("\n\n\nSTART!");

  delay(1000);

  pinMode(D5,INPUT);
  pinMode(D6,OUTPUT);

  // Begin the software serials
  serialPort.begin(sw_ser_baud);

  serialPort.flush();

  serialPort.listen();

  // delay(1000);
  // byte dat[2] = {0x83,0x00};
  // send_sid_data(sizeof(dat) / sizeof(byte),dat);
  // delay(10);

  // delay(1000);
  // byte dat[11] = {0x11,0x00,0x00,0x00,0x00,0x14,0x2,0x1,0x46,0x4d,0x32};
  // send_sid_data(sizeof(dat) / sizeof(byte),dat);
  // delay(10);
}

byte cmd = 0;

void loop()
{

  Serial.print("SEND CMD: ");
  byte dat[2] = {0x81,0x0};
  send_sid_data(sizeof(dat) / sizeof(byte),dat);
  delay(50);

  if(serialPort.available() > 0){
    Serial.print(" GOT: ");
  
    while(serialPort.available() > 0)
    {
      Serial.print(serialPort.read(),HEX);
      Serial.print(",");
    } 
  }

  Serial.println("");
  delay(1000);

  Serial.print("SEND CMD: ");
  byte dat2[2] = {0x83,0x0};
  send_sid_data(sizeof(dat2) / sizeof(byte),dat2);
  delay(50);

  if(serialPort.available() > 0){
    Serial.print(" GOT: ");
  
    while(serialPort.available() > 0)
    {
      Serial.print(serialPort.read(),HEX);
      Serial.print(",");
    } 
  }

  Serial.println("");
  delay(1000);

  // Serial.print("SEND CMD: ");
  // Serial.print(cmd,HEX);

  // byte dat[2] = {cmd,0x0};
  // send_sid_data(sizeof(dat) / sizeof(byte),dat);
  // delay(50);

  // if(serialPort.available() > 0){
  //   Serial.print(" GOT: ");
  
  //   while(serialPort.available() > 0)
  //   {
  //     Serial.print(serialPort.read(),HEX);
  //     Serial.print(",");
  //   } 
  // }

  // Serial.println("");

  // delay(100);

  // cmd++;

  // if(cmd == 255)
  // {
  //   delay(30000);
  // }
}
