import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getAllData();
    // TODO: implement onInit
    super.onInit();
  }

  RxList bookContentList = [].obs;

  getAllData() async {
    bookContentList.clear();
    final data = await DBController.getAllData();
    bookContentList.value = data;
    print(bookContentList);
  }
}
