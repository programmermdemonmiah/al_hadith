
import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:al_hadith/model/books_model.dart';
import 'package:al_hadith/model/chapter_model.dart';
import 'package:al_hadith/model/hadith_model.dart';
import 'package:al_hadith/model/section_model.dart';
import 'package:al_hadith/view/hadith/hadith_page.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getBooksData();
    getChapterData();
    getSectionData();
    getHadithData();
    // TODO: implement onInit
    super.onInit();
  }

  RxList<BooksModel> booksList = RxList<BooksModel>();

  RxList<ChapterModel> chapterList = RxList<ChapterModel>();
  RxList<SectionModel> sectionsList = RxList<SectionModel>();
  RxList<HadithModel> hadithList = RxList<HadithModel>();

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

  getSectionData() async {
    sectionsList.clear();
    final allData = await DBController.getSectionData();
    for (var data in allData) {
      sectionsList.add(SectionModel.fromJson(data));
    }
    update();
    print(sectionsList);
  }

  getHadithData() async {
    hadithList.clear();
    final allData = await DBController.getHadithData();
    for (var data in allData) {
      hadithList.add(HadithModel.fromJson(data));
    }
    update();
    print(hadithList);
  }

  //route hadith page ============

  gotoHadithPage(int bookId, String bookTitle, String avrCode) {
    String? chapterName;
    List<SectionModel> listOfSection = [];
    List<HadithModel> listOfHadith = [];
    for (int i = 0; i < chapterList.length; i++) {
      final chapter = chapterList[i];
      if (bookId == chapter.bookId) {
        chapterName = chapter.title.toString();
        //section check start
        for (int j = 0; j < sectionsList.length; j++) {
          final section = sectionsList[j];
          if (section.bookId == bookId &&
              section.chapterId == chapter.chapterId) {
            listOfSection.add(section);
            //hadith check start ===
            for (int k = 0; k < hadithList.length; k++) {
              final hadith = hadithList[k];
              if (bookId == hadith.bookId &&
                  chapter.chapterId == hadith.chapterId &&
                  section.sectionId == hadith.sectionId) {
                listOfHadith.add(hadith);
              }
            }
          }
        }
      }
    }

    update();
    Get.to(HadithPage(
        bookName: bookTitle,
        chapterName: chapterName.toString(),
        sectionList: listOfSection,
        avrCode: avrCode,
        hadithList: listOfHadith));
  }
}
