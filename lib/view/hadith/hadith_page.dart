import 'package:al_hadith/model/hadith_book_model.dart';
import 'package:al_hadith/utils/app_colors.dart';
import 'package:al_hadith/utils/app_constant.dart';
import 'package:al_hadith/utils/text_style.dart';
import 'package:al_hadith/utils/ui_const.dart';
import 'package:al_hadith/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HadithPage extends StatelessWidget {
  final String appbarTitle;
  final String appBarSubTitle;
  final HadithBookModel hadith;
  const HadithPage(
      {super.key,
      required this.appbarTitle,
      required this.appBarSubTitle,
      required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: customAppBar(
          appBarTitle: appbarTitle,
          context: context,
          appBarSubTitle: appBarSubTitle),
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
              child: Column(
                children: [
                  gapH(4),
                  Container(
                    padding: edgeInsetsOnly(3, 5, 3, 3),
                    decoration: BoxDecoration(
                        borderRadius: radiusAll(2.5), color: whiteBg),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "${hadith.sectionNumber.toString()} ",
                                style: AppTextStyle.bTittleBig3(
                                    context: context, color: primaryColor)),
                            TextSpan(
                                text: " ${hadith.sectionTitle.toString()}",
                                style: AppTextStyle.bTittleSmall1(
                                    context: context))
                          ]),
                        ),
                        const Divider(
                          thickness: 1.2,
                          color: Colors.black12,
                        ),
                        Text(
                          hadith.sectionPreface.toString(),
                          style: AppTextStyle.bParagraph1(context: context),
                        )
                      ],
                    ),
                  ),
                  gapH(4),
                  Container(
                    padding: edgeInsetsOnly(3, 5, 3, 3),
                    decoration: BoxDecoration(
                        borderRadius: radiusAll(2.5), color: whiteBg),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppConstant.avroIconSvg,
                                  width: 30.sp,
                                ),
                                Text(
                                  hadith.bookAbvrCode.toString(),
                                  style: AppTextStyle.bTittleBig3(
                                      context: context, color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                        gapH(3),
                        Text(
                          "${hadith.ar} \n ${hadith.arDiacless.toString()}",
                          textAlign: TextAlign.right,
                          style: AppTextStyle.bText1(
                              context: context, arabic: true),
                        ),
                      ],
                    ),
                  ),
                  gapH(5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
