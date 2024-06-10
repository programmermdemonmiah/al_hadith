// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

List<BooksModel> booksModelFromJson(String str) =>
    List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

String booksModelToJson(List<BooksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BooksModel {
  int? bookId;
  String? bookName;
  String? titleBn;
  String? titleAr;
  String? bookAbvrCode;
  String? bookDescr;
  int? numberOfHadis;

  BooksModel({
    this.bookId,
    this.bookName,
    this.titleBn,
    this.titleAr,
    this.bookAbvrCode,
    this.bookDescr,
    this.numberOfHadis,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        bookId: json["book_id"],
        bookName: json["book_name"],
        titleBn: json["title_bn"],
        titleAr: json["title_ar"],
        bookAbvrCode: json["book_abvr_code"],
        bookDescr: json["book_descr"],
        numberOfHadis: json["number_of_hadis"],
      );

  Map<String, dynamic> toJson() => {
        "book_id": bookId,
        "book_name": bookName,
        "title_bn": titleBn,
        "title_ar": titleAr,
        "book_abvr_code": bookAbvrCode,
        "book_descr": bookDescr,
        "number_of_hadis": numberOfHadis,
      };
}
