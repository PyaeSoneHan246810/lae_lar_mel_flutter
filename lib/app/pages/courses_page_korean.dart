import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../models/course_model.dart';
import '../widgets/custom_course_view_shimmer.dart';
import '../widgets/custom_course_view_skeleton.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_list_view.dart';
import '../widgets/custom_courses_tabbar_view.dart';

class KoreanCoursesPage extends StatefulWidget {
  const KoreanCoursesPage({super.key});

  @override
  State<KoreanCoursesPage> createState() => _KoreanCoursesPageState();
}

class _KoreanCoursesPageState extends State<KoreanCoursesPage> {
  List<Course> topikILevel1And2KoreanCourses = [];
  List<Course> topikIILevel3And4KoreanCourses = [];
  List<Course> topikIILevel5And6KoreanCourses = [];
  void _getInitialInfo() {
    topikILevel1And2KoreanCourses = Course.getTOPIKILevel1And2KoreanCourses();
    topikIILevel3And4KoreanCourses = Course.getTOPIKIILevel3And4KoreanCourses();
    topikIILevel5And6KoreanCourses = Course.getTOPIKIILevel5And6KoreanCourses();
  }

  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrowAndTitle(
          titleText: AppLocalizations.of(context)!.korean,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [
            const TabBar(
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
                      child: (_isLoading)
                          ? const CourseViewShimmer()
                          : CoursesListView(
                              courses: topikILevel1And2KoreanCourses,
                              displayItemCount:
                                  topikILevel1And2KoreanCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Korean TOPIK II (Level 3 & 4)',
                    child: Center(
                      child: (_isLoading)
                          ? const CourseViewShimmer()
                          : CoursesListView(
                              courses: topikIILevel3And4KoreanCourses,
                              displayItemCount:
                                  topikIILevel3And4KoreanCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Korean TOPIK II (Level 5 & 6)',
                    child: Center(
                      child: (_isLoading)
                          ? const CourseViewShimmer()
                          : CoursesListView(
                              courses: topikIILevel5And6KoreanCourses,
                              displayItemCount:
                                  topikIILevel5And6KoreanCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
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
