// class Event {
//   String? key;
//   EventData? eventData;
//
//   Event({this.key, this.eventData});
// }
//
// class EventData {
//   String? type;
//   String? odo;
//   String? date;
//
//   EventData({this.type, this.odo, this.date});
//
//   EventData.fromJson(Map<dynamic, dynamic> json) {
//     type = json['type'];
//     odo = json['odo'];
//     date = json['date'];
//   }
// }
class Event {
  final String type;
  final String odo;
  final DateTime date;

  Event(this.type, this.odo, this.date);

  Event.fromJson(Map<dynamic, dynamic> json)
      : date = DateTime.parse(json['date'] as String),
        type = json['text'] as String,
        odo = json['odo'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'date': date.toString(),
        'type': type,
        'odo': odo,
      };
}
