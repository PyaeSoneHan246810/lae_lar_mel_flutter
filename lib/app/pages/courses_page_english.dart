import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_courses_tabbar_view.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../models/course_model.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_list_view.dart';

class EnglishCoursesPage extends StatefulWidget {
  const EnglishCoursesPage({super.key});

  @override
  State<EnglishCoursesPage> createState() => _EnglishCoursesPageState();
}

class _EnglishCoursesPageState extends State<EnglishCoursesPage> {
  List<Course> beginnerEnglishCourses = [];
  void _getInitialInfo() {
    beginnerEnglishCourses = Course.getBeginnerEnglishCourses();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrowAndTitle(
          titleText: AppLocalizations.of(context)!.english,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Beginner'),
                Tab(text: 'Intermediate'),
                Tab(text: 'Advanced'),
                Tab(text: 'IELTS'),
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
                    languageLevel: 'Beginner English',
                    child: Center(
                      child: CoursesListView(
                        courses: beginnerEnglishCourses,
                        displayItemCount: beginnerEnglishCourses.length,
                        isHeroAnimationEnabled: false,
                      ),
                    ),
                  ),
                  const CoursesTabBarView(
                    languageLevel: 'Intermediate English',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  const CoursesTabBarView(
                    languageLevel: 'Advanced English',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  const CoursesTabBarView(
                    languageLevel: 'IELTS',
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
