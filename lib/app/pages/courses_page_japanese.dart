import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_tabbar_view.dart';

class JapaneseCoursesPage extends StatefulWidget {
  const JapaneseCoursesPage({super.key});

  @override
  State<JapaneseCoursesPage> createState() => _JapaneseCoursesPageState();
}

class _JapaneseCoursesPageState extends State<JapaneseCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrowAndTitle(
          titleText: AppLocalizations.of(context)!.japanese,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Japanese N5'),
                Tab(text: 'Japanese N4'),
                Tab(text: 'Japanese N3'),
                Tab(text: 'Japanese N2'),
                Tab(text: 'Japanese N1'),
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
                    languageLevel: 'Japanese N5',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Japanese N4',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Japanese N3',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Japanese N2',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Japanese N1',
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
