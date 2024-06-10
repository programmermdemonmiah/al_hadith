class HadithModel {
  final int hadithId;
  final int bookId;
  final String bookName;
  final int chapterId;
  final int sectionId;
  final String narrator;
  final String bn;
  final String ar;
  final String arDiacless;
  final String note;
  final int gradeId;
  final String grade;
  final String gradeColor;

  HadithModel({
    required this.hadithId,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.narrator,
    required this.bn,
    required this.ar,
    required this.arDiacless,
    required this.note,
    required this.gradeId,
    required this.grade,
    required this.gradeColor,
  });

  factory HadithModel.fromJson(Map<String, dynamic> json) {
    return HadithModel(
      hadithId: json['hadith_id'] ?? 0,
      bookId: json['book_id'] ?? 0,
      bookName: json['book_name'] ?? '',
      chapterId: json['chapter_id'] ?? 0,
      sectionId: json['section_id'] ?? 0,
      narrator: json['narrator'] ?? '',
      bn: json['bn'] ?? '',
      ar: json['ar'] ?? '',
      arDiacless: json['ar_diacless'] ?? '',
      note: json['note'] ?? '',
      gradeId: json['grade_id'] ?? 0,
      grade: json['grade'] ?? '',
      gradeColor: json['grade_color'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hadith_id': hadithId,
      'book_id': bookId,
      'book_name': bookName,
      'chapter_id': chapterId,
      'section_id': sectionId,
      'narrator': narrator,
      'bn': bn,
      'ar': ar,
      'ar_diacless': arDiacless,
      'note': note,
      'grade_id': gradeId,
      'grade': grade,
      'grade_color': gradeColor,
    };
  }
}
