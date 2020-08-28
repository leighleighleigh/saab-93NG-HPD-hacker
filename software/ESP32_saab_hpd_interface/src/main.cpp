#include <Arduino.h>

int ledPin = 2;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(ledPin,OUTPUT);
  digitalWrite(ledPin,1);
}

void loop() {
  Serial.println("Hello World!");
  // put your main code here, to run repeatedly:
  digitalWrite(ledPin,1);
  delay(1000);
  digitalWrite(ledPin,0);
  delay(1000);
}