import 'package:flutter/material.dart';
import 'package:jupiter_flutterx/plot_widgets/plotter.dart';
import 'package:jupiter_flutterx/widgets/field_container.dart';

class GyroscopePlotter extends StatefulWidget {
  const GyroscopePlotter({Key? key}) : super(key: key);

  @override
  State<GyroscopePlotter> createState() => _GyroscopePlotterState();
}

class _GyroscopePlotterState extends State<GyroscopePlotter> {
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      title: "Gyroscope",
      child: const SimplePlotter(
        titleX: "Time (s)",
        titleY: "Angular Velocity (rad/s)",
        bgColor: Color(0xFF000834),
        dataX: [0.2, 0.3],
        dataY: [1, 2],
      ),
    );
  }
}
