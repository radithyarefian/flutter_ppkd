import 'package:flutter_ppkd/tugas/tugas11/database/sqflite.dart';
import 'package:flutter_ppkd/tugas/tugas11Saya/database/database.dart';
import 'package:flutter_ppkd/tugas/tugas11Saya/models/ppkd_model.dart';

class PpkdController {
  static Future<void> registerPpkd(PpkdModel ppkd) async {
    final dbs = await DatabaseForm.db();
    await dbs.insert('ppkd', ppkd.toMap());
    print(ppkd.toMap());
  }

  static Future<List<PpkdModel>> getAllPpkd() async {
    final dbs = await DatabaseForm.db();
    final List<Map<String, dynamic>> results = await dbs.query("ppkd");
    print(results.map((e) => PpkdModel.fromMap(e)).toList());
    return results.map((e) => PpkdModel.fromMap(e)).toList();
  }

  static Future<int> updatePpkd(PpkdModel ppkd) async {
    final dbs = await DatabaseForm.db();

    if (ppkd.id == null) {
      throw Exception("updateSiswa butuh siswa");
    }

    return dbs.update(
      'ppkd',
      ppkd.toMap(),
      where: 'id = ?',
      whereArgs: [ppkd.id],
    );
  }

  static Future<int> deletePpkd(int id) async {
    final dbs = await DatabaseForm.db();
    return dbs.delete('ppkd', where: 'id = ?', whereArgs: [id]);
  }
}
