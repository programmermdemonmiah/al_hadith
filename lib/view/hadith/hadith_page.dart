import 'package:al_hadith/controller/hadith/hadith_controller.dart';
import 'package:al_hadith/model/hadith_model.dart';
import 'package:al_hadith/model/section_model.dart';
import 'package:al_hadith/utils/app_colors.dart';
import 'package:al_hadith/utils/app_constant.dart';
import 'package:al_hadith/utils/text_style.dart';
import 'package:al_hadith/utils/ui_const.dart';
import 'package:al_hadith/view/hadith/components/hadith_modal_bottom_sheet.dart';
import 'package:al_hadith/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HadithPage extends StatelessWidget {
  final String bookName;
  final String chapterName;
  final String avrCode;
  final List<SectionModel> sectionList;
  final List<HadithModel> hadithList;
  const HadithPage(
      {super.key,
      required this.bookName,
      required this.chapterName,
      required this.avrCode,
      required this.sectionList,
      required this.hadithList});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HadithController>(builder: (controller) {
      return Scaffold(
        backgroundColor: primaryColor,
        appBar: customAppBar(
            appBarTitle: bookName,
            context: context,
            appBarSubTitle: chapterName),
        body: SingleChildScrollView(
          child: Column(
            children: [
              gapH(4),
              Container(
                // height: double.infinity,
                width: double.infinity,
                padding: screenPaddingH(),

                decoration: BoxDecoration(
                  color: grayBg,
                  borderRadius: radiusOnly(4, 4, 0, 0),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: sectionList.length,
                  itemBuilder: (context, index) {
                    final section = sectionList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapH(4),
                        Container(
                          padding: edgeInsetsOnly(3, 5, 3, 3),
                          decoration: BoxDecoration(
                              borderRadius: radiusAll(2.5), color: whiteBg),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "${section.number.toString()} ",
                                      style: AppTextStyle.bTittleBig3(
                                          context: context,
                                          color: primaryColor)),
                                  TextSpan(
                                      text: " ${section.title.toString()}",
                                      style: AppTextStyle.bTittleSmall1(
                                          context: context))
                                ]),
                              ),
                              const Divider(
                                thickness: 1.2,
                                color: Colors.black12,
                              ),
                              Text(
                                section.preface.toString(),
                                style:
                                    AppTextStyle.bParagraph1(context: context),
                              )
                            ],
                          ),
                        ),
                        gapH(4),
                        for (int i = 0; i < hadithList.length; i++)
                          if (section.sectionId == hadithList[i].sectionId)
                            Obx(
                              () => Padding(
                                padding: edgeInsetsSym(0, 1.5),
                                child: Container(
                                  padding: edgeInsetsOnly(3, 5, 3, 3),
                                  decoration: BoxDecoration(
                                      borderRadius: radiusAll(2.5),
                                      color: whiteBg),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    AppConstant.avrIconSvg,
                                                    color: primaryColor,
                                                    width: 50.sp,
                                                  ),
                                                  Text(
                                                    avrCode.toString(),
                                                    style: AppTextStyle
                                                        .bTittleBig3(
                                                            context: context,
                                                            color:
                                                                Colors.white),
                                                  )
                                                ],
                                              ),
                                              gapW(2),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    bookName,
                                                    style: AppTextStyle
                                                        .bTittleBig2(
                                                            context: context),
                                                  ),
                                                  Text(
                                                    "হাদিস: ${controller.convertToBanglaNumber(hadithList[i].hadithId)}",
                                                    style: AppTextStyle.bText2(
                                                        context: context,
                                                        color: Color(int.parse(
                                                            "0xff${hadithList[i].gradeColor.replaceAll("#", "")}"))),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              controller.savedHadithIdList
                                                      .contains(hadithList[i]
                                                          .hadithId)
                                                  ? InkWell(
                                                      onTap: () {
                                                        controller
                                                            .savedHadithIdList
                                                            .remove(
                                                                hadithList[i]
                                                                    .hadithId);
                                                      },
                                                      child: Icon(
                                                        Icons.turned_in,
                                                        color: primaryColor,
                                                        size: 28.sp,
                                                      ),
                                                    )
                                                  : const SizedBox.shrink(),
                                              gapW(1),
                                              Container(
                                                alignment: Alignment.center,
                                                padding: edgeInsetsSym(3, 1),
                                                decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                        "0xff${hadithList[i].gradeColor.replaceAll("#", "")}")),
                                                    borderRadius: radiusAll(6)),
                                                child: Text(
                                                  hadithList[i]
                                                      .grade
                                                      .toString(),
                                                  style: AppTextStyle
                                                      .bTittleSmall1(
                                                          context: context,
                                                          color: Colors.white),
                                                ),
                                              ),
                                              gapW(2),
                                              InkWell(
                                                onTap: () {
                                                  hadithModalBottomSheet(
                                                      context: context,
                                                      bookName: bookName,
                                                      hadith: hadithList[i],
                                                      controller: controller);
                                                },
                                                splashColor: Colors.black12,
                                                child: Icon(
                                                  Icons.more_vert,
                                                  size: 25.sp,
                                                  color: Colors.black45,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      gapH(3),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          hadithList[i].ar,
                                          textAlign: TextAlign.right,
                                          style: AppTextStyle.bText1(
                                              context: context, arabic: true),
                                        ),
                                      ),
                                      gapH(3),
                                      Text(
                                        "${hadithList[i].narrator} থেকে বর্ণিত:",
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.bText1(
                                            color: primaryColor,
                                            context: context,
                                            arabic: false),
                                      ),
                                      gapH(3),
                                      Text(
                                        hadithList[i].bn,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.bText1(
                                            context: context, arabic: false),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        gapH(5),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
