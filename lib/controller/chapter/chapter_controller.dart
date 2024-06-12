import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:al_hadith/controller/hadith/hadith_controller.dart';
import 'package:al_hadith/model/chapter_model.dart';
import 'package:al_hadith/view/hadith/hadith_page.dart';
import 'package:get/get.dart';

class ChapterController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getChapterData();
  }

  int? bookId;
  RxList<ChapterModel> chapterList = RxList<ChapterModel>();

  getChapterData() async {
    chapterList.clear();
    final allData = await DBController.getChapterData();
    for (var data in allData) {
      if (bookId == data["book_id"]) {
        chapterList.add(ChapterModel.fromJson(data));
      }
    }
    update();
    print(chapterList);
  }

  //route Hadith page ============
  goToHadithPage(
      String bookTitle, String avrCode, int chapterId, String chapterName) {
    Get.find<HadithController>().bookId = bookId;
    Get.find<HadithController>().chapterId = chapterId;
    update();
    update();
    Get.to(HadithPage(
      bookName: bookTitle,
      chapterName: chapterName,
      avrCode: avrCode,
    ));
  }
}
