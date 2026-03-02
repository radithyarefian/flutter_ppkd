import 'package:flutter_ppkd/tugas/tugas11/models/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbpath = await getDatabasesPath();
    return openDatabase(
      join(dbpath, 'serbaneka.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
      },
      version: 2,
      onUpgrade: (db, oldversion, newVersion) async {
        if (oldversion < 2) {
          await db.execute(
            'CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
          );
        }
      },
    );
  }

  static Future<void> registerUser(UserModel user) async {
    final dbs = await db();
    await dbs.insert('user', user.toMap());
  }

  static Future<UserModel?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      "user",
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      return UserModel.fromMap(results.first);
    }
    return null;
  }
}
