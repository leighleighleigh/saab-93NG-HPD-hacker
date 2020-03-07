#include <Arduino.h>
#include <SoftwareSerial.h>
#include <math.h>


SoftwareSerial sidSerial(D5, D6); // RX, TX
SoftwareSerial icmSerial(D2, D3); // RX, TX
#define sw_ser_baud 56000 // This is a known working BAUD rate for the DLA UART decoder.

bool testMode = false; // In test mode, the TX pins are set high.

void setup()
{
  Serial.begin(115200);
  Serial.println("Start PCA82C250 Software Serial Monitor");

  sidSerial.begin(sw_ser_baud);
  icmSerial.begin(sw_ser_baud);

  delay(2000);

  Serial.println("START!");
  if (testMode)
  {
    Serial.println("TEST MODE ENGAGED");
  }

  icmSerial.flush();
  sidSerial.flush();
  sidSerial.listen();
  icmSerial.listen();
}

char inbound = ' ';

void loop()
{
  if (!testMode)
  {
    while (icmSerial.available()) {      // If anything comes in Serial (USB),
      sidSerial.write(icmSerial.read());   // read it and send it out Serial1 (pins 0 & 1)
      Serial.print("ICM: ");
      Serial.println(icmSerial.read(), HEX);
    }

    while (sidSerial.available()) {     // If anything comes in Serial1 (pins 0 & 1)
      icmSerial.write(sidSerial.read());   // read it and send it out Serial (USB)
      Serial.print("SID: ");
      Serial.println(sidSerial.read(), HEX);
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
    Serial.println("!abcdefghijklmnopqrstuvwxyz!123456789090!");
    icmSerial.println("!abcdefghijklmnopqrstuvwxyz!123456789090!");
    delay(50);

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
    Serial.println("hello icm!");
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
