import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';

class CoursesTabBar extends StatelessWidget {
  final String tab1Label;
  final String tab2Label;
  final String tab3Label;
  final String tab4Label;
  const CoursesTabBar({
    super.key,
    required this.tab1Label,
    required this.tab2Label,
    required this.tab3Label,
    required this.tab4Label,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(text: tab1Label),
        Tab(text: tab2Label),
        Tab(text: tab3Label),
        Tab(text: tab4Label),
      ],
      isScrollable: true,
      indicatorColor: AppColor.primaryColor,
      labelStyle: AppFontStyle.tabNavText,
      labelColor: AppColor.primaryColor,
      unselectedLabelColor: AppColor.lightBlackColor,
      labelPadding: const EdgeInsets.only(left: 18, right: 18),
    );
  }
}
