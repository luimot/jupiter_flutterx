import sys
import glob
import json
from typing import Union, List
from fastapi import FastAPI, HTTPException, WebSocket
from starlette.responses import StreamingResponse
import asyncio
import serial

# List for storing websocket client instances
websocket_clients = []

class connection:
    ser = None
    connected = None
    
    def __init__(self,port: str):
        self.ser = serial.Serial(port)
        self.connected = True
    
    def readPort(self,n_bytes: int):
        if self.connected:
            return ser.read(n_bytes)

app = FastAPI()

def listPorts():
    if sys.platform.startswith('win'):
        ports = ['COM%s' % (i + 1) for i in range(256)]
    elif sys.platform.startswith('linux') or sys.platform.startswith('cygwin'):
        # this excludes your current terminal "/dev/tty"
        ports = glob.glob('/dev/ttyACM[0-9]*')
    elif sys.platform.startswith('darwin'):
        ports = glob.glob('/dev/tty.*')
    else:
        raise EnvironmentError('Unsupported platform')
    return ports

@app.get("/ports")
def get_ports():
    availablePorts = listPorts()
    return {"availablePorts": availablePorts}

@app.post("/ports/{port}")
def selectPort(port: str):
    # Checks again whether the port is still usable
    print(port)
    ports = listPorts()
    for p in ports:
        if port in p:
            thisPort = p
            hasMatch = True
    if not hasMatch:
        raise HTTPException(status_code=404, detail="Serial port not found.")
    # TODO: Finish serial logic
    conn = connection(thisPort)
    return{"confirmation": f"Port {thisPort} selected"}

# async def stream():
#     async def event_generator():
#         if conn.connected:
#             while True:
#                 data = conn.readPort(256)
#                 if not data:
#                     await asyncio.sleep(0.1)  # Aguarda 0.1 segundo se não houver dados
#                     continue
#                 yield b"data: " + data + b"\n\n"

#     return StreamingResponse(event_generator(), media_type="text/event-stream")
# ws
# @app.get("/stream_ports")
# async def get_stream_ports():
#     return await stream()

@app.websocket("/ws/{port}")
async def websocket_endpoint(websocket: WebSocket,port: str):
    ports = listPorts()
    for p in ports:
        if port in p:
            thisPort = p
            hasMatch = True
    if not hasMatch:
        raise HTTPException(status_code=404, detail="Serial port not found.")
    # TODO: Finish serial logic
    conn = connection(thisPort)
    print("Listening to " + thisPort)
    await websocket.accept()
    websocket_clients.append(websocket)
    if conn.connected:
        print("Connected")
        try:
            while True:
                print("Reading data...")
                data = conn.ser.readline().decode().strip()  # Read from serial port
                if data:
                    print("Data acquired")
                    await asyncio.gather(
                        *[
                            client.send_text(data) for client in websocket_clients
                        ]
                    )
        except:
            print("Exception while reading !")
            pass
        finally:
            print("Disconnecting...")
            websocket_clients.remove(websocket)
