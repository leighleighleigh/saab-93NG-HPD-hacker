#!/usr/bin/python3
import asyncio
import websockets
import sys
import time

f = open("screenlog.0")

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

async def hello():
	global rowDatas
	uri = "ws://10.0.0.113:81"
	async with websockets.connect(uri) as websocket:
		for x in rowDatas:
			print(",".join(x))
			await websocket.send(",".join(x))
			time.sleep(0.05)

asyncio.get_event_loop().run_until_complete(hello())