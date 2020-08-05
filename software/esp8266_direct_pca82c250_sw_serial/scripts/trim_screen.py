#!/usr/bin/python3
import asyncio
import websockets
import sys
import time

f = open("screenlog.0")

responseCommands = [0x82,0x84]
pollCommand = [0x4,0x80,0x0,0x3e,0x3e,0x0]
pollCommand = [hex(int(d)) for d in pollCommand]

rowDatas = []

for row in f:
	if "[" in row and "]" in row:
		tempRow = row
		tempRow = tempRow.replace("[","")
		tempRow = tempRow.replace("]","")
		tempRow = tempRow.replace("\'","")
		tempRow = tempRow.split(",")
		tempRow = [hex(int(x,16)) for x in tempRow]
		rowDatas.append(tempRow)

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
		if(frame_items == pollCommand):
			return "POLL"
		if(int(frame_items[1],16) >= 0xfe):
			return "ACK"
		if(int(frame_items[1],16) in responseCommands):
			return "REPLY"

		return "CMD"
	else:
		return False

def trim_protocol_headers(frame_items):
	# Trims DLC and CRC, for sending to the SID as raw data cmd.
	# Please make sure this is a valid frame before doing this...
	dlc = int(frame_items[0],16)
	data = []

	for i in range(0,dlc):
		data.append(hex(int(frame_items[1+i],16)))

	return data

# Find last POLL
lastPollIndex = 0
for x in range(len(rowDatas)):
	validity = is_valid_frame(rowDatas[x])
	if(validity == "POLL"):
		lastPollIndex = x


for index in range(lastPollIndex,len(rowDatas)):
	x = rowDatas[index]

	validity = is_valid_frame(x)
	if(validity == "CMD" or validity == "POLL"):
		# Print debug
		#print("[" + str(validity).zfill(8).replace("0"," ") + "] " + ",".join(x) + " (" + str(trim_protocol_headers(x)) + ")")
		# Print data only
		print(",".join(trim_protocol_headers(x)))
