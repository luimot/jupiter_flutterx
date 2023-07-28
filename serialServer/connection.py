import serial

class Connection{
    ser = None
    def initPort(port: str):
        ser = serial.Serial(port)
}