#!/usr/bin/python3
"""
FOR SAAB SID/HPD REVERSE ENGINEERING.
A client for the websockets -> serial nodemcu module.
This parses the returned values into user-readable response codes (when avaliable).
Also just provides a quicker prototyping environment for testing out new serial commands,
rather than having to hard-code them into the arduino, or use other (clunky) websocket clients.
"""
import asyncio
import websockets

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
        print(current_frame_items)
        current_frame_items = []

async def hello():
    uri = "ws://192.168.43.35:81"
    async with websockets.connect(uri) as websocket:
        #await websocket.send("0x80,0x00")

        async for message in websocket:
            parse_response(message)

asyncio.get_event_loop().run_until_complete(hello())
