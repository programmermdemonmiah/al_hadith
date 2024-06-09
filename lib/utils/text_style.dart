import 'package:al_hadith/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  // static TextStyle drawerTextStyle() {
  //   return TextStyle(
  //       color: drawerTextColor,
  //       fontSize: Get.width * 0.34 / 100, fontFamily: 'Manrope',
  //       fontWeight: FontWeight.w400);
  // }

  static TextStyle bTittleBig1({color, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 19.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bTittleBig2({
    color,
    required context,
    TextDecoration? decoration,
    double? decorationThickness,
  }) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      decoration: decoration ?? TextDecoration.none,
      decorationThickness: decorationThickness,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bTittleBig3({color, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 17.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle bTittleBig4({
    color,
    required context,
    TextDecoration? decoration,
    double? decorationThickness,
  }) {
    return TextStyle(
      color: color ?? Colors.black87,
      fontFamily: AppConstant.kalpurushBaglaFont,
      decoration: decoration ?? TextDecoration.none,
      decorationThickness: decorationThickness,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    );
  }

  //======================
  static TextStyle bTittleSmall1(
      {Color? color,
      FontWeight? fontWeight,
      double? size,
      required BuildContext context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 15.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle bTittleSmall2(
      {Color? color,
      TextDecoration? decoration,
      FontWeight? fontWeight,
      double? decorationThickness,
      required BuildContext context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 14.5.sp,
      decoration: decoration ?? TextDecoration.none,
      decorationThickness: decorationThickness,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle bTittleSmall3(
      {Color? color,
      FontWeight? fontWeight,
      double? size,
      required BuildContext context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 13.5.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle bTittleSmall4(
      {Color? color, double? size, required BuildContext context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 12.3.sp,
      fontWeight: FontWeight.w600,
    );
  }

  //=============text====
  static TextStyle bText1({Color? color, fontWeight, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 16.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle bText2({Color? color, fontWeight, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 15.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle bText3({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bText4({Color? color, fontWeight, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: 13.sp,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontWeight: FontWeight.w500,
    );
  }

  //=====================paragraph=======
  static TextStyle bParagraph1({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.kalpurushBaglaFont,
    );
  }

  static TextStyle bParagraph2({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontSize: 12.5.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppConstant.kalpurushBaglaFont,
    );
  }

  static TextStyle bParagraph3({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bParagraph4({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 9.5.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
