import 'package:al_hadith/controller/hadith/hadith_controller.dart';
import 'package:al_hadith/model/hadith_model.dart';
import 'package:al_hadith/utils/app_colors.dart';
import 'package:al_hadith/utils/text_style.dart';
import 'package:al_hadith/utils/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

Future<void> hadithModalBottomSheet({
  required BuildContext context,
  required HadithController controller,
  required HadithModel hadith,
  required String bookName,
  required ScreenshotController screenshotcontroller,
}) async {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 420.sp,
        width: Get.width,
        padding: screenPaddingH(),
        decoration:
            BoxDecoration(borderRadius: radiusOnly(6, 6, 0, 0), color: grayBg),
        child: Column(
          children: [
            gapH(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "অন্যান্য অপশন",
                  style: AppTextStyle.bTittleBig2(context: context),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  splashColor: Colors.black12,
                  child: Icon(
                    Icons.close,
                    size: 25.sp,
                    color: Colors.black38,
                  ),
                )
              ],
            ),
            gapH(4),
            _customModalBottomItem(
                context: context,
                onTap: () {
                  if (controller.savedHadithIdList.contains(hadith.hadithId)) {
                    controller.savedHadithIdList.remove(hadith.hadithId);
                  } else {
                    controller.savedHadithIdList.add(hadith.hadithId);
                  }
                  Get.back();
                },
                icon: controller.savedHadithIdList.contains(hadith.hadithId)
                    ? Icons.turned_in
                    : Icons.turned_in_not_rounded,
                itemName: "কালেকশন এড করুন"),
            _customModalBottomItem(
                onTap: () {
                  controller.copyText(context, hadith.bn);
                  Get.back();
                },
                context: context,
                icon: Icons.copy,
                itemName: "বাংলা কপি"),
            _customModalBottomItem(
                onTap: () {
                  controller.copyText(context, hadith.ar);
                  Get.back();
                },
                context: context,
                icon: Icons.copy,
                itemName: "আরবি কপি"),
            _customModalBottomItem(
                onTap: () {
                  controller.copyText(context,
                      "$bookName \nহাদিস: ${hadith.hadithId} \n${hadith.ar} \n${hadith.narrator} থেকে বর্ণিত: \n${hadith.bn}");
                  Get.back();
                },
                context: context,
                icon: Icons.copy,
                itemName: "সম্পূর্ণ হাদিস কপি"),
            _customModalBottomItem(
                context: context,
                onTap: () {
                  Get.back();
                  controller.takeScreenshotAndShare(screenshotcontroller);
                },
                icon: Icons.image_outlined,
                itemName: "স্ক্রিনশট শেয়ার"),
            _customModalBottomItem(
                context: context,
                onTap: () {
                  Get.back();
                  controller.textShare(
                      '$bookName \nহাদিস: ${hadith.hadithId} \n${hadith.ar} \n${hadith.narrator} থেকে বর্ণিত: \n${hadith.bn}');
                },
                icon: Icons.share_outlined,
                itemName: "টেক্সট শেয়ার"),
            _customModalBottomItem(
                context: context,
                icon: Icons.report_gmailerrorred,
                itemName: "রিপোর্ট"),
          ],
        ),
      );
    },
  );
}

_customModalBottomItem(
    {required BuildContext context,
    required IconData icon,
    Function()? onTap,
    required String itemName}) {
  return Padding(
    padding: edgeInsetsSym(2, 2.5),
    child: InkWell(
      onTap: onTap,
      splashColor: Colors.black12,
      child: Row(
        children: [
          Icon(icon, size: 28.sp, color: primaryColor),
          gapW(2.5),
          Text(itemName, style: AppTextStyle.bTittleBig4(context: context)),
        ],
      ),
    ),
  );
}
