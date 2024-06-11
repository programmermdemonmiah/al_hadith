import 'dart:io';

import 'package:al_hadith/utils/tost/tost.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HadithController extends GetxController {
  RxList savedHadithIdList = [].obs;

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
