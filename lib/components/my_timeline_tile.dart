import 'package:flutter/material.dart';
import 'package:motor_diary/components/event_card.dart';
import 'package:motor_diary/widgets/constant.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;

  const MyTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: isPast ? primaryColor : accentColor),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: isPast ? primaryColor : accentColor,
          iconStyle: IconStyle(
            iconData: Icons.done,
            color: isPast ? Colors.white : accentColor,
          ),
        ),
        endChild: EventCard(
          isPast: isPast,
          child: eventCard,
        ),
      ),
    );
  }
}
