#!/usr/bin/python3

# Sends from a trimmed icmonly log to a serial interface.
# Doesn't wait for valid reply.

import serial
import sys
import time

# Get data from file
filename = sys.argv[1]
f = open(filename)

# Extrac tdata
commandList = []
commandList.append([0x4,0x80,0x0,0x3E,0x0,0xC2])


for row in f:
    # Ignore comments
    if("#" not in row):
        if(len(row) > 3):
            # Trim leading ICM and trailing semicolons
            lineTxt = row.strip()
            lineTxt = lineTxt.replace("ICM:","")
            lineTxt = lineTxt.replace(",;","")
            lineSplit = lineTxt.split(",")
            # Convert to integers
            lineData = [int(x,16) for x in lineSplit]
            commandList.append(lineData)
		

# Send data
ser = serial.Serial('/dev/ttyACM0',115200)
ser.setDTR(False)
time.sleep(0.5)
ser.setDTR(True)
time.sleep(3)
ser.flushInput()

for cmd in commandList:
    # Print to serial
    cmdStr = ",".join([hex(x) for x in cmd[1:-1]])
    print(cmdStr)

    ser.write(str.encode(cmdStr))
        
    time.sleep(0.5)

    while(ser.in_waiting != 0):
        print(ser.readline().decode("utf-8"))


ser.close()