import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Coord {
  Coord({
    required this.x,
    required this.y,
  });
  double x;
  double y;
}

List<FlSpot> generateData({required double FNW, double offset = 0, bool? isAbove}) {
  return List<FlSpot>.generate(10, (i) {
    late double enzoScore;
    print('FNW: $FNW');
    if (i == 0) {
      return FlSpot(
        0.0,
        0.0,
      );
    }
    if (isAbove == null) {
      enzoScore = calculateEnzoScore(i * FNW) + 0.0;
    } else {
      if (isAbove) {
        enzoScore = calculateEnzoScore(i * FNW + offset) + 0.0;
      } else {
        enzoScore = calculateEnzoScore(i * FNW - offset) + 0.0;
      }
    }
    print('new point year: $i , S: $enzoScore');
    return FlSpot(
      i + 0.0,
      enzoScore,
    );
  });
}

int calculateEnzoScore(double FNW) {
  if (FNW <= 0) {
    return 0;
  }
  return (4.7932 * math.log(FNW) + 24.768).round();
}

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? sampleEmpty : sampleData1,
      swapAnimationDuration: const Duration(milliseconds: 500),
      swapAnimationCurve: Curves.linear,
    );
  }

  LineChartData get sampleEmpty => LineChartData(
        gridData: gridData,
        titlesData: titlesData1,
        lineBarsData: LineBarInitial,
        minX: 0,
        maxX: 10,
        maxY: 100,
        minY: 0,
      );

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        clipData: FlClipData.all(),
        betweenBarsData: [
          BetweenBarsData(
            fromIndex: 0,
            toIndex: 1,
            color: Colors.red.withOpacity(0.5),
          ),
          BetweenBarsData(
            fromIndex: 1,
            toIndex: 2,
            color: Colors.greenAccent.withOpacity(0.5),
          ),
        ],
        minX: 0,
        maxX: 10,
        maxY: 100,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<LineChartBarData> get LineBarInitial => [
        LineChartBarData(spots: List<FlSpot>.generate(100, (index) => FlSpot(0, 0))),
        LineChartBarData(spots: List<FlSpot>.generate(100, (index) => FlSpot(0, 0))),
        LineChartBarData(spots: List<FlSpot>.generate(100, (index) => FlSpot(0, 0))),
      ];

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 50),
          child: Text('2022', style: style),
        );
        break;
      case 10:
        text = const Padding(
          padding: EdgeInsets.only(top: 10.0, right: 50),
          child: Text('2032', style: style),
        );
        break;
      default:
        text = const Text('');
        break;
    }
    return text;
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 28,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.transparent),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.red,
        barWidth: 1,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        dashArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        spots: generateData(FNW: 100000, offset: 30000, isAbove: false),
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.black,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        spots: generateData(FNW: 100000),
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: Colors.green,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        dashArray: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        spots: generateData(FNW: 100000, offset: 30000, isAbove: true),
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.all(Radius.circular(18)),
            // gradient: LinearGradient(
            //   colors: [
            //     Color(0xff2c274c),
            //     Color(0xff46426c),
            //   ],
            //   begin: Alignment.bottomCenter,
            //   end: Alignment.topCenter,
            // ),
            color: Colors.white),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child: _LineChart(isShowingMainData: isShowingMainData),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.black.withOpacity(isShowingMainData ? 1.0 : 0.5),
              ),
              onPressed: () {
                setState(() {
                  isShowingMainData = !isShowingMainData;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
