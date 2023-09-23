class Event {
  String? key;
  EventData? eventData;

  Event({this.key, this.eventData});
}

class EventData {
  String? type;
  String? odo;

  EventData({this.type, this.odo});

  EventData.fromJson(Map<dynamic, dynamic> json) {
    type = json['type'];
    odo = json['odo'];
  }
}
