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

  static TextStyle tittleBig1({color, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: 'Manrope',
      fontSize: 17.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle tittleBig2({
    color,
    required context,
    TextDecoration? decoration,
    double? decorationThickness,
  }) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: 'Manrope',
      decoration: decoration ?? TextDecoration.none,
      decorationThickness: decorationThickness,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle btittleBig3({color, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: AppConstant.kalpurushBaglaFont,
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle tittleBig4({
    color,
    required context,
    TextDecoration? decoration,
    double? decorationThickness,
  }) {
    return TextStyle(
      color: color ?? Colors.black87,
      fontFamily: 'Manrope',
      decoration: decoration ?? TextDecoration.none,
      decorationThickness: decorationThickness,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    );
  }

  //======================
  static TextStyle tittleSmall1(
      {Color? color,
      FontWeight? fontWeight,
      double? size,
      required BuildContext context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: 'Manrope',
      fontSize: 13.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle tittleSmall2(
      {Color? color,
      TextDecoration? decoration,
      FontWeight? fontWeight,
      double? decorationThickness,
      required BuildContext context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: 'Manrope',
      fontSize: 12.5.sp,
      decoration: decoration ?? TextDecoration.none,
      decorationThickness: decorationThickness,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle tittleSmall3(
      {Color? color,
      FontWeight? fontWeight,
      double? size,
      required BuildContext context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: 'Manrope',
      fontSize: 11.5.sp,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle tittleSmall4(
      {Color? color, double? size, required BuildContext context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: 'Manrope',
      fontSize: 10.3.sp,
      fontWeight: FontWeight.w600,
    );
  }

  // //================
  // static TextStyle subTittleSmallB1(
  //     {Color? color, double? size, required BuildContext context}) {
  //   return TextStyle(
  //     color: color ?? Colors.black,
  //     fontFamily: 'Manrope',

  //     fontSize: size ?? Get.width * 0.040,
  //     fontWeight: FontWeight.w600,
  //   );
  // }

  // static TextStyle subTittleSmallB2(
  //     {Color? color, double? size, required BuildContext context}) {
  //   return TextStyle(
  //     color: color ?? Colors.black,
  //     fontFamily: 'Manrope',

  //     fontSize: size ?? Get.width * 0.035,
  //     fontWeight: FontWeight.w600,
  //   );
  // }

  // //================
  // static TextStyle subTittleSmall1(
  //     {Color? color, double? size, required BuildContext context}) {
  //   return TextStyle(
  //     fontFamily: 'Manrope',

  //     color: color ?? Colors.black,
  //     fontSize: 17.sp,
  //     fontWeight: FontWeight.w500,
  //   );
  // }

  // static TextStyle subTittleSmall2(
  //     {Color? color, double? size, required BuildContext context}) {
  //   return TextStyle(
  //     color: color ?? Colors.black,
  //     fontSize: 16.sp,
  //     fontWeight: FontWeight.w500,
  //     fontFamily: 'Manrope',

  //   );
  // }

  //=============text====
  static TextStyle text1({Color? color, fontWeight, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: 'Manrope',
      fontSize: 14.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle text2({Color? color, fontWeight, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: 'Manrope',
      fontSize: 13.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle text3({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontFamily: 'Manrope',
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle text4({Color? color, fontWeight, required context}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: 11.sp,
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w500,
    );
  }

  //=====================paragraph=======
  static TextStyle paragraph1({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Manrope',
    );
  }

  static TextStyle paragraph2({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontSize: 12.5.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Manrope',
    );
  }

  static TextStyle paragraph3({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontFamily: 'Manrope',
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle paragraph4({Color? color, required context}) {
    return TextStyle(
      color: color ?? Colors.black54,
      fontFamily: 'Manrope',
      fontSize: 9.5.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
