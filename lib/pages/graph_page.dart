import 'package:flutter/material.dart';
import 'package:motor_diary/constant.dart';

import '../graph/bar_graph.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  List<double> odometer = [
    11234,
    15976,
    19746,
    22093,
    25739,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      body: Center(
        child: SizedBox(
          height: 300,
          width: 350,
          child: MyBarGraph(
            odometer: odometer,
          ),
        ),
      ),
    );
  }
}
