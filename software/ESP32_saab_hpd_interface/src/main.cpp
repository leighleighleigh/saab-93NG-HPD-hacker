#include <Arduino.h>
#include <SPI.h>
#include <Wire.h>
#include <SC16IS752.h> // Dual UART interface
#include <string.h>
#include <stdio.h>
#include <sid_frame_utils.h>

#define SCK 14
#define MISO 12
#define MOSI 13
#define CS 15

SC16IS752 spiuart = SC16IS752(SC16IS750_PROTOCOL_SPI, CS);

#define baudrate_A 111111
#define baudrate_B 111111
int ignoreChannelBCount = 0;
int ignoreChannelACount = 0;

bool passThroughMode = false; // false, do serial to SID mode, //true, do in-car mode
int ledPin = 2;

//11,10,0,2,0,2,3,0,2,22,0,CF,0,1F,50,6C,61,79,D0
const char auxPlayMsg[] = {0x11,0x10,0x0,0x2,0x0,0x2,0x3,0x0,0x2,0x22,0x0,0xCF,0x0,0x1F,0x50,0x6C,0x61,0x79,0xD0};
int auxPlayMatchIndex = 0;
byte newPlayMsg[] = {0x10,0x0,0x2,0x0,0x2,0x3,0x0,0x2,0x22,0x0,0xD5,0x0,0x1F,0x42,0x54};

void setup()
{
  delay(1000);
  Serial.begin(921600);
  Serial.setTimeout(100);
  //Serial.println("Start UART -> SID adapter.");
  pinMode(ledPin,OUTPUT);
  digitalWrite(ledPin,1);


  // Setup SPI pins
  SPI.begin(SCK,MISO,MOSI,CS);
  SPI.setFrequency(4000000); // 4Mhz for the 752 uart ic

  // UART to Serial Bridge Initialization
  spiuart.begin(baudrate_A,baudrate_B); //baudrate setting
  
  if (spiuart.ping() != 1)
  {
    //Serial.println("Device not found");
    while (1)
      ;
  }

  // SETUP GPIO
  for(int gpioPin = 0; gpioPin < 8; gpioPin++){
    spiuart.pinMode(gpioPin, OUTPUT);
    spiuart.digitalWrite(gpioPin, LOW);
  }

  // Setup loopback
  spiuart.LoopbackEnable(false);
  
  spiuart.flush(SC16IS752_CHANNEL_A);
  spiuart.flush(SC16IS752_CHANNEL_B);
  Serial.flush();
}

void num2lights(int num)
{
  for(int gpioPin = 0; gpioPin < 8; gpioPin++){
    spiuart.digitalWrite(gpioPin, num & 1);
    num = num >> 1;
  }
}

void send_sid_data(byte channel,byte len,byte* data)
{
  uint16_t sum;
  ignoreChannelBCount = len + 2;
  
  sum += len;

  spiuart.write(channel,len);  
  Serial.print("TX: 0x");
  
  Serial.print(len,HEX);
  Serial.print(",");

  for(byte i = 0; i<len; i++)
  {
    spiuart.write(channel,*data);
    Serial.print("0x");
    Serial.print(*data,HEX);
    Serial.print(",");
    sum += *data;
    data = data + sizeof(byte);
  }

  // Send the LSB of the sum.
  sum = sum & 0b11111111;
  spiuart.write(channel,sum);
  Serial.print("0x");
  Serial.println(sum,HEX);
}

String userInput;
uint8_t inputBuf[1024];

void parseUserInput(uint8_t * payload, size_t length)
{
  // Parse the input text payload as CSVs
  // Send this onto the serial bus via send_sid_data.
  char str[1024];

  // Load payload into str (the buffer)
  memcpy(str,payload,length);

  const char s[2] = ",";

  byte tokenIndex = 0;
  byte tokenData[1024];
  char *token;
  
  /* get the first token */
  token = strtok(str, s);

  /* walk through other tokens */
  while( token != NULL ) {
    // Only do if token != '\n'
    if(token != "\n" && token != "\0" && token != "\r"){
      // Parse token into array
      tokenData[tokenIndex++] = (byte)strtol(token, NULL, 0);
    }

    // Get next token
    token = strtok(NULL, s);
  }

  // Send data using send_sid_data
  send_sid_data(SC16IS752_CHANNEL_B,tokenIndex,tokenData);
}

// int n = 0;

// Timeout for receiveing a valid RX frame

// SID RX buffer
byte rxBuffer[256];
byte rxBufferIndex = 0;

void loop()
{
  if(!passThroughMode){
    // n++;
    // num2lights(n);

    if(spiuart.available(SC16IS752_CHANNEL_B) > 0){
      while (spiuart.available(SC16IS752_CHANNEL_B) > 0)
      {
        // read the incoming byte:
        char c = spiuart.read(SC16IS752_CHANNEL_B);
        if(ignoreChannelBCount == 0){
          // Fill up the RX buffer
          rxBuffer[rxBufferIndex++] = c;
          // Set lights to be the data
          num2lights(c);
        }else{
          ignoreChannelBCount --;
        }
      }

      // Print the contents of the RX buffer
      if(rxBufferIndex != 0)
      {
        Serial.print("RX: ");
      }
      for(int i = 0; i<rxBufferIndex; i++)
      {
        Serial.print("0x");
        Serial.print(rxBuffer[i],HEX);
        Serial.print(",");
      }
      Serial.println("");

      // Reset RX buffer
      rxBufferIndex = 0;
    }

    
    // Check if we have stuff to read in serial
    if(Serial.available() > 0)
    {
      userInput = Serial.readStringUntil('\n');
      userInput.getBytes(inputBuf,1024);
      parseUserInput(inputBuf,userInput.length());
      // Reset the rx buffer
      rxBufferIndex = 0;
    }
      
  }else{
    // Read from channel A and send to channel B
    if(spiuart.available(SC16IS752_CHANNEL_B) >= 3){
      Serial.print("SID:");
      while (spiuart.available(SC16IS752_CHANNEL_B) > 0)
      {
        // read the incoming byte:
        char c = spiuart.read(SC16IS752_CHANNEL_B);
        if(ignoreChannelBCount == 0){
          spiuart.write(SC16IS752_CHANNEL_A,c);
          ignoreChannelACount++;
          Serial.print(c,HEX);
          Serial.print(",");
        }else{
          ignoreChannelBCount --;
        }
      }
      Serial.println(";");
    }
    // Read from channel B and send to channel A
    if(spiuart.available(SC16IS752_CHANNEL_A) >= 3){
      Serial.print("ICM:");
      while (spiuart.available(SC16IS752_CHANNEL_A) > 0)
      {
        // read the incoming byte:
        char d = spiuart.read(SC16IS752_CHANNEL_A);
        if(ignoreChannelACount == 0){
          spiuart.write(SC16IS752_CHANNEL_B,d);
          ignoreChannelBCount++;
          Serial.print(d,HEX);
          Serial.print(",");

          // Check for match with the aux 'play' msg
          if(d == auxPlayMsg[auxPlayMatchIndex]){
            // If we are done matching
            if(auxPlayMatchIndex == 18){
              // Matched the last char, send replacement message
              Serial.println("Sending replacement bluetooth text");
              send_sid_data(SC16IS752_CHANNEL_B,17,newPlayMsg);
              // Reset aux play match
              auxPlayMatchIndex = 0;
            }else{
              auxPlayMatchIndex++;
            }
          }else{
            auxPlayMatchIndex = 0;
          }

        }else{
          ignoreChannelACount --;
        }
      }
      Serial.println(";");
    }
  }
}
