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

// Defines role
bool isMaster = false;

// Support 64 byte buffer, which isn't going to be filled as maximum observed messages are around 16 bytes.
char swSerInbound[64] = {0};
uint8_t swSerInboundIndex = 0;

char i2cInbound[64] = {0};
uint8_t i2cInboundIndex = 0;

// The I2C receive event, which fills the i2cInbound buffer.
void receiveEvent(size_t howMany)
{
  Serial.print("i2c rx: ");

  // We skip the first byte as it's usually incorrect for some reason.
  bool skip = true;

  (void)howMany;
  while (Wire.available())
  {                       // slave may send less than requested
    char c = Wire.read(); // receive a byte as character
    
    // Skip first byte routine
    if(skip)
    {
      skip = false;
      continue;
    }

    // Fill the i2cInbound array
    i2cInbound[i2cInboundIndex++] = c;
    
    // print the character
    Serial.print(c);      

    // If i2cInboundIndex == 64 then we gotta quit.
    if(i2cInboundIndex == 64)
    {
      break;
    }
  }

  Serial.println(" ");
}

void setup()
{
  Serial.begin(115200);
  Serial.println("\n\n");
  delay(500);
  Serial.println("BOOT!");

  // Evaluate if we are master (D8 is LOW)
  pinMode(D7, INPUT_PULLUP);

  isMaster = digitalRead(D7);
 
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

  // Start the softwareserial 
  swSer.begin(sw_ser_baud);

  Serial.println("START!");
  swSer.flush();
}

// I2C Send routine for one byte
void send_byte(char data)
{
  // Address differently depending on role.
  if(isMaster)
  {
    Wire.beginTransmission(I2C_SLAVE);
  }else{
    Wire.beginTransmission(I2C_MASTER);
  }
  Wire.write("X"); // Dummy first byte which is ignored
  Wire.write(data); // Data byte
  Wire.endTransmission(); // We done here!

  // delay(1); // Unsure if this is needed.
}

void loop()
{
  // Check for SWSER data inbound
  while (swSer.available())
  {
    char c = swSer.read();
    swSerInbound[swSerInboundIndex++] = c;
    Serial.print("sw rx: ");
    Serial.println(c, HEX);
    // If swSerInboundIndex == 64 then we gotta quit.
    if(swSerInboundIndex == 64)
    {
      break;
    }
  }

  // If we got serial data input, send it out the I2C.
  if(swSerInboundIndex != 0)
  {
    Serial.print("i2c tx:");
    // FIFO
    for(int i = 0; i < swSerInboundIndex; i++)
    {
      // Chuck it out the I2C.
      send_byte(swSerInbound[i]);
      // Debug about it
      Serial.print(swSerInbound[i],HEX);
    }

    Serial.println("");

    // Reset buffer index
    swSerInboundIndex = 0;
  }

  // Now we check for I2C input, and send that out the serial.
  if(i2cInboundIndex != 0)
  {
    Serial.print("sw tx:");
    //FIFO
    for(int i = 0; i < i2cInboundIndex; i++)
    {
      // SEND IT out the swSer
      swSer.write(i2cInbound[i]);
      // Debug about it
      Serial.print(i2cInbound[i],HEX);
    }

    Serial.println("");

    // Reset buffer index
    i2cInboundIndex = 0;
  }
}
