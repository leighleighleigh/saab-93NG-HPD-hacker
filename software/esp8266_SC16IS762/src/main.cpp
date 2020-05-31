#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include <SC16IS752.h> // Dual UART interface

#define CS D8

SC16IS752 spiuart = SC16IS752(SC16IS750_PROTOCOL_SPI, CS);

// Old baudrate for freq compensation is 101952

#define baudrate_A 115200
#define baudrate_B 115200

void send_sid_data(byte len,byte* data)
{
  uint16_t sum;
  
  sum += len;

  spiuart.write(SC16IS752_CHANNEL_A,len);
  
  Serial.println(len,HEX);

  for(byte i = 0; i<len; i++)
  {
    spiuart.write(SC16IS752_CHANNEL_A,*data);
    Serial.println(*data,HEX);
    sum += *data;
    data = data + sizeof(byte);
  }

  spiuart.write(SC16IS752_CHANNEL_A,sum);
  Serial.println(sum,HEX);
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

  byte dat[4] = {0x2,0x81,0x00,0x83};
  send_sid_data(sizeof(dat) / sizeof(byte),dat);
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
    Serial.print("A: ");
    while (spiuart.available(SC16IS752_CHANNEL_A) > 0)
    {
      // read the incoming byte:
      char c = spiuart.read(SC16IS752_CHANNEL_A);
      Serial.print(c,HEX);
    }
    Serial.println("");
    // delay(1000);
  }
  
  numberToGPIO(val);
  val++;

  delay(1000);
  byte dat[4] = {0x2,0x81,0x00,0x83};
  send_sid_data(sizeof(dat) / sizeof(byte),dat);
  delay(10);
}
