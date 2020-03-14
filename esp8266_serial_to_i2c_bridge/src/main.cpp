#include <Arduino.h>
#include <SoftwareSerial.h>
#include <Wire.h>

// This will attempt to send serial data over I2C.
// As transparently as possible.

SoftwareSerial swSer(D5, D6); // RX, TX
#define sw_ser_baud 56000     // This is a known working BAUD rate for the DLA UART decoder.

#define SCL_PIN D1
#define SDA_PIN D2

const int16_t I2C_MASTER = 0x42;
const int16_t I2C_SLAVE = 0x08;

bool isMaster = false;
bool discardFirst = true;

void receiveEvent(size_t howMany)
{

  Serial.print("i2c rx: ");

  bool skip = discardFirst;

  (void)howMany;
  while (Wire.available())
  {                       // slave may send less than requested
    char c = Wire.read(); // receive a byte as character
    if(skip)
    {
      skip = false;
      continue;
    }
    Serial.print(c);      // print the character
  }

  Serial.println(" ");

  if(isMaster)
  {
      // Reply
      Wire.beginTransmission(I2C_SLAVE);
      Wire.write("X");
      Wire.write("HI!");
      Wire.endTransmission(); 
  }
}

void setup()
{
  Serial.begin(115200);
  Serial.println("\n\n");
  delay(500);
  Serial.println("BOOT!");

  // Start with different addresses
  if (isMaster)
  {
    Serial.print("MASTER 0x");
    Serial.println(I2C_MASTER,HEX);
    Wire.begin(SDA_PIN, SCL_PIN, I2C_MASTER);
    Wire.onReceive(receiveEvent);
  }
  else
  {
    Serial.print("SLAVE 0x");
    Serial.println(I2C_SLAVE,HEX);
    Wire.begin(SDA_PIN, SCL_PIN, I2C_SLAVE);
    Wire.onReceive(receiveEvent);
  }

  swSer.begin(sw_ser_baud);

  Serial.println("START!");

  swSer.flush();
}

char inbound = ' ';

void loop()
{
  // Check for SWSER data
  if (swSer.available())
  {
    inbound = swSer.read();
    Serial.print("sw: ");
    Serial.println(inbound, HEX);
  }

  // Check for I2C buffer data, and send over swSER
  if(!isMaster)
  {
    Wire.beginTransmission(I2C_MASTER);
    Wire.write("X");
    Wire.write("HELLO!");
    Wire.endTransmission();
    delay(3000);
  }
}
