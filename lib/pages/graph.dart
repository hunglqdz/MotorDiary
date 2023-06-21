import 'package:flutter/material.dart';

import '../graph/bar_graph.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  List<double> odometer = [12345, 13579, 14725, 15978, 17935];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SizedBox(
          height: 200,
          child: MyBarGraph(
            odometer: odometer,
          ),
        ),
      ),
    );
  }
}
