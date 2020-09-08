#include <Arduino.h>
#include <string.h>
#include <stdio.h>
#include <ESP32CAN.h>
#include <CAN_config.h>

int ledPin = 2;
CAN_device_t CAN_cfg;               // CAN Config
const int rx_queue_size = 10;       // Receive Queue size

void setup()
{
  delay(100);
  Serial.begin(921600);
  Serial.println("I-BUS INTERFACE");

  pinMode(ledPin,OUTPUT);
  digitalWrite(ledPin,1);

  // Setup can interface
  CAN_cfg.speed = CAN_SPEED_125KBPS;
  CAN_cfg.tx_pin_id = GPIO_NUM_5;
  CAN_cfg.rx_pin_id = GPIO_NUM_4;
  CAN_cfg.rx_queue = xQueueCreate(rx_queue_size, sizeof(CAN_frame_t));
  // Init CAN Module
  ESP32Can.CANInit();
}

void loop()
{
  CAN_frame_t rx_frame;

  // Receive next CAN frame from queue
  if (xQueueReceive(CAN_cfg.rx_queue, &rx_frame, 3 * portTICK_PERIOD_MS) == pdTRUE) {

    if (rx_frame.FIR.B.FF == CAN_frame_std) {
      Serial.print("New standard frame");
    }
    else {
      Serial.print("New extended frame");
    }

    if (rx_frame.FIR.B.RTR == CAN_RTR) {
      Serial.printf(" RTR from 0x%08X, DLC %d\r\n", rx_frame.MsgID,  rx_frame.FIR.B.DLC);
    }
    else {
      Serial.printf(" from 0x%08X, DLC %d, Data ", rx_frame.MsgID,  rx_frame.FIR.B.DLC);
      for (int i = 0; i < rx_frame.FIR.B.DLC; i++) {
        Serial.printf("0x%02X ", rx_frame.data.u8[i]);
      }
      Serial.println("");
    }
  }
}
