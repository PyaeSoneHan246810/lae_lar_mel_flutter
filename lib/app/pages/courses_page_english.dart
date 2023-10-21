import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_courses_tabbar_view.dart';
import '../models/course_model.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_list_view.dart';
import '../widgets/custom_courses_tabbar.dart';

class EnglishCoursesPage extends StatefulWidget {
  const EnglishCoursesPage({super.key});

  @override
  State<EnglishCoursesPage> createState() => _EnglishCoursesPageState();
}

class _EnglishCoursesPageState extends State<EnglishCoursesPage> {
  List<Course> beginnerEnglishCourses = [];
  bool isHeroAnimationEnabled = false;
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
            const CoursesTabBar(
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
                      child: GestureDetector(
                        onTap: () {
                          isHeroAnimationEnabled = !isHeroAnimationEnabled;
                        },
                        child: CoursesListView(
                          courses: beginnerEnglishCourses,
                          displayItemCount: beginnerEnglishCourses.length,
                          isHeroAnimationEnabled: isHeroAnimationEnabled,
                        ),
                      ),
                    ),
                  ),
                  const CoursesTabBarView(
                    level: 'Intermediate',
                    language: 'English',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  const CoursesTabBarView(
                    level: 'Advanced',
                    language: 'English',
                    child: Center(
                      child: Text('Example'),
                    ),
                  ),
                  const CoursesTabBarView(
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
