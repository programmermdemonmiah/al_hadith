import 'package:al_hadith/utils/tost/tost.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class HadithController extends GetxController {
  RxList savedHadithIdList = [].obs;

  copyText(BuildContext context, String textToCopy) {
    Clipboard.setData(ClipboardData(text: textToCopy));
    showTost('Copied to clipboard!');
  }

  Future<void> textShare(String hadithText) async {
    try {
      Share.share(hadithText);
    } catch (e) {
      print(e);
    }
  }

  // ScreenshotController screenshotController = ScreenshotController();

  // Future<void> takeScreenshotAndShare() async {
  //   final directory = (await getApplicationDocumentsDirectory()).path;
  //   String fileName = 'screenshot.png';
  //   String filePath = '$directory/$fileName';

  //   screenshotController.capture().then((Uint8List? image) async {
  //     if (image != null) {
  //       final imageFile = File(filePath);
  //       await imageFile.writeAsBytes(image);
  //       final xfile = XFile(filePath);
  //       Share.shareXFiles([xfile], text: 'Check out my screenshot!');
  //     }
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  // }

  //==============convert
  String convertToBanglaNumber(int number) {
    const arabicToBangla = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯'
    };

    String arabicNumber = number.toString();
    String banglaNumber =
        arabicNumber.split('').map((digit) => arabicToBangla[digit]!).join('');
    return banglaNumber;
  }
}
