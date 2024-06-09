import 'package:al_hadith/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class HadithPage extends StatelessWidget {
  final String appbarTitle;
  final String appBarSubTitle;
  const HadithPage(
      {super.key, required this.appbarTitle, required this.appBarSubTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          appBarTitle: appbarTitle,
          context: context,
          appBarSubTitle: appBarSubTitle),
      body: Column(
        children: [],
      ),
    );
  }
}
