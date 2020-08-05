#!/usr/bin/python3
import asyncio
import websockets
import sys
import time

f = open("screenlog_cmds.log")


rowDatas = []

for row in f:
	if("#" not in row):
		if(len(row) > 4):
			rowDatas.append(row)

async def hello():
	global rowDatas
	uri = "ws://10.0.0.113:81"
	async with websockets.connect(uri) as websocket:
		for cmd in rowDatas:
			print(cmd)
			await websocket.send(cmd)
			
			time.sleep(0.05)

			#wait = input("Press to continue...")
		sys.exit()

asyncio.get_event_loop().run_until_complete(hello())