import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

Future<Database> initDatabase() async {
  return openDatabase(
    path.join(await getDatabasesPath(), 'nfcbiz.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE links(id INTEGER PRIMARY KEY, uri TEXT, description TEXT, category TEXT, email TEXT)',
      );
    },
    version: 1,
  );
}

Future<int> insertItem(Database db, Map<String, String> link) async {
  return await db.insert(
    'links',
    link,
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> getItems(
    Database db, String category, String email) async {
  return await db.query(
    'links',
    where: 'category = ? AND email = ?',
    whereArgs: [category, email],
  );
}

Future<List<Map<String, dynamic>>> getAll(Database db) async {
  return await db.query(
    'links',
  );
}

Future<int> deleteItem(Database db, int id) async {
  return await db.delete(
    'links',
    where: 'id = ?',
    whereArgs: [id],
  );
}
