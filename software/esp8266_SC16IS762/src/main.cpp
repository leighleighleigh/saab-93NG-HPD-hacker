#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include <SC16IS752.h> // Dual UART interface

#define CS D8

SC16IS752 spiuart = SC16IS752(SC16IS750_PROTOCOL_SPI, CS);

// Old baudrate for freq compensation is 101952

#define baudrate_A 9600
#define baudrate_B 9600

void send_sid_data(byte channel,byte len,byte* data)
{
  uint16_t sum;
  
  sum += len;

  spiuart.write(channel,len);
  
  if(channel == 0){
    Serial.print("TX A [");
  }
  else{
    Serial.print("TX B [");
  }

  Serial.print(len,HEX);
  Serial.print("]:");

  for(byte i = 0; i<len; i++)
  {
    spiuart.write(channel,*data);
    Serial.print(*data,HEX);
    Serial.print(",");
    sum += *data;
    data = data + sizeof(byte);
  }

  // Send the LSB of the sum.
  sum = sum & 0b11111111;
  spiuart.write(channel,sum);
  Serial.print(sum,HEX);
  Serial.println("...");
}

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

  
  spiuart.flush(SC16IS752_CHANNEL_A);
  spiuart.flush(SC16IS752_CHANNEL_B);

  byte dat[4] = {0x2,0x81,0x00,0x83};
  send_sid_data(SC16IS752_CHANNEL_A,sizeof(dat) / sizeof(byte),dat);
  delay(10);
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
  if(spiuart.available(SC16IS752_CHANNEL_A) > 0){
    Serial.print("RX A: ");
    while (spiuart.available(SC16IS752_CHANNEL_A) > 0)
    {
      // read the incoming byte:
      char c = spiuart.read(SC16IS752_CHANNEL_A);
      Serial.print(c,HEX);
      Serial.print(",");
    }
    Serial.println(".");
    // delay(1000);
  }

  if(spiuart.available(SC16IS752_CHANNEL_B) > 0){
    Serial.print("RX B: ");
    while (spiuart.available(SC16IS752_CHANNEL_B) > 0)
    {
      // read the incoming byte:
      char c = spiuart.read(SC16IS752_CHANNEL_B);
      Serial.print(c,HEX);
      Serial.print(",");
    }
    Serial.println(".");
    // delay(1000);
  }
  
  numberToGPIO(val);
  val++;

  delay(1000);
  
  Serial.println("...");

  byte dat[4] = {0x1,0x2,0x3,0x4};
  send_sid_data(SC16IS752_CHANNEL_A,sizeof(dat) / sizeof(byte),dat);

  byte dat2[4] = {0x4,0x3,0x2,0x1};
  send_sid_data(SC16IS752_CHANNEL_B,sizeof(dat2) / sizeof(byte),dat2);

  delay(1000);
}
