import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBController {
  static Database? _database;

  static Future<void> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "hadith_db.db");

    // Check if the database exists
    final dataExist = await databaseExists(path);

    if (!dataExist) {
      // print("call");
      try {
        await _copyDatabaseFromAssets(path);
        print("successfully copy");
      } catch (e) {
        print("Error: $e");
      }
    }

    _database = await openDatabase(path);
  }

//====copy dtabase =======
  static Future<void> _copyDatabaseFromAssets(String path) async {
    final ByteData data = await rootBundle.load('assets/db/hadith_db.db');
    final List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(path).writeAsBytes(bytes, flush: true);
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    if (_database == null) {
      await initDB();
    }

    final db = _database!;
    final allData = await db.rawQuery('''
      SELECT * FROM hadith
      JOIN books ON hadith.book_id = books.id
      JOIN chapter ON hadith.chapter_id = chapter.chapter_id
      JOIN section ON hadith.section_id = section.section_id
    ''');

    return allData;
  }
}
