import 'package:al_hadith/controller/home_controller.dart';
import 'package:al_hadith/utils/text_style.dart';
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
            onTap: () {},
            child: SizedBox(
              height: 100.sp,
              width: 100.sp,
              child: Text(
                "সহীহ বুখারী",
                style: AppTextStyle.btittleBig3(context: context),
              ),
            ),
          ),
        )),
      );
    });
  }
}
