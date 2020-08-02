#!/usr/bin/python3
import csv
import math
import sys


# Running list of commands found
cmdsFound = []


# Small statemachine
inDLC = True
inData = False
inCHK = False

currentDLC = 0
currentDLCRem = 0
currentCMD = ""
currentCHECK = 0

def parse_step(msg):
	global cmdsFound
	global inDLC
	global inData
	global inCHK
	global currentDLC
	global currentCMD
	global currentDLCRem
	global currentCHECK

	if(inDLC):
		currentDLC = int(msg,16)
		currentDLCRem = currentDLC
		print("(" + str(currentDLC) + ")")
		inDLC = False
		inData = True
		currentCHECK = currentDLC
	elif(inData):
		if(currentDLCRem != 0):
			currentCHECK += int(msg,16)
			if(currentDLCRem == currentDLC):
				print("[" + msg + "]")
				currentCMD = msg
			else:
				print(msg)

			if currentCMD not in cmdsFound:
				cmdsFound.append(currentCMD)

			currentDLCRem -= 1
		else:
			inData = False
			inCHK = True
			parse_step(msg)
	elif(inCHK):
		if(currentCHECK & 0b11111111 == int(msg,16)):
			print("." + msg)
		else:
			print(str(int(msg,16)) + "!=" + str(currentCHECK & 0b11111111))
		
		inCHK = False
		inDLC = True


f = open(sys.argv[1])
firstRow = True
for row in f:
	if firstRow:
		firstRow = False
		continue
	split = row.split(",")
	parse_step(split[1])
	#print(split[1])

print(cmdsFound)
f.close()
