import 'dart:io';

import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:al_hadith/model/hadith_model.dart';
import 'package:al_hadith/model/section_model.dart';
import 'package:al_hadith/utils/tost/tost.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HadithController extends GetxController {
  int? bookId;
  int? chapterId;
  RxList savedHadithIdList = [].obs;
//===========

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
      if (bookId == data["book_id"] && chapterId == data["chapter_id"]) {
        sectionsList.add(SectionModel.fromJson(data));
      }
    }
    update();
    print(sectionsList);
  }

  getHadithData() async {
    hadithList.clear();
    final allData = await DBController.getHadithData();
    for (var data in allData) {
      if (bookId == data["book_id"] && chapterId == data["chapter_id"]) {
        hadithList.add(HadithModel.fromJson(data));
      }
    }
    update();
    print(hadithList);
  }

  //========

  copyText(BuildContext context, String textToCopy) {
    Clipboard.setData(ClipboardData(text: textToCopy));
    showTost('Copied to clipboard!');
  }

  Future<void> textShare(String hadithText) async {
    try {
      // Share.share(hadithText); //flutter version 3.22.1 != share_plus or share version// so currently not work this
    } catch (e) {
      print(e);
    }
  }

  // final ScreenshotController screenshotController = ScreenshotController();

  Future<void> takeScreenshotAndShare() async {
    // final Uint8List? image = await screenshotController.capture();
    // if (image != null) {
    //   // final directory = await getTemporaryDirectory();
    //   String fileName = 'screenshot.png';
    //   String filePath = fileName; //${directory.path}
    //   final imageFile = File(filePath);
    //   await imageFile.writeAsBytes(image);
    //   // Share.shareFiles([filePath], text: 'Check out my screenshot!');
    // } else {
    //   print('Failed to capture screenshot');
    // }
  }
}
