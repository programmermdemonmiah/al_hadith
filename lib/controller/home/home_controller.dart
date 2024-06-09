import 'dart:convert';

import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:al_hadith/model/hadith_book_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getAllData();
    // TODO: implement onInit
    super.onInit();
  }

  RxList<HadithBookModel> bookContentList = RxList<HadithBookModel>();

  getAllData() async {
    bookContentList.clear();
    final data = await DBController.getAllData();
    print("${jsonEncode(bookContentList)}");
    for (int i = 0; i < data.length; i++) {
      final value = data[i];
      bookContentList.add(HadithBookModel.fromJson(value));
      // print(value);
    }
    print(bookContentList);
    update();
  }
}
