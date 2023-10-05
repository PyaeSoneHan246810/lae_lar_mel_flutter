import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../widgets/custom_appbar_with_back_arrow.dart';
import '../../widgets/custom_courses_tabbar.dart';
import '../../widgets/custom_courses_tabbar_view.dart';

class KoreanCoursesPage extends StatefulWidget {
  const KoreanCoursesPage({super.key});

  @override
  State<KoreanCoursesPage> createState() => _KoreanCoursesPageState();
}

class _KoreanCoursesPageState extends State<KoreanCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrow(
          titleText: 'Korean',
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
              tab4Label: 'TOPIK',
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CoursesTabBarView(
                    level: 'Beginner',
                    language: 'Korean',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'Intermediate',
                    language: 'Korean',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'Advanced',
                    language: 'Korean',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'TOPIK',
                    language: 'Korean',
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
