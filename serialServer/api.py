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
    hasMatch = False
    print("Checking for " + port + " port availability")
    ports = listPorts()
    for p in ports:
        if port in p:
            thisPort = p
            hasMatch = True
    if not hasMatch:
        raise HTTPException(status_code=404, detail="Serial port not found.")
    conn = connection(thisPort)
    return{"confirmation": f"Port {thisPort} selected"}

@app.websocket("/ws/{port}")
async def websocket_endpoint(websocket: WebSocket,port: str):
    ports = listPorts()
    hasMatch = False
    print("Checking for " + port + " port availability")
    for p in ports:
        if port in p:
            thisPort = p
            hasMatch = True
    if not hasMatch:
        print("Exception while connection to the port")
        print("Port " + port + " not available")
        raise HTTPException(status_code=404, detail="Serial port not found.")
    else:
        conn = connection(thisPort)
        print("Listening to " + thisPort)
        await websocket.accept()
        websocket_clients.append(websocket)
        if conn.connected:
            print("Connected")
            try:
                while True:
                    data = conn.ser.readline().decode().strip()  # Read from serial port
                    if data:
                        await asyncio.gather(
                            *[
                                client.send_text(data) for client in websocket_clients
                            ]
                        )                
            except Exception as error:
                print("Exception while reading !")
                if(type(error).__name__ == "SerialException"):
                    print("Error while reading serial port, possible disconnection...")
                else:
                    print(type(error).__name__)
                    print(error)
                pass
            finally:
                print("Disconnecting...")
                websocket_clients.remove(websocket)
