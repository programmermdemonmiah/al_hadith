import 'package:al_hadith/controller/chapter/chapter_controller.dart';
import 'package:al_hadith/model/chapter_model.dart';
import 'package:al_hadith/utils/app_colors.dart';
import 'package:al_hadith/utils/text_style.dart';
import 'package:al_hadith/utils/ui_const.dart';
import 'package:al_hadith/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChapterPage extends StatelessWidget {
  final String bookName;
  final int bookId;
  final String bookAvrCode;
  final List<ChapterModel> chapterList;
  const ChapterPage(
      {super.key,
      required this.bookName,
      required this.bookId,
      required this.chapterList,
      required this.bookAvrCode});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChapterController>(builder: (controller) {
      return Scaffold(
          appBar: customAppBar(appBarTitle: bookName, context: context),
          body: SafeArea(
              child: Padding(
            padding: screenPaddingH(),
            child: Column(
              children: [
                gapH(4),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: chapterList.length,
                  itemBuilder: (context, index) {
                    final data = chapterList[index];
                    return Container(
                      // color: grayBg,
                      child: ListTile(
                        onTap: () {
                          controller.goToHadithPage(
                              bookId,
                              bookName,
                              bookAvrCode,
                              data.chapterId!,
                              data.title.toString());
                        },
                        visualDensity: const VisualDensity(vertical: 0),
                        title: Text(
                          data.title.toString(),
                          style: AppTextStyle.bTittleBig4(context: context),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20.sp,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          )));
    });
  }
}