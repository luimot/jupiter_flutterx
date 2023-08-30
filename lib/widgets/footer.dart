import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../data/get_data.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  static const Color footerColor = Color(0xFF024888);
  static const TextStyle textStyle = TextStyle(color: Color(0xFFF1F1F1));
  static const double statTextWidth = 100;
  String? _selectedPort;
  String? _currentMeasure;
  // Data portData = Data();
  bool _isPortConnected = false;

  List<DropdownMenuItem> get _availablePorts =>
      // portData.getPorts().map<DropdownMenuItem<String>>((String value) {
      //   return DropdownMenuItem<String>(
      //       value: value,
      //       child: Text(value),
      //       onTap: () => {} //() => {portData.selectPort(value)},
      //       );
      // }
      // ).toList();
      ['/dev/ACM0', '/dev/ACM1'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
            onTap: () => {} //() => {portData.selectPort(value)},
            );
      }).toList();

  List<DropdownMenuItem> get _hourMeasures => [
        "Time from last signal",
        "Current time",
        "Time from first signal"
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: footerColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SizedBox(
              width: statTextWidth,
              child: Text(
                "RSSI:",
                style: textStyle,
              ),
            ),
            SizedBox(
              width: statTextWidth,
              child: Text(
                "SNR:",
                style: textStyle,
              ),
            ),
            SizedBox(
              width: statTextWidth,
              child: Text(
                "Frequency:",
                style: textStyle,
              ),
            )
          ]),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: const Color(0xFF005FB6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                    underline: Container(),
                    icon: Transform.rotate(
                      angle: -90 * math.pi / 180,
                      child: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                    ),
                    elevation: 0,
                    items: _availablePorts,
                    style: const TextStyle(color: Color(0XFFF1F1F1)),
                    dropdownColor: const Color(0xFF00396D),
                    value: _availablePorts.isNotEmpty
                        ? _selectedPort
                        : "No Ports Available!",
                    onChanged: (dynamic value) {
                      setState(() {
                        _selectedPort = value;
                      });
                    }),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      _isPortConnected ? "Connected" : "Disconnected",
                      style: TextStyle(
                          color: _isPortConnected
                              ? Color(0xFF21EE00)
                              : Color.fromARGB(255, 255, 230, 0)),
                    ))
              ],
            ),
          ),
          DropdownButton(
              underline: Container(),
              icon: Transform.rotate(
                angle: -90 * math.pi / 180,
                child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
              elevation: 0,
              items: _hourMeasures,
              style: const TextStyle(color: Color(0XFFF1F1F1)),
              dropdownColor: const Color(0xFF00396D),
              value: _currentMeasure,
              onChanged: (dynamic value) {
                setState(() {
                  _currentMeasure = value;
                });
              })
        ],
      ),
    );
  }
}
