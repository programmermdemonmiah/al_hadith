import 'package:al_hadith/controller/home_controller.dart';
import 'package:get/get.dart';

init() async {
  Get.lazyPut(() => HomeController());
}
