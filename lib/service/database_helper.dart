import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../event/event_model.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = 'Events.db';

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => await db.execute(
          "CREATE TABLE Event(id INTEGER PRIMARY KEY, odometer TEXT NOT NULL);"),
      version: _version,
    );
  }

  static Future<int> addEvent(Event event) async {
    final db = await _getDB();
    return await db.insert(
      "Event",
      event.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> updateEvent(Event event) async {
    final db = await _getDB();
    return await db.update(
      "Event",
      event.toJson(),
      where: 'id = ?',
      whereArgs: [event.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<int> deleteEvent(Event event) async {
    final db = await _getDB();
    return await db.delete(
      "Event",
      where: 'id = ?',
      whereArgs: [event.id],
    );
  }

  static Future<List<Event>?> getAllEvents() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Event");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Event.fromJson(maps[index]));
  }
}
