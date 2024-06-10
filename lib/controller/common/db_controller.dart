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
        SELECT 
    hadith.hadith_id as hadith_id,
    hadith.book_id as book_id,
    books.book_name as book_name,
    books.title as book_title,
    books.abvr_code as book_abvr_code,
    hadith.chapter_id as chapter_id,
    hadith.section_id as section_id,
    hadith.narrator as narrator,
    hadith.bn as bn,
    hadith.ar as ar,
    hadith.ar_diacless as ar_diacless,
    hadith.note as note,
    hadith.grade_id as grade_id,
    hadith.grade as grade,
    hadith.grade_color as grade_color,
    chapter.title as chapter_title,
    chapter.number as chapter_number,
    section.title as section_title,
    section.preface as section_preface,
    section.number as section_number
FROM 
    hadith
JOIN 
    books ON hadith.book_id = books.id
JOIN 
    chapter ON hadith.chapter_id = chapter.id
JOIN 
    section ON hadith.section_id = section.id;

    ''');

    return allData;
  }

  static Future<List<Map<String, dynamic>>> getBookData() async {
    if (_database == null) {
      await initDB();
    }

    final db = _database!;
    final allData = await db.rawQuery('''
      SELECT
      id as book_id,
      book_name,
      title as title_bn,
      title_ar,
      abvr_code as book_abvr_code,
      book_descr,
      number_of_hadis
    FROM books;
    ''');
    return allData;
  }

  static Future<List<Map<String, dynamic>>> getChapterData() async {
    if (_database == null) {
      await initDB();
    }

    final db = _database!;
    final allData = await db.rawQuery('''
    SELECT
      chapter_id,
      book_id,
      title,
      number,
      hadis_range,
      book_name
    FROM chapter;
  ''');

    return allData;
  }

  static Future<List<Map<String, dynamic>>> getSectionData() async {
    if (_database == null) {
      await initDB();
    }

    final db = _database!;
    final allData = await db.rawQuery('''
    SELECT
      id,
      book_id,
      book_name,
      chapter_id,
      section_id,
      title,
      preface,
      number
    FROM section;
  ''');

    return allData;
  }

  static Future<List<Map<String, dynamic>>> getHadithData() async {
    if (_database == null) {
      await initDB();
    }

    final db = _database!;
    final allData = await db.rawQuery('''
    SELECT
      hadith_id,
      book_id,
      book_name,
      chapter_id,
      section_id,
      narrator,
      bn,
      ar,
      ar_diacless,
      note,
      grade_id,
      grade,
      grade_color
    FROM hadith;
  ''');

    return allData;
  }
}
