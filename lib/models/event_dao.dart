import 'package:firebase_database/firebase_database.dart';

import 'event.dart';

class EventDao {
  final DatabaseReference _dbRef =
      FirebaseDatabase.instance.ref().child('events');

  void saveEvent(Event event) {
    _dbRef.push().set(event.toJson());
  }

  Query getEventQuery() {
    return _dbRef;
  }
}
