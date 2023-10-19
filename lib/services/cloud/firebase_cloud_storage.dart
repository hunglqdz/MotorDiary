import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motor_diary/services/cloud/cloud_event.dart';
import 'package:motor_diary/services/cloud/cloud_storage_constants.dart';
import 'package:motor_diary/services/cloud/cloud_storage_exceptions.dart';

class FirebaseCloudStorage {
  final events = FirebaseFirestore.instance.collection('events');

  Future<void> deleteEvent({required String documentId}) async {
    try {
      await events.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteEventException();
    }
  }

  Future<void> updateEvent({
    required String documentId,
    required String type,
  }) async {
    try {
      await events.doc(documentId).update({typeFieldName: type});
    } catch (e) {
      throw CouldNotUpdateEventException();
    }
  }

  Stream<Iterable<CloudEvent>> allEvents({required String ownerUserId}) =>
      events.snapshots().map((event) => event.docs
          .map((doc) => CloudEvent.fromSnapshot(doc))
          .where((event) => event.ownerUserId == ownerUserId));

  Future<Iterable<CloudEvent>> getEvents({required String ownerUserId}) async {
    try {
      return await events
          .where(
            ownerUserIdFieldName,
            isEqualTo: ownerUserId,
          )
          .get()
          .then(
            (value) => value.docs.map(
              (doc) => CloudEvent.fromSnapshot(doc),
            ),
          );
    } catch (e) {
      throw CouldNotGetAllEventsException();
    }
  }

  Future<CloudEvent> createNewEvent({required String ownerUserId}) async {
    final document = await events.add({
      ownerUserIdFieldName: ownerUserId,
      typeFieldName: '',
    });
    final fetchedEvent = await document.get();
    return CloudEvent(
      documentId: fetchedEvent.id,
      ownerUserId: ownerUserId,
      type: '',
    );
  }

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();
  FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;
}
