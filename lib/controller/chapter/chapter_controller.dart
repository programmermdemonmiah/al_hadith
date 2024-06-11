import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:al_hadith/model/hadith_model.dart';
import 'package:al_hadith/model/section_model.dart';
import 'package:al_hadith/view/hadith/hadith_page.dart';
import 'package:get/get.dart';

class ChapterController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSectionData();
    getHadithData();
  }

  RxList<SectionModel> sectionsList = RxList<SectionModel>();
  RxList<HadithModel> hadithList = RxList<HadithModel>();

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

  //route Hadith page ============
  goToHadithPage(int bookId, String bookTitle, String avrCode, int chapterId,
      String chapterName) {
    List<SectionModel> listOfSection = [];
    List<HadithModel> listOfHadith = [];
    for (int j = 0; j < sectionsList.length; j++) {
      final section = sectionsList[j];
      if (section.bookId == bookId && section.chapterId == chapterId) {
        listOfSection.add(section);
        //hadith check start ===
        for (int k = 0; k < hadithList.length; k++) {
          final hadith = hadithList[k];
          if (bookId == hadith.bookId &&
              chapterId == hadith.chapterId &&
              section.sectionId == hadith.sectionId) {
            listOfHadith.add(hadith);
          }
        }
      }
    }

    update();
    Get.to(HadithPage(
        bookName: bookTitle,
        chapterName: chapterName,
        avrCode: avrCode,
        sectionList: listOfSection,
        hadithList: listOfHadith));
  }
}
