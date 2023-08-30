import 'package:flutter/material.dart';
import 'package:radagast/data/get_data.dart';
import 'package:radagast/gps/satellite_view.dart';
import 'package:radagast/plot_widgets/accelerometer.dart';
import 'package:radagast/plot_widgets/barometer.dart';
import 'package:radagast/plot_widgets/battery.dart';
import 'package:radagast/plot_widgets/gyroscope.dart';
import 'package:radagast/widgets/field_container.dart';
import 'package:radagast/widgets/footer.dart';
import 'package:radagast/widgets/statuses.dart';
import 'package:resizable_widget/resizable_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const Color separatorColor = Color(0xFF002357);
  static const Color bgColor = Color(0xFF002357);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Column(
          children: [
            Flexible(
              flex: 32,
              child: Container(
                margin: const EdgeInsets.all(25),
                child: ResizableWidget(
                  isHorizontalSeparator: false,
                  separatorColor: separatorColor,
                  separatorSize: 15,
                  children: [
                    ResizableWidget(
                        isHorizontalSeparator: true,
                        separatorColor: separatorColor,
                        separatorSize: 15,
                        children: [
                          SimpleMap(),
                          AccelerometerPlots(),
                        ]),
                    ResizableWidget(
                      isHorizontalSeparator: true,
                      separatorColor: separatorColor,
                      separatorSize: 15,
                      percentages: const [0.5, 0.4, 0.1],
                      children: [
                        BarometerPlots(),
                        ResizableWidget(
                            isHorizontalSeparator: false,
                            separatorColor: separatorColor,
                            separatorSize: 15,
                            children: [
                              GyroscopePlotter(),
                              // Container(color: Colors.blue),
                              BatteryPlotter(),
                            ]),
                        Statuses(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                height: 40,
                child: Footer(),
              ),
            )
          ],
        ));
  }
}
