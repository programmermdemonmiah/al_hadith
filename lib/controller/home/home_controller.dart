import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:al_hadith/model/books_model.dart';
import 'package:al_hadith/model/chapter_model.dart';
import 'package:al_hadith/view/chapter/chapter_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getBooksData();
    getChapterData();
    // getSectionData();
    // getHadithData();
    // TODO: implement onInit
    super.onInit();
  }

  RxList<BooksModel> booksList = RxList<BooksModel>();

  RxList<ChapterModel> chapterList = RxList<ChapterModel>();

  getBooksData() async {
    booksList.clear();
    final allData = await DBController.getBookData();
    for (var data in allData) {
      booksList.add(BooksModel.fromJson(data));
    }
    update();
    print(booksList);
  }

  getChapterData() async {
    chapterList.clear();
    final allData = await DBController.getChapterData();
    for (var data in allData) {
      chapterList.add(ChapterModel.fromJson(data));
    }
    update();
    print(chapterList);
  }

  //route Chapter page ============

  gotoChapterPage(int bookId, String bookTitle, String avrCode) {
    List<ChapterModel> listofChapter = [];

    for (int i = 0; i < chapterList.length; i++) {
      final chapter = chapterList[i];
      if (bookId == chapter.bookId) {
        listofChapter.add(chapter);
      }
    }
    update();
    print(listofChapter);
    update();
    Get.to(ChapterPage(
      bookName: bookTitle,
      bookId: bookId,
      bookAvrCode: avrCode,
      chapterList: listofChapter,
    ));
  }
}
