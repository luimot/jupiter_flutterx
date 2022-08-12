import 'package:flutter/material.dart';
import 'package:jupiter_flutterx/plot_widgets/plotter.dart';
import 'package:jupiter_flutterx/widgets/field_container.dart';

class BarometerPlots extends StatefulWidget {
  const BarometerPlots({Key? key}) : super(key: key);

  @override
  State<BarometerPlots> createState() => _BarometerPlotsState();
}

class _BarometerPlotsState extends State<BarometerPlots> {
  @override
  Widget build(BuildContext context) {
    return FieldContainer(
      title: "Barometer",
      child: const SimplePlotter(
        titleX: "Time (s)",
        titleY: "Pressure (Pa)",
        bgColor: Color(0xFF000834),
        dataX: [0.2, 0.3],
        dataY: [1, 2],
      ),
    );
  }
}
