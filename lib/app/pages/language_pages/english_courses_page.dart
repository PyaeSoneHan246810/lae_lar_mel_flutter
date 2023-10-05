import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_courses_tabbar_view.dart';

import '../../config/colors.dart';
import '../../widgets/custom_appbar_with_back_arrow.dart';
import '../../widgets/custom_courses_tabbar.dart';

class EnglishCoursesPage extends StatefulWidget {
  const EnglishCoursesPage({super.key});

  @override
  State<EnglishCoursesPage> createState() => _EnglishCoursesPageState();
}

class _EnglishCoursesPageState extends State<EnglishCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrow(
          titleText: 'English',
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
              tab4Label: 'IELTS',
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CoursesTabBarView(
                    level: 'Beginner',
                    language: 'English',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'Intermediate',
                    language: 'English',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'Advanced',
                    language: 'English',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  CoursesTabBarView(
                    level: 'IELTS',
                    language: 'English',
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
