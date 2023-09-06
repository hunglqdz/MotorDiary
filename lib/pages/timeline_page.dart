import 'package:flutter/material.dart';
import 'package:motor_diary/components/my_timeline_tile.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  // final List<String> odos = <String>[
  //   '56789',
  //   '45678',
  //   '34567',
  //   '23456',
  //   '12345'
  // ];
  // final List<Color> colorCodes = <Color>[
  //   oilChangeColor,
  //   maintenanceColor,
  //   updateColor,
  //   oilChangeColor,
  //   maintenanceColor
  // ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Event list'),
  //       centerTitle: true,
  //     ),
  //     body: ListView.separated(
  //       padding: const EdgeInsets.all(8),
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           height: 50,
  //           color: colorCodes[index],
  //           child: Center(
  //             child: Text('Odo: ${odos[index]}'),
  //           ),
  //         );
  //       },
  //       separatorBuilder: (BuildContext context, int index) => const Divider(),
  //       itemCount: odos.length,
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          children: const [
            MyTimelineTile(
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCard: Column(
                children: [
                  Text('Oil Change'),
                  Row(
                    children: [
                      Text('Date: 22/11/2022'),
                      Text('Odo: 34567'),
                    ],
                  ),
                ],
              ),
            ),
            MyTimelineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              eventCard: Column(
                children: [
                  Text('Maintenance'),
                  Row(
                    children: [
                      Text('Date: 22/10/2022'),
                      Text('Odo: 33445'),
                    ],
                  ),
                ],
              ),
            ),
            MyTimelineTile(
              isFirst: false,
              isLast: true,
              isPast: false,
              eventCard: Column(
                children: [
                  Text('Oil Change'),
                  Row(
                    children: [
                      Text('Date: 22/1/2022'),
                      Text('Odo: 29876'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
