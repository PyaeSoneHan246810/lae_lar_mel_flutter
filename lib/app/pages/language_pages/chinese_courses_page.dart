import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../widgets/custom_appbar_with_back_arrow.dart';
import '../../widgets/custom_courses_tabbar.dart';
import '../../widgets/custom_courses_tabbar_view.dart';

class ChineseCoursesPage extends StatefulWidget {
  const ChineseCoursesPage({super.key});

  @override
  State<ChineseCoursesPage> createState() => _ChineseCoursesPageState();
}

class _ChineseCoursesPageState extends State<ChineseCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrow(
          titleText: 'Chinese',
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColor.pureWhiteColor,
        body: const Column(
          children: [
            CoursesTabBar(
              tab1Label: 'Beginner',
              tab2Label: 'Intermediate',
              tab3Label: 'Advanced',
              tab4Label: 'HSK',
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CoursesTabBarView(
                    level: 'Beginner',
                    language: 'Chinese',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'Intermediate',
                    language: 'Chinese',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'Advanced',
                    language: 'Chinese',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'HSK',
                    language: 'Chinese',
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
