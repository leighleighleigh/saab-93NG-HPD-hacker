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

  pinMode(D2, INPUT_PULLUP);
  pinMode(D3, INPUT_PULLUP);
  pinMode(D5, INPUT_PULLUP);
  pinMode(D6, INPUT_PULLUP);

  // Begin the software serials
  sidSerial.begin(sw_ser_baud)
  sidSerial.begin(sw_ser_baud);
  icmSerial.begin(sw_ser_baud);

  icmSerial.flush();
  sidSerial.flush();

  sidSerial.listen();
  icmSerial.listen();
}

char inboundBuf[64] = {0};
uint8_t inboundBufIndex = 0;

void loop()
{
  inboundBufIndex = 0;
  if (icmSerial.available() > 2)
  {
    while (icmSerial.available() > 0)
    {
      inboundBuf[inboundBufIndex++] = icmSerial.read();
      if (inboundBufIndex == 64)
      {
        break;
      }
    }
  }

  if (inboundBufIndex != 0)
  {
    sidSerial.stopListening();
    for (int i = 0; i < inboundBufIndex; i++)
    {
      sidSerial.write(inboundBuf[i]);
      Serial.print("ICM: ");
      Serial.print(inboundBuf[i], HEX);
      Serial.println(" ");
    }
    sidSerial.listen();
  }


  inboundBufIndex = 0;

  if (sidSerial.available() >= 2)
  {
    while (sidSerial.available() > 0)
    {
      inboundBuf[inboundBufIndex++] = sidSerial.read();
      if (inboundBufIndex == 64)
      {
        break;
      }
    }
  }

  if (inboundBufIndex != 0)
  {
    icmSerial.stopListening();
    for (int i = 0; i < inboundBufIndex; i++)
    {
      icmSerial.write(inboundBuf[i]);
      Serial.print("SID: ");
      Serial.print(inboundBuf[i], HEX);
      Serial.println(" ");
    }
    icmSerial.listen();
  }
}
