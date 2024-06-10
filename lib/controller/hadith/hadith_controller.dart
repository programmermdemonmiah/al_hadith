import 'package:get/get.dart';

class HadithController extends GetxController {
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
