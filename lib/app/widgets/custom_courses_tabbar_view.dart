import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';

import '../config/colors.dart';

class CoursesTabBarView extends StatelessWidget {
  final String level;
  final String language;
  final Widget child;
  const CoursesTabBarView({
    super.key,
    required this.level,
    required this.language,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhiteColor,
      body: ListView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Text(
            '$level $language Courses',
            style: AppFontStyle.title2OffBlack,
          ),
          const SizedBox(
            width: double.infinity,
            height: 30,
          ),
          child,
        ],
      ),
    );
  }
}
