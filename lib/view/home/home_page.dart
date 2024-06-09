import 'package:al_hadith/controller/home/home_controller.dart';
import 'package:al_hadith/utils/app_colors.dart';
import 'package:al_hadith/utils/text_style.dart';
import 'package:al_hadith/utils/ui_const.dart';
import 'package:al_hadith/view/hadith/hadith_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: Center(
          child: InkWell(
            onTap: () {
              Get.to(HadithPage(
                  appbarTitle: "সহীহ বুখারী",
                  appBarSubTitle: "ওহীর সূচনা অধ্যায়"));
            },
            child: Container(
              height: 100.sp,
              width: 100.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: radiusAll(2.5),
                color: primaryColor,
              ),
              child: Text(
                "সহীহ বুখারী",
                style: AppTextStyle.bTittleBig3(
                    context: context, color: Colors.white),
              ),
            ),
          ),
        )),
      );
    });
  }
}
