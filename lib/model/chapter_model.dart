// To parse this JSON data, do
//
//     final chapterModel = chapterModelFromJson(jsonString);

import 'dart:convert';

List<ChapterModel> chapterModelFromJson(String str) => List<ChapterModel>.from(
    json.decode(str).map((x) => ChapterModel.fromJson(x)));

String chapterModelToJson(List<ChapterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChapterModel {
  int? chapterId;
  int? bookId;
  String? title;
  int? number;
  String? hadisRange;
  String? bookName;

  ChapterModel({
    this.chapterId,
    this.bookId,
    this.title,
    this.number,
    this.hadisRange,
    this.bookName,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        chapterId: json["chapter_id"],
        bookId: json["book_id"],
        title: json["title"],
        number: json["number"],
        hadisRange: json["hadis_range"],
        bookName: json["book_name"],
      );

  Map<String, dynamic> toJson() => {
        "chapter_id": chapterId,
        "book_id": bookId,
        "title": title,
        "number": number,
        "hadis_range": hadisRange,
        "book_name": bookName,
      };
}
