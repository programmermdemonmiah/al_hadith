import 'package:al_hadith/controller/chapter/chapter_controller.dart';
import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:al_hadith/controller/hadith/hadith_controller.dart';
import 'package:al_hadith/controller/home/home_controller.dart';
import 'package:get/get.dart';

init() async {
  //====database call====
  await DBController.initDB();
  //================
  Get.lazyPut(() => HomeController(), fenix: true);
  Get.lazyPut(() => ChapterController(), fenix: true);
  Get.lazyPut(() => HadithController(), fenix: true);
}
