import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseForm {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(
      join(dbPath, 'ppkd.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ppkd (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            jurusan TEXT
          )
        ''');
      },
    );
  }
}
