import 'package:al_hadith/controller/hadith/hadith_controller.dart';
import 'package:al_hadith/model/hadith_model.dart';
import 'package:al_hadith/model/section_model.dart';
import 'package:al_hadith/utils/app_colors.dart';
import 'package:al_hadith/utils/app_constant.dart';
import 'package:al_hadith/utils/text_style.dart';
import 'package:al_hadith/utils/ui_const.dart';
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
                            Padding(
                              padding: edgeInsetsSym(0, 1.5),
                              child: Container(
                                padding: edgeInsetsOnly(3, 5, 3, 3),
                                decoration: BoxDecoration(
                                    borderRadius: radiusAll(2.5),
                                    color: whiteBg),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              AppConstant.avroIconSvg,
                                              color: primaryColor,
                                              width: 50.sp,
                                            ),
                                            Text(
                                              avrCode.toString(),
                                              style: AppTextStyle.bTittleBig3(
                                                  context: context,
                                                  color: Colors.white),
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
                                              style: AppTextStyle.bTittleBig2(
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
                                    gapH(3),
                                    Text(
                                      "${hadithList[i].ar} \n ${hadithList[i].arDiacless.toString()}",
                                      textAlign: TextAlign.right,
                                      style: AppTextStyle.bText1(
                                          context: context, arabic: true),
                                    ),
                                  ],
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
