import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_tabbar_view.dart';

class KoreanCoursesPage extends StatefulWidget {
  const KoreanCoursesPage({super.key});

  @override
  State<KoreanCoursesPage> createState() => _KoreanCoursesPageState();
}

class _KoreanCoursesPageState extends State<KoreanCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrowAndTitle(
          titleText: AppLocalizations.of(context)!.korean,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'TOPIK I (Level 1 & 2)'),
                Tab(text: 'TOPIK II (Level 3 & 4)'),
                Tab(text: 'TOPIK II (Level 5 & 6)'),
              ],
              isScrollable: true,
              indicatorColor: AppColor.primaryColor,
              labelStyle: AppFontStyle.tabNavText,
              labelPadding: EdgeInsets.only(left: 18, right: 18),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CoursesTabBarView(
                    languageLevel: 'Korean TOPIK I (Level 1 & 2)',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Korean TOPIK II (Level 3 & 4)',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Korean TOPIK II (Level 5 & 6)',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
