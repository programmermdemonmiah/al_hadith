class SectionModel {
  final int id;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int sectionId;
  final String title;
  final String preface;
  final String number;

  SectionModel({
    required this.id,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.title,
    required this.preface,
    required this.number,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['id'] ?? 0,
      bookId: json['book_id'] ?? 0,
      bookName: json['book_name'] ?? '',
      chapterId: json['chapter_id'] ?? 0,
      sectionId: json['section_id'] ?? 0,
      title: json['title'] ?? '',
      preface: json['preface'] ?? '',
      number: json['number'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'book_id': bookId,
      'book_name': bookName,
      'chapter_id': chapterId,
      'section_id': sectionId,
      'title': title,
      'preface': preface,
      'number': number,
    };
  }
}
