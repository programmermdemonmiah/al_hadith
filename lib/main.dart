import 'package:al_hadith/al_binding/get_di.dart';
import 'package:al_hadith/utils/app_colors.dart';
import 'package:al_hadith/view/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: primaryColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    // systemNavigationBarColor: primaryColor,
  ));

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (_, __) {
          return GetMaterialApp(
            // title: 'Flutter Demo',
            theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              // useMaterial3: true,
              scaffoldBackgroundColor: whiteBg,
              appBarTheme: AppBarTheme(
                backgroundColor: primaryColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: primaryColor,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.dark,
                ),
              ),
              // colorScheme.iconColor: whiteBg,
              // fontFamily: AppConstant.manrope
            ),
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
