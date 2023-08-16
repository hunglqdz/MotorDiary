import 'package:flutter/material.dart';
import 'package:motor_diary/constant.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  final List<String> odos = <String>[
    '56789',
    '45678',
    '34567',
    '23456',
    '12345'
  ];
  final List<Color> colorCodes = <Color>[
    oilChangeColor,
    maintenanceColor,
    updateColor,
    oilChangeColor,
    maintenanceColor
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event list'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: colorCodes[index],
            child: Center(
              child: Text('Odo: ${odos[index]}'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: odos.length,
      ),
    );
  }
}
