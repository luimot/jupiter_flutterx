import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_libserialport/flutter_libserialport.dart';

/// Data Reception and Treatment
/// The data received by the Telemetry system must be
/// a JSON file and will have a data treatment as follows:
///   TODO: Add documentation as how the Data will be read.
class Data {
  late Barometer barometerData;
  late Accelerometer accelerometerData;
  late Battery batteryData;
  List<SerialPort> ports = [];
  late List<String> portNames;
  late SerialPort? selectedPort;

  bool isPortAvailable(String port) {
    return SerialPort.availablePorts.contains(port);
  }

  List<String> getPorts() {
    portNames = SerialPort.availablePorts;
    ports = [];
    for (String name in portNames) {
      ports.add(SerialPort(name));
    }
    return portNames;
  }

  void selectPort(String portName) {
    if (isPortAvailable(portName)) selectedPort = SerialPort(portName);
    //Exception
  }

  void getData() {
    Map<String, dynamic> rawData;
    if (selectedPort != null && isPortAvailable(selectedPort!.name!)) {
      if (!selectedPort!.openReadWrite()) {
        debugPrint(SerialPort.lastError.toString());
      }

      final reader = SerialPortReader(selectedPort!);
      reader.stream.listen((data) {
        //rawData = jsonDecode(data.toString()); // TODO:Probably wrong
        debugPrint('received: $data');
      });
    }
  }
}

class Barometer {
  late double pressure;
  late double time;
}

class Accelerometer {
  late double aX, aY, aZ;
  late double time;
}

class Battery {
  late double percentage;
  late double time;
}
