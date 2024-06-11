import 'package:al_hadith/controller/home/home_controller.dart';
import 'package:al_hadith/utils/app_colors.dart';
import 'package:al_hadith/utils/text_style.dart';
import 'package:al_hadith/utils/ui_const.dart';
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
            child: SingleChildScrollView(
          child: Padding(
            padding: screenPaddingH(),
            child: Column(
              children: [
                gapH(4),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6.sp,
                      mainAxisSpacing: 6.sp),
                  itemCount: controller.booksList.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    final data = controller.booksList[index];
                    return InkWell(
                      onTap: () {
                        controller.gotoChapterPage(
                            data.bookId!,
                            data.titleBn.toString(),
                            data.bookAbvrCode.toString(),
                            data.numberOfHadis!);
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
                          data.titleBn.toString(),
                          style: AppTextStyle.bTittleBig3(
                              context: context, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        )),
      );
    });
  }
}
