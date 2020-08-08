#!/usr/bin/python3
import asyncio
import websockets
import sys
import time

# List of commands, not including DLC's and trailing headers
cmdList = []
response_SUCCESS = ['02','ff','00','01']
response_ARG = ['03','fe','33','34'] # Incorrect arguments?
response_ARG2 = ['03','fe','31','32'] # Idk???

# Backlight
def setBacklight(a,b=None,c=None):
	if(b == None and c == None):
		cmdList.append("0x80,{}".format(hex(a)))
	else:
		cmdList.append("0x80,{},{},{}".format(hex(a),hex(b),hex(c)))

def strToHex(msg):
	"""
	Returns array of unicode chars in hex form
	"""
	return ",".join([hex(ord(x)) for x in msg])

def allHex(start,stop):
	msg = range(start,stop)
	return ",".join([hex(x) for x in msg])

# Function to draw text command, which does the 'clear' and 'draw' commands too.
# Inputs are integers.
def drawText(gfxArea,reqID,reqID2,w,x,y,size,text=None,rawText=None,doClear=True,doDraw=True):
	# Clear text area
	if(doClear):
		cmdList.append("0x60,0x0,{},0x0".format(hex(gfxArea)))

	# Create the data array, used to insert into the text command.
	# Some inputs are split into two bytes, such as width and reqID.
	if(text != None):
		data = [hex(gfxArea),hex(reqID),hex(reqID2),hex(size),hex(w & 0xff),hex(w >> 8),hex(x),hex(y),strToHex(text)]
	if(rawText != None):
		data = [hex(gfxArea),hex(reqID),hex(reqID2),hex(size),hex(w & 0xff),hex(w >> 8),hex(x),hex(y),rawText]
	# Place text graphics
	cmdList.append("0x10,0x0,{},0x0,{},{},0x0,{},{},{},{},0x0,{},{}".format(*data))
	
	# Draw text area
	if(doDraw):
		cmdList.append("0x70,0x0,{},0x0,0x1".format(hex(gfxArea)))

def drawIcon(gfxArea,reqID,reqID2,x,flip,mode,iconNumber):
	# 0x30,0x0,0x76,0x0,0x4,0x71,0x54,0x0,0x48,0x0,0x0 

	# Clear GFX area
	cmdList.append("0x60,0x0,{},0x0".format(hex(gfxArea)))

	# Create the data array, used to insert into the text command.
	# Some inputs are split into two bytes, such as width and reqID.
	data = [hex(gfxArea),hex(reqID),hex(reqID2),hex(iconNumber),hex(mode),hex(x),hex(flip)]
	# Place text graphics
	cmdList.append("0x30,0x0,{},0x0,{},{},{},{},{},{},0x0".format(*data))
	
	# Draw GFX area
	cmdList.append("0x70,0x0,{},0x0,0x1".format(hex(gfxArea)))




doTestRoutine = True
if(doTestRoutine):
	# Execute desired commands, which adds them to the cmdList
	# All on
	setBacklight(0x00,0xFF,0xFF)
	# Alternative, low power mode? keyless mode? hmm.
	#setBacklight(0xff)
	#drawText(gfxArea=0x25,reqID=0x1,reqID2=0x55,w=0xff,x=148,y=48,size=1,text="abcdefghijklmnopqrstuvw\nxyz0123456789!@#$%^&*()")
	# FONTSIZE
	# 0 has all caps, and some symbols
	# 1 and 2 have normall unicode stuff, no symbols?
	# NEWLINE WORKS! woah.
	drawText(gfxArea=0x25,reqID=0x1,reqID2=0x0,w=384,x=140,y=20,size=1,text="BOY BYE")
	drawText(gfxArea=0x26,reqID=0x2,reqID2=0x0,w=384,x=140,y=38,size=0,text="GINGER\nBROCKHAMPTON")
	#drawText(gfxArea=0x81,reqID=0x1,reqID2=0x1,w=384,x=68,y=0x0,size=1,text="abcdefghijklmnopqrstuvw\nxyz0123456789!@#$%^&*()")
	# VALID GFX AREAS
	# 0x25, 0x26, used for primary text
	# 0x81 used for secondary status text
	# 0x76, used for icons
	# Testing the symbols in fontsize 0
	# Fontsize zero has symbols from 0x30 (0) to 0x5a (Z)
	# There also some other symbols for computer and messages
	# 0x2f = /
	# 0x2e = .
	# 0x2d = -
	# 0x2b = +
	# 0x27 = email icon
	# 0x26 = clock icon
	# 0x25 = wavey heat icon
	# 0x24 = message / email icon but different
	# 0x23 = computer with slash icon
	# 0x4 = "K" for kelvin?
	# 0x2 = "+" ???
	## POSITIONS
	# 68 x = inside of icon screen
	# 140 x = padded into right text region
	symbolInt = 0x27
	symbolRange = 1
	msg = allHex(symbolInt,symbolInt+symbolRange) + "," + strToHex(" YOU HAVE 1 MESSAGE")
	drawText(gfxArea=0x81,reqID=0x3,reqID2=0x0,w=384,x=140,y=4,size=0,rawText=msg)
	### ICONS
	#drawIcon(0x76,0x0,0x04,0x48,0x0,0x0,0x54)
	drawIcon(gfxArea=0x76,reqID=0x4,reqID2=0x0,x=72,flip=0,mode=0x0,iconNumber=168)


#for i in range(0,256):
#	cmdList.append(hex(i) + ",0x0")


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
		current_frame_items.append(msg.replace("RX: ",""))

	if(is_valid_frame(current_frame_items)):
		# RETURN the valid frame
		valid_frame = current_frame_items[:]
		current_frame_items = []
		return valid_frame
	else:
		return 0

async def send_cmds():
	global cmdList
	uri = "ws://10.0.0.113:81"

	async with websockets.connect(uri) as websocket:

		# Send commands, wait for valid return code, retry send if fail.
		cmdIndex = 0
		retryCount = 0
		retryMax = 2
		restartOnFail = False

		while(cmdIndex < len(cmdList)):
			cmd = cmdList[cmdIndex]

			# Send the command
			#print(cmd)
			await websocket.send(cmd)
			
			# Wait for return code
			response_code = None
			async for message in websocket:
				result = parse_response(message)
				if(result != 0):
					# Grab return code
					response_code = result					
					break
			
			# Print response
			#print(response_code)			

			# Check if response == SUCCESS
			if(response_code == response_SUCCESS):
				print(cmd)
				print(response_code)
				# Increment command
				cmdIndex += 1
				# Reset retry count
				retryCount = 0
				# Sleep for a bit
				time.sleep(0.1)
				# Print a newline
				print("")
			else:
				if(retryCount != retryMax):
					print(".")
					# Increment retry count
					retryCount += 1
					# Sleep for longer
					time.sleep(0.1)
				else:
					print("ERR")
					retryCount = 0
					cmdIndex += 1
					time.sleep(0.1)
					if(restartOnFail):
						print("Retransmit...")
						cmdIndex = 0
					

		await websocket.close()

asyncio.get_event_loop().run_until_complete(send_cmds())
