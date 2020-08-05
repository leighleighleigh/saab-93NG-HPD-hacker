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
import time
import math

iconVal = 64

backlightCMD = "0x80,0x0,0xce,0xce"
clearCMD = "0x60,0x0,0x76,0x0"
drawCMD = "0x70,0x0,0x76,0x0,0x1"
iconCMD = "0x30,0x0,0x76,0x0,0x4,0x71,{},0x0,0x48,0x0,0x0"


clearTXT = "0x60,0x0,0x25,0x0"
textFMT = "0x10,0x0,0x25,0x0,0x1,0x66,0x0,0x0,0xff,0x0,{},0x0,{},{}"
drawTXT = "0x70,0x0,0x25,0x0,0x1"

def convertTXT(msg):
    convert = [hex(ord(x)) for x in msg]
    return ",".join(convert)

async def hello():
    testvalue = 0
    uri = "ws://10.0.0.113:81"
    async with websockets.connect(uri) as websocket:
        await websocket.send(backlightCMD)
        time.sleep(0.05)
        await websocket.send(clearTXT)
        time.sleep(0.05)

        while testvalue < 1000:
            await websocket.send(clearTXT)
            time.sleep(0.05)
            await websocket.send(textFMT.format(hex(138 + int(abs(math.sin(testvalue/50)*30))),hex(int(abs(math.sin(testvalue/50)*20))),convertTXT("TEST VAL " + str(testvalue))))
            time.sleep(0.05)
            await websocket.send(drawTXT)
            time.sleep(0.05)
            #await websocket.send("0x81,0x00")
            #time.sleep(0.05)
            testvalue += 1
            # await websocket.send(clearCMD)
            # time.sleep(0.05)
            # await websocket.send(iconCMD.format(hex(iconVal+1)))
            # time.sleep(0.05)
            # await websocket.send(iconCMD.format(hex(iconVal)))
            # time.sleep(0.05)
            # await websocket.send(drawCMD)
            # time.sleep(2)
            
        
asyncio.get_event_loop().run_until_complete(hello())
