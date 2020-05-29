#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include <SC16IS752.h> // Dual UART interface

#define CS D8

SC16IS752 spiuart = SC16IS752(SC16IS750_PROTOCOL_SPI, CS);

#define baudrate_A 101952
#define baudrate_B 101952

void setup()
{
  Serial.begin(115200);
  Serial.println("Start testing");

  delay(1000);

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

  // SETUP GPIO
  for(int gpioPin = 0; gpioPin < 8; gpioPin++){
    spiuart.pinMode(gpioPin, OUTPUT);
    spiuart.digitalWrite(gpioPin, HIGH);
  }

  // Setup loopback
  spiuart.LoopbackEnable(false);

  Serial.println("Start serial communication");
  Serial.println("start serial communication");
  Serial.print("baudrate(channel A) = ");
  Serial.println(baudrate_A);
  Serial.print("baudrate(channel B) = ");
  Serial.println(baudrate_B);
  delay(1000);
  
}

int val = 0;

void numberToGPIO(uint8_t val)
{
  for(int gpioPin = 7; gpioPin > -1; gpioPin--){
    spiuart.digitalWrite(gpioPin, val & 1);
    val = val >> 1;
  }
}

void loop()
{
  spiuart.write(SC16IS752_CHANNEL_A,'A');
  spiuart.write(SC16IS752_CHANNEL_A,'B');
  spiuart.write(SC16IS752_CHANNEL_A,'C');
  spiuart.write(SC16IS752_CHANNEL_A,'D');
  spiuart.write(SC16IS752_CHANNEL_A,'E');
  spiuart.write(SC16IS752_CHANNEL_A,'F');

  // if(spiuart.available(SC16IS752_CHANNEL_A) > 0){
  //   Serial.print("A: ");
  //   while (spiuart.available(SC16IS752_CHANNEL_A) > 0)
  //   {
  //     // read the incoming byte:
  //     char c = spiuart.read(SC16IS752_CHANNEL_A);
  //     Serial.write(c);
  //   }
  //   Serial.println("");

  //   delay(1000);
  // }
  
  numberToGPIO(val);
  val++;

  delay(100);
}
