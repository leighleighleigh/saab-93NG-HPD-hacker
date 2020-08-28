#!/usr/bin/python3
import serial
import sys
import time

# Get data from file
f = open("screenlog_cmds.log")
rowDatas = []
for row in f:
	if("#" not in row):
		if(len(row) > 4):
			# Need to extract as bytes
			rowDatas.append(row)

# Send data
ser = serial.Serial('/dev/ttyACM0',115200)

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

current_frame_items = []
def parse_response(msg):
	global current_frame_items
	if(msg == "GOT" or msg == "Connected!"):
		current_frame_items = []
	else:
		current_frame_items.append(msg.replace("RX:",""))

	if(is_valid_frame(current_frame_items)):
		# RETURN the valid frame
		valid_frame = current_frame_items[:]
		current_frame_items = []
		return valid_frame
	else:
		return 0

for cmd in rowDatas:
	print(cmd)
	# Send it
	ser.write(str.encode(cmd))

	# Wait for valid response.
	line = ser.readline()   # read a '\n' terminated line
	while(parse_response(str(line.strip(),'utf-8')) != 0):
		line = ser.readline()   # read a '\n' terminated line

	# time.sleep(1)
	time.sleep(0.03)

ser.close()