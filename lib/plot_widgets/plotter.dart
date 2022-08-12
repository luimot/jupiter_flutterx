import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _Axes {
  final num x, y;
  _Axes(this.x, this.y);
}

class SimplePlotter extends StatefulWidget {
  final Color? bgColor;
  final String? title;
  final String? titleX;
  final String? titleY;
  final List<dynamic> dataX;
  final List<dynamic> dataY;
  final dynamic xLimit;
  const SimplePlotter(
      {this.bgColor,
      this.title,
      required this.dataX,
      required this.dataY,
      this.titleX,
      this.titleY,
      this.xLimit,
      Key? key})
      : super(key: key);

  @override
  _SimplePlotterState createState() => _SimplePlotterState();
}

class _SimplePlotterState extends State<SimplePlotter> {
  late String titleX, titleY;
  @override
  void initState() {
    super.initState();
    titleX = widget.titleX != null ? widget.titleX! : 'X Axis';
    titleY = widget.titleY != null ? widget.titleY! : 'Y Axis';
  }

  static const MajorGridLines _defaultGridLines =
      MajorGridLines(color: Color(0xFFF1F1F1));
  static const MajorTickLines _defaultTickLines =
      MajorTickLines(color: Color(0xFFF1F1F1));
  static const AxisLine _defaultAxisLine = AxisLine(color: Color(0xFFF1F1F1));
  static const TextStyle _titleStyle = TextStyle(color: Color(0xFFF1F1F1));
  @override
  Widget build(BuildContext context) {
    NumericAxis _xAxisConfiguration = NumericAxis(
        title: AxisTitle(text: titleX, textStyle: _titleStyle),
        plotOffset: 5,
        axisLine: _defaultAxisLine,
        majorGridLines: _defaultGridLines,
        majorTickLines: _defaultTickLines);
    NumericAxis _yAxisConfiguration = NumericAxis(
      title: AxisTitle(text: titleY, textStyle: _titleStyle),
      majorGridLines: _defaultGridLines,
      axisLine: _defaultAxisLine,
      majorTickLines: _defaultTickLines,
    );
    return SfCartesianChart(
      plotAreaBorderWidth: 2,
      backgroundColor: widget.bgColor ?? Colors.white,
      title: ChartTitle(text: widget.title ?? ''),
      primaryXAxis: _xAxisConfiguration,
      primaryYAxis: _yAxisConfiguration,
      series: _getSeries(),
      palette: const [Colors.red],
      tooltipBehavior: TooltipBehavior(
        enable: true,
        color: Colors.red,
        duration: 1000,
      ),
    );
  }

  List<LineSeries<_Axes, num>> _getSeries() {
    List<_Axes> chartData = addToChartData();
    return [
      LineSeries(
        name: titleX,
        dataSource: chartData,
        xAxisName: titleX,
        yAxisName: titleY,
        xValueMapper: (_Axes data, _) => data.x,
        yValueMapper: (_Axes data, _) => data.y,
      )
    ];
  }

  List<_Axes> addToChartData() {
    List<_Axes> chartData = [];
    for (int i = 0; i < widget.dataY.length; i++) {
      chartData.add(_Axes(widget.dataX[i], widget.dataY[i]));
      if (widget.xLimit != null &&
          (widget.xLimit > 0 && widget.xLimit >= widget.dataX[i] ||
              widget.xLimit < 0 && widget.xLimit <= widget.dataX[i])) {
        break; // X axis limit
      }
    }
    return chartData;
  }
}
