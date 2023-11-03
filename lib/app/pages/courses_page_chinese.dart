import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_tabbar_view.dart';

class ChineseCoursesPage extends StatefulWidget {
  const ChineseCoursesPage({super.key});

  @override
  State<ChineseCoursesPage> createState() => _ChineseCoursesPageState();
}

class _ChineseCoursesPageState extends State<ChineseCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrowAndTitle(
          titleText: AppLocalizations.of(context)!.chinese,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Chinese HSK1'),
                Tab(text: 'Chinese HSK2'),
                Tab(text: 'Chinese HSK3'),
                Tab(text: 'Chinese HSK4'),
                Tab(text: 'Chinese HSK5'),
                Tab(text: 'Chinese HSK6'),
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
                    languageLevel: 'Chinese HSK1',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK2',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK3',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK4',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK5',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK6',
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
