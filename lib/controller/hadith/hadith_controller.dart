import 'dart:io';

import 'package:al_hadith/controller/common/db_controller.dart';
import 'package:al_hadith/model/hadith_model.dart';
import 'package:al_hadith/model/section_model.dart';
import 'package:al_hadith/utils/tost/tost.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class HadithController extends GetxController {
  int? bookId;
  int? chapterId;
  RxList savedHadithIdList = [].obs;
//===========

  @override
  void onInit() {
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

  Future<void> takeScreenshotAndShare(
      ScreenshotController screenshotController) async {
    try {
      if (await Permission.storage.request().isGranted) {
        await screenshotController
            .capture(delay: const Duration(milliseconds: 20))
            .then((image) async {
          if (image != null) {
            final directory = await getTemporaryDirectory();

            String fileName = 'al_hadish_screenshot.png';
            String filePath = "${directory.path}/$fileName";

            final imageFile = File(filePath);

            await imageFile.writeAsBytes(image);

            // Share.shareFiles([filePath], text: 'Check out my screenshot!');
          }
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
