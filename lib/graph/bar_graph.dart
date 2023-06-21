import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List odometer;
  const MyBarGraph({super.key, required this.odometer});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      odo1: odometer[0],
      odo2: odometer[1],
      odo3: odometer[2],
      odo4: odometer[3],
      odo5: odometer[4],
    );
    myBarData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: 20000,
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            ),
          ),
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Colors.amber,
                    width: 25,
                    borderRadius: BorderRadius.circular(5),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: 20000,
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('1/1/23', style: style);
      break;
    case 1:
      text = const Text('1/2/23', style: style);
      break;
    case 2:
      text = const Text('1/3/23', style: style);
      break;
    case 3:
      text = const Text('1/4/23', style: style);
      break;
    case 4:
      text = const Text('1/5/23', style: style);
      break;

    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
