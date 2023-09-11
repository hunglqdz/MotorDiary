import 'package:flutter/material.dart';

import '../components/my_timeline_tile.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: const [
            MyTimelineTile(
              isFirst: true,
              isLast: false,
              isPast: true,
              eventCard: Column(
                children: [
                  Text(
                    'Oil Change',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Spacer(),
                  Text('Date: 22 Nov 2022'),
                  Text('Odo: 34567'),
                ],
              ),
            ),
            MyTimelineTile(
              isFirst: false,
              isLast: false,
              isPast: true,
              eventCard: Column(
                children: [
                  Text(
                    'Maintenance',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Spacer(),
                  Text('Date: 22 Oct 2022'),
                  Text('Odo: 33445'),
                ],
              ),
            ),
            MyTimelineTile(
              isFirst: false,
              isLast: true,
              isPast: false,
              eventCard: Column(
                children: [
                  Text(
                    'Oil Change',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Spacer(),
                  Text('Date: 22 Jan 2022'),
                  Text('Odo: 29876'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
