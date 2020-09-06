#!/usr/bin/python3
import serial
import sys
import time
import pprint

# Get data from file
filename = sys.argv[1]
f = open(filename)

# Extrac tdata
commandList = []

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

cmd_list = []
pp = pprint.PrettyPrinter(indent=4)

# Send commands
for cmd in commandList:
    # Print to serial
    # cmdStr = ",".join([hex(x) for x in cmd[1:-1]])
    commandByte = hex(cmd[0])
    if commandByte not in cmd_list:
        cmd_list.append(commandByte)
    #cmdStr = ",".join([hex(x) for x in cmd])

pp.pprint(cmd_list)