import 'package:flutter/material.dart';
import 'package:radagast/plot_widgets/plotter.dart';
import 'package:radagast/widgets/field_container.dart';

class BatteryPlotter extends StatefulWidget {
  const BatteryPlotter({Key? key}) : super(key: key);

  @override
  State<BatteryPlotter> createState() => _BatteryPlotterState();
}

class _BatteryPlotterState extends State<BatteryPlotter> {
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      title: "Battery",
      child: const SimplePlotter(
        titleX: "Time (s)",
        titleY: "Voltage (V)",
        bgColor: Color(0xFF000834),
        dataX: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        dataY: [9.3, 9.3, 9, 8.9, 8.7, 8.3, 8.1, 8, 7.9, 7.8],
      ),
    );
  }
}
