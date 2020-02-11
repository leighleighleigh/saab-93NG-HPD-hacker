#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include <SC16IS752.h> // Dual UART interface

#define CS D8

SC16IS752 spiuart = SC16IS752(SC16IS750_PROTOCOL_SPI, CS);

#define baudrate_A 115200
#define baudrate_B 115200
#define GPIO 4

void setup()
{
  Serial.begin(115200);
  Serial.println("Start testing");

  // UART to Serial Bridge Initialization
  spiuart.begin(baudrate_A,baudrate_B); //baudrate setting

  if (spiuart.ping() != 1)
  {
    Serial.println("Device not found");
    while (1)
      ;
  }
  else
  {
    Serial.println("Device found");
  }

  spiuart.pinMode(GPIO, OUTPUT);
  spiuart.digitalWrite(GPIO, LOW);

  Serial.println("Start serial communication");
  Serial.println("start serial communication");
  Serial.print("baudrate(channel A) = ");
  Serial.println(baudrate_A);
  Serial.print("baudrate(channel B) = ");
  Serial.println(baudrate_B);
  delay(5000);
  
}

void loop()
{
  // Print to CHANNEL A
  spiuart.write(SC16IS752_CHANNEL_A,0x41);
  spiuart.digitalWrite(GPIO, HIGH);

  delay(10);

  if (spiuart.available(SC16IS752_CHANNEL_B) > 0)
  {
    // read the incoming byte:
    char c = spiuart.read(SC16IS752_CHANNEL_B);
    Serial.print("Channel B=[");
    Serial.write(c);
    Serial.println("]");
  }

  delay(100);
}
