import 'dart:convert';
import 'dart:typed_data';

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
    // if (selectedPort!.openWrite()) {
    //   // selectedPort!.config.baudRate = 115200;
    //   // selectedPort!.config.stopBits = 0;
    //   // selectedPort!.config = selectedPort!.config;
    //   final conf = SerialPortConfig();
    //   conf.baudRate = 115200;
    //   conf.bits = 8;
    //   conf.parity = 0;
    //   if (selectedPort != null) selectedPort!.config = conf;
    //   // selectedPort!.config = conf;
    // }
    getData();
    //Exception
  }

  void getData() {
    Map<String, dynamic> rawData;
    if (selectedPort != null && isPortAvailable(selectedPort!.name!)) {
      if (!selectedPort!.openReadWrite()) {
        debugPrint(SerialPort.lastError.toString());
      }

      SerialPortReader reader = SerialPortReader(selectedPort!);
      Stream<String> upcomingData = reader.stream.map((data) {
        return String.fromCharCodes(data);
      });
      upcomingData.listen((data) {
        debugPrint('Got Data: $data');
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
