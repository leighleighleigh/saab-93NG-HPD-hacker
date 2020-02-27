#include <Arduino.h>
#include <math.h>

// SID RX D5, TX D6
// ICM RX D2, TX D3

void setup()
{
  Serial.begin(115200);

  pinMode(D5,INPUT);
  pinMode(D2,INPUT);
  pinMode(D6,OUTPUT);
  pinMode(D3,OUTPUT);

  Serial.println("Start PCA82C250 Digital Pin Mirroring");

  delay(1000);

  Serial.println("START!");
}

void loop()
{
  // Simple read and write as fast as possible
  // ICM to SID
  digitalWrite(D6,digitalRead(D2));
  // SID to ICM
  digitalWrite(D3,digitalRead(D5));
}
