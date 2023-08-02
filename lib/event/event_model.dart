import 'dart:ui';

class Event {
  final int? id;
  final String odometer;
  final String type;
  final Color color;

  const Event(
      {required this.odometer,
      required this.type,
      required this.color,
      this.id});

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json['id'],
        odometer: json['odometer'],
        type: json['type'],
        color: json['color'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'odometer': odometer,
        'type': type,
        'color': color,
      };
}
