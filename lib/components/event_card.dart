import 'package:flutter/material.dart';
import 'package:motor_diary/constant.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final child;
  const EventCard({super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPast ? primaryColor : accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
