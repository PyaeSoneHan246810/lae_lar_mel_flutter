import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';

class CoursesTabBarView extends StatelessWidget {
  final String languageLevel;
  final Widget child;
  const CoursesTabBarView({
    super.key,
    required this.languageLevel,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Text(
            '$languageLevel Courses',
            style: AppFontStyle.title2OffBlack(context),
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
