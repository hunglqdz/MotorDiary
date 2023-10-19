import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'cloud_storage_constants.dart';

@immutable
class CloudEvent {
  final String documentId;
  final String ownerUserId;
  final String type;
  const CloudEvent({
    required this.documentId,
    required this.ownerUserId,
    required this.type,
  });

  CloudEvent.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        ownerUserId = snapshot.data()[ownerUserIdFieldName],
        type = snapshot.data()[typeFieldName] as String;
}
