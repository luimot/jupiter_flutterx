import 'package:flutter/material.dart';
import 'package:jupiter_flutterx/plot_widgets/plotter.dart';
import 'package:jupiter_flutterx/widgets/field_container.dart';

class AccelerometerPlots extends StatefulWidget {
  const AccelerometerPlots({Key? key}) : super(key: key);

  @override
  State<AccelerometerPlots> createState() => _AccelerometerPlotsState();
}

class _AccelerometerPlotsState extends State<AccelerometerPlots> {
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      title: "Accelerometer",
      child: SimplePlotter(
          titleX: "Time (s)",
          titleY: "Acceleration (m/s²)",
          bgColor: const Color(0xFF000834),
          dataX: [1, 2, 3, 4, 5, 6, 7],
          dataY: [0.1, 0.2, 0.3, 0.4, -0.5, 0.3, 0.3]),
    );
  }
}
