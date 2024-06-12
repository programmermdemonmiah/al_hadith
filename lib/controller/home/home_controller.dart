import 'package:al_hadith/controller/chapter/chapter_controller.dart';
import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:al_hadith/model/books_model.dart';
import 'package:al_hadith/view/chapter/chapter_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getBooksData();
    // TODO: implement onInit
    super.onInit();
  }

  RxList<BooksModel> booksList = RxList<BooksModel>();

  getBooksData() async {
    booksList.clear();
    final allData = await DBController.getBookData();
    for (var data in allData) {
      booksList.add(BooksModel.fromJson(data));
    }
    update();
    print(booksList);
  }

  //route Chapter page ============

  gotoChapterPage(
      int bookId, String bookTitle, String avrCode, int numberOfHadith) {
    Get.find<ChapterController>().bookId = bookId;
    update();
    update();
    Get.to(ChapterPage(
        bookName: bookTitle,
        numberOfHadith: numberOfHadith,
        bookAvrCode: avrCode));
  }
}
