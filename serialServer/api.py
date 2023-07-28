import sys
import glob
import json
from typing import Union, List
from fastapi import FastAPI

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

@app.post("ports/{port}")
def selectPort(port: str):
    # Checks again wheter the port is still usable
    if port not in availablePorts():
        raise HTTPException(status_code=404, detail="Serial port not found.")
    # TODO: Implement serial logic
    return{"confirmation": f"Port {port} selected"}
