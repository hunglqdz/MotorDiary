// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:motor_diary/extensions/list/filter.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// import 'crud_exceptions.dart';
//
// class EventsService {
//   Database? _db;
//
//   List<DatabaseEvent> _events = [];
//
//   DatabaseUser? _user;
//
//   static final EventsService _shared = EventsService._sharedInstance();
//   EventsService._sharedInstance() {
//     _eventsStreamController = StreamController<List<DatabaseEvent>>.broadcast(
//       onListen: () {
//         _eventsStreamController.sink.add(_events);
//       },
//     );
//   }
//   factory EventsService() => _shared;
//
//   late final StreamController<List<DatabaseEvent>> _eventsStreamController;
//
//   Stream<List<DatabaseEvent>> get allEvents =>
//       _eventsStreamController.stream.filter((event) {
//         final currentUser = _user;
//         if (currentUser != null) {
//           return event.userId == currentUser.id;
//         } else {
//           throw UserShouldBeSetBeforeReadingAllEvents();
//         }
//       });
//
//   Future<DatabaseUser> getOrCreateUser({
//     required String email,
//     bool setAsCurrentUser = true,
//   }) async {
//     try {
//       final user = await getUser(email: email);
//       if (setAsCurrentUser) {
//         _user = user;
//       }
//       return user;
//     } on CouldNotFindUser {
//       final createdUser = await createUser(email: email);
//       if (setAsCurrentUser) {
//         _user = createdUser;
//       }
//       return createdUser;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<void> _cacheEvents() async {
//     final allEvents = await getAllEvents();
//     _events = allEvents.toList();
//     _eventsStreamController.add(_events);
//   }
//
//   Future<DatabaseEvent> updateEvent({
//     required DatabaseEvent event,
//     required String type,
//   }) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//
//     await getEvent(id: event.id);
//
//     final updatesCount = await db.update(
//       eventTable,
//       {
//         typeColumn: type,
//         isSyncedWithCloudColumn: 0,
//       },
//       where: 'id = ?',
//       whereArgs: [event.id],
//     );
//
//     if (updatesCount == 0) {
//       throw CouldNotUpdateEvent();
//     } else {
//       final updatedEvent = await getEvent(id: event.id);
//       _events.removeWhere((event) => event.id == updatedEvent.id);
//       _events.add(updatedEvent);
//       _eventsStreamController.add(_events);
//       return updatedEvent;
//     }
//   }
//
//   Future<Iterable<DatabaseEvent>> getAllEvents() async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final events = await db.query(eventTable);
//
//     return events.map((eventRow) => DatabaseEvent.fromRow(eventRow));
//   }
//
//   Future<DatabaseEvent> getEvent({required int id}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final events = await db.query(
//       eventTable,
//       limit: 1,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//
//     if (events.isEmpty) {
//       throw CouldNotFindEvent();
//     } else {
//       final event = DatabaseEvent.fromRow(events.first);
//       _events.removeWhere((event) => event.id == id);
//       _events.add(event);
//       _eventsStreamController.add(_events);
//       return event;
//     }
//   }
//
//   Future<int> deleteAllEvents() async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final numberOfDeletions = await db.delete(eventTable);
//     _events = [];
//     _eventsStreamController.add(_events);
//     return numberOfDeletions;
//   }
//
//   Future<void> deleteEvent({required int id}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final deletedCount = await db.delete(
//       eventTable,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//     if (deletedCount == 0) {
//       throw CouldNotDeleteEvent();
//     } else {
//       _events.removeWhere((event) => event.id == id);
//       _eventsStreamController.add(_events);
//     }
//   }
//
//   Future<DatabaseEvent> createEvent({required DatabaseUser owner}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//
//     final dbUser = await getUser(email: owner.email);
//     if (dbUser != owner) {
//       throw CouldNotFindUser();
//     }
//
//     const type = '';
//
//     final eventId = await db.insert(eventTable, {
//       userIdColumn: owner.id,
//       typeColumn: type,
//       isSyncedWithCloudColumn: 1,
//     });
//
//     final event = DatabaseEvent(
//       id: eventId,
//       userId: owner.id,
//       type: type,
//       isSyncedWithCloud: true,
//     );
//
//     _events.add(event);
//     _eventsStreamController.add(_events);
//
//     return event;
//   }
//
//   Future<DatabaseUser> getUser({required String email}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//
//     final results = await db.query(
//       userTable,
//       limit: 1,
//       where: 'email = ?',
//       whereArgs: [email.toLowerCase()],
//     );
//
//     if (results.isEmpty) {
//       throw CouldNotFindUser();
//     } else {
//       return DatabaseUser.fromRow(results.first);
//     }
//   }
//
//   Future<void> deleteUser({required String email}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final deletedCount = await db.delete(
//       userTable,
//       where: 'email = ?',
//       whereArgs: [email.toLowerCase()],
//     );
//     if (deletedCount != 1) {
//       throw CouldNotDeleteUser();
//     }
//   }
//
//   Future<DatabaseUser> createUser({required String email}) async {
//     await _ensureDbIsOpen();
//     final db = _getDatabaseOrThrow();
//     final results = await db.query(
//       userTable,
//       limit: 1,
//       where: 'email = ?',
//       whereArgs: [email.toLowerCase()],
//     );
//     if (results.isNotEmpty) {
//       throw UserAlreadyExists();
//     }
//
//     final userId = await db.insert(userTable, {
//       emailColumn: email.toLowerCase(),
//     });
//
//     return DatabaseUser(
//       id: userId,
//       email: email,
//     );
//   }
//
//   Database _getDatabaseOrThrow() {
//     final db = _db;
//     if (db == null) {
//       throw DatabaseIsNotOpen();
//     } else {
//       return db;
//     }
//   }
//
//   Future<void> close() async {
//     final db = _db;
//     if (db == null) {
//       throw DatabaseIsNotOpen();
//     } else {
//       await db.close();
//       _db = null;
//     }
//   }
//
//   Future<void> _ensureDbIsOpen() async {
//     try {
//       await open();
//     } on DatabaseAlreadyOpenException {}
//   }
//
//   Future<void> open() async {
//     if (_db != null) {
//       throw DatabaseAlreadyOpenException();
//     }
//     try {
//       final docsPath = await getApplicationDocumentsDirectory();
//       final dbPath = join(docsPath.path, dbName);
//       final db = await openDatabase(dbPath);
//       _db = db;
//
//       await db.execute(createUserTable);
//
//       await db.execute(createEventTable);
//       await _cacheEvents();
//     } on MissingPlatformDirectoryException {
//       throw UnableToGetDocumentsDirectory();
//     }
//   }
// }
//
// @immutable
// class DatabaseUser {
//   final int id;
//   final String email;
//   const DatabaseUser({
//     required this.id,
//     required this.email,
//   });
//
//   DatabaseUser.fromRow(Map<String, Object?> map)
//       : id = map[idColumn] as int,
//         email = map[emailColumn] as String;
//
//   @override
//   String toString() => 'Person, ID = $id, email = $email';
//
//   @override
//   bool operator ==(covariant DatabaseUser other) => id == other.id;
//
//   @override
//   int get hashCode => id.hashCode;
// }
//
// class DatabaseEvent {
//   final int id;
//   final int userId;
//   final String type;
//   final bool isSyncedWithCloud;
//
//   DatabaseEvent({
//     required this.id,
//     required this.userId,
//     required this.type,
//     required this.isSyncedWithCloud,
//   });
//
//   DatabaseEvent.fromRow(Map<String, Object?> map)
//       : id = map[idColumn] as int,
//         userId = map[userIdColumn] as int,
//         type = map[typeColumn] as String,
//         isSyncedWithCloud =
//             (map[isSyncedWithCloudColumn] as int) == 1 ? true : false;
//
//   @override
//   String toString() =>
//       'Event, ID = $id, userId = $userId, isSyncedWithCloud = $isSyncedWithCloud, type = $type';
//
//   @override
//   bool operator ==(covariant DatabaseEvent other) => id == other.id;
//
//   @override
//   int get hashCode => id.hashCode;
// }
//
// const dbName = 'events.db';
// const eventTable = 'event';
// const userTable = 'user';
// const idColumn = 'id';
// const emailColumn = 'email';
// const userIdColumn = 'user_id';
// const typeColumn = 'type';
// const isSyncedWithCloudColumn = 'is_synced_with_cloud';
// const createUserTable = '''CREATE TABLE IF NOT EXISTS "user" (
//         "id"	INTEGER NOT NULL,
//         "email"	TEXT NOT NULL UNIQUE,
//         PRIMARY KEY("id" AUTOINCREMENT)
//       );''';
// const createEventTable = '''CREATE TABLE IF NOT EXISTS "event" (
//         "id"	INTEGER NOT NULL,
//         "user_id"	INTEGER NOT NULL,
//         "type"	TEXT NOT NULL,
//         "is_synced_with_cloud"	INTEGER NOT NULL DEFAULT 0,
//         FOREIGN KEY("user_id") REFERENCES "user"("id"),
//         PRIMARY KEY("id" AUTOINCREMENT)
//       );''';
