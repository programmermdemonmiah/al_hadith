// To parse this JSON data, do
//
//     final hadithBookModel = hadithBookModelFromJson(jsonString);

import 'dart:convert';

List<HadithBookModel> hadithBookModelFromJson(String str) =>
    List<HadithBookModel>.from(
        json.decode(str).map((x) => HadithBookModel.fromJson(x)));

String hadithBookModelToJson(List<HadithBookModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HadithBookModel {
  int? hadithId;
  int? bookId;
  String? bookName;
  String? bookTitle;
  String? bookAbvrCode;
  int? chapterId;
  int? sectionId;
  String? narrator;
  String? bn;
  String? ar;
  String? arDiacless;
  String? note;
  int? gradeId;
  String? grade;
  String? gradeColor;
  String? chapterTitle;
  String? chapterPreface;
  int? chapterNumber;
  String? sectionTitle;
  String? sectionPreface;
  String? sectionNumber;

  HadithBookModel({
    this.hadithId,
    this.bookId,
    this.bookName,
    this.bookTitle,
    this.bookAbvrCode,
    this.chapterId,
    this.sectionId,
    this.narrator,
    this.bn,
    this.ar,
    this.arDiacless,
    this.note,
    this.gradeId,
    this.grade,
    this.gradeColor,
    this.chapterTitle,
    this.chapterPreface,
    this.chapterNumber,
    this.sectionTitle,
    this.sectionPreface,
    this.sectionNumber,
  });

  factory HadithBookModel.fromJson(Map<String, dynamic> json) =>
      HadithBookModel(
        hadithId: json["hadith_id"],
        bookId: json["book_id"],
        bookName: json["book_name"],
        bookTitle: json["book_title"],
        bookAbvrCode: json["book_abvr_code"],
        chapterId: json["chapter_id"],
        sectionId: json["section_id"],
        narrator: json["narrator"],
        bn: json["bn"],
        ar: json["ar"],
        arDiacless: json["ar_diacless"],
        note: json["note"],
        gradeId: json["grade_id"],
        grade: json["grade"],
        gradeColor: json["grade_color"],
        chapterTitle: json["chapter_title"],
        chapterPreface: json["chapter_preface"],
        chapterNumber: json["chapter_number"],
        sectionTitle: json["section_title"],
        sectionPreface: json["section_preface"],
        sectionNumber: json["section_number"],
      );

  Map<String, dynamic> toJson() => {
        "hadith_id": hadithId,
        "book_id": bookId,
        "book_name": bookName,
        "book_title": bookTitle,
        "book_abvr_code": bookAbvrCode,
        "chapter_id": chapterId,
        "section_id": sectionId,
        "narrator": narrator,
        "bn": bn,
        "ar": ar,
        "ar_diacless": arDiacless,
        "note": note,
        "grade_id": gradeId,
        "grade": grade,
        "grade_color": gradeColor,
        "chapter_title": chapterTitle,
        "chapter_preface": chapterPreface,
        "chapter_number": chapterNumber,
        "section_title": sectionTitle,
        "section_preface": sectionPreface,
        "section_number": sectionNumber,
      };
}
