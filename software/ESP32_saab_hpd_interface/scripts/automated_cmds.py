#!/usr/bin/python3

# Sends some commands in an automated fashion

import serial
import sys
import time
import pprint
import json

# Extrac tdata
commandList = []

# Append commands
for i in range(0,0xff):
    commandList.append([i,0x0])
		
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
ser = serial.Serial('/dev/ttyACM0',115200)

# Reset the device
ser.setDTR(False)
time.sleep(0.1)
ser.setDTR(True)
time.sleep(0.2)
ser.flushInput()


# # RESULTS BY RESPONSE
data = {}
pp = pprint.PrettyPrinter(indent=4)

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
            # Check if in data
            if dat in data:
                data[dat].append(cmdStr)
            else:
                data[dat] = []
                data[dat].append(cmdStr)

            # Tick the box
            valid_response = result

    print("")
    # time.sleep(0.15)



ser.close()

f = open("results.json",'w')
d = json.dumps(data, sort_keys=True, indent=4)
f.write(d)
f.close()

pp.pprint(data)