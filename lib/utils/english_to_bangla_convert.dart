class EnglishToBanglaConvert {
  static String convertToBanglaNumber(int number) {
    const englishToBangla = {
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
        arabicNumber.split('').map((digit) => englishToBangla[digit]!).join('');
    return banglaNumber;
  }
}
