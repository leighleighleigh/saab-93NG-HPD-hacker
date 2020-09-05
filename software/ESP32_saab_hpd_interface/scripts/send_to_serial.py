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
commandList.append([0x83,0x0])

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
            # print(lineSplit)
            lineData = [int(x,16) for x in lineSplit]
            commandList.append(lineData)
		
# Determine if it's a valid frame
### Used for response parsing
def is_valid_frame(frame_items):
    if(len(frame_items) == 0):
        return False

    dlc = int(frame_items[0],16)

    if(len(frame_items) != dlc + 2):
        return False

    # Validate sum
    sum = dlc
    for i in range(0,dlc):
        sum += int(frame_items[1+i],16)

    # Get crc from frame
    crc = int(frame_items[-1],16)
    # Get LSB of sum
    sum = sum & 0b11111111

    if(crc == sum):
        return True
    else:
        print("CRC:" + str(crc) + ",SUM:" + str(sum))
        return True


# Send data
ser = serial.Serial('/dev/ttyACM0',921600)

# Reset the device
ser.setDTR(False)
time.sleep(0.5)
ser.setDTR(True)
time.sleep(3)
ser.flushInput()

# Send commands
for cmd in commandList:
    # Print to serial
    # cmdStr = ",".join([hex(x) for x in cmd[1:-1]])
    cmdStr = ",".join([hex(x) for x in cmd])
    print("Raw TX: " + cmdStr)

    # Send out the string to the serial port
    ser.write(str.encode(cmdStr))

    valid_response = False
    
    # Wait for valid response frame
    while(ser.in_waiting != 0 or not valid_response):
        dat = ser.readline().decode("utf-8").strip().lstrip()
        # Only print if valid
        if(len(dat) >= 2):
            print(dat)

        # Check if contains 'RX'
        if("RX" in dat):
            # Check if valid response
            frame_items = dat.replace("RX: ","").split(",")[0:-1]
            result = is_valid_frame(frame_items)
            # print(frame_items)
            # print(result)
            # Tick the box
            valid_response = result

    print("")
    # time.sleep(0.15)



ser.close()