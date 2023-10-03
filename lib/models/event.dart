class Event {
  String? key;
  EventData? eventData;

  Event({this.key, this.eventData});
}

class EventData {
  String? type;
  String? odo;
  String? date;

  EventData({this.type, this.odo, this.date});

  EventData.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    odo = json['odo'];
    date = json['date'];
  }
}
