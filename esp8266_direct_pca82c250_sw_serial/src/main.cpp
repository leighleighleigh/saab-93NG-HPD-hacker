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

  delay(1000);

  pinMode(D2,INPUT_PULLUP);
  pinMode(D3,INPUT_PULLUP);
  pinMode(D5,INPUT_PULLUP);
  pinMode(D6,INPUT_PULLUP);

  // Begin the software serials
  sidSerial.begin(sw_ser_baud);
  icmSerial.begin(sw_ser_baud);

  icmSerial.flush();
  sidSerial.flush();

  Serial.println("(listen ICM)");
  icmSerial.listen();
  sidSerial.stopListening();
}

char inboundBuf[64] = {0};
uint8_t inboundBufIndex = 0;
bool hasData = false;

void loop()
{

  inboundBufIndex = 0;
  hasData = false;
  while(icmSerial.available() > 0)
  {
    hasData = true;
    inboundBuf[inboundBufIndex++] = icmSerial.read();
    if(inboundBufIndex == 64)
    {
      break;
    }
  }

  if(hasData){
    // Stop listening on icm!
    sidSerial.stopListening();
    icmSerial.stopListening();

    for(int i = 0; i<inboundBufIndex;i++)
    {
      sidSerial.write(inboundBuf[i]);
      Serial.print("ICMrx: 0x");
      Serial.print(inboundBuf[i],HEX);
      Serial.println(" ");
      Serial.print("SIDtx: 0x");
      Serial.print(inboundBuf[i],HEX);
      Serial.println(" ");
    }
    if(inboundBufIndex < 64)
    {
      Serial.println("END");
    }
    Serial.println("");
    sidSerial.listen();
    Serial.println("(listen SID)");
  }
  
  
  inboundBufIndex = 0;
  hasData = false;
  while(sidSerial.available() > 0)
  {
    hasData = true;
    inboundBuf[inboundBufIndex++] = sidSerial.read();
    if(inboundBufIndex == 64)
    {
      break;
    }
  }
  
  if(hasData){
    // Stop listening on SID!
    icmSerial.stopListening();
    sidSerial.stopListening();
    
    for(int i = 0; i<inboundBufIndex;i++)
    {
      icmSerial.write(inboundBuf[i]);
      Serial.print("SIDrx: 0x");
      Serial.print(inboundBuf[i],HEX);
      Serial.println(" ");
      Serial.print("ICMtx: 0x");
      Serial.print(inboundBuf[i],HEX);
      Serial.println(" ");
    }
    if(inboundBufIndex < 64)
    {
      Serial.println("END");
    }
    Serial.println("");
    icmSerial.listen();
    Serial.println("(listen ICM)");
  }
}
