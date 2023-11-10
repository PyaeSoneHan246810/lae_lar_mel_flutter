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

class ChineseCoursesPage extends StatefulWidget {
  const ChineseCoursesPage({super.key});

  @override
  State<ChineseCoursesPage> createState() => _ChineseCoursesPageState();
}

class _ChineseCoursesPageState extends State<ChineseCoursesPage> {
  List<Course> hsk1ChineseCourses = [];
  List<Course> hsk2ChineseCourses = [];
  List<Course> hsk3ChineseCourses = [];
  List<Course> hsk4ChineseCourses = [];
  List<Course> hsk5ChineseCourses = [];
  List<Course> hsk6ChineseCourses = [];

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

  void _getInitialInfo() {
    hsk1ChineseCourses = Course.getHSK1ChineseCourses();
    hsk2ChineseCourses = Course.getHSK2ChineseCourses();
    hsk3ChineseCourses = Course.getHSK3ChineseCourses();
    hsk4ChineseCourses = Course.getHSK4ChineseCourses();
    hsk5ChineseCourses = Course.getHSK5ChineseCourses();
    hsk6ChineseCourses = Course.getHSK6ChineseCourses();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrowAndTitle(
          titleText: AppLocalizations.of(context)!.chinese,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [
            const TabBar(
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
                      child: (_isLoading)
                          ? const CourseViewShimmer()
                          : CoursesListView(
                              courses: hsk1ChineseCourses,
                              displayItemCount: hsk1ChineseCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK2',
                    child: Center(
                      child: (_isLoading)
                          ? const CourseViewShimmer()
                          : CoursesListView(
                              courses: hsk2ChineseCourses,
                              displayItemCount: hsk2ChineseCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK3',
                    child: Center(
                      child: (_isLoading)
                          ? const CourseViewShimmer()
                          : CoursesListView(
                              courses: hsk3ChineseCourses,
                              displayItemCount: hsk3ChineseCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK4',
                    child: Center(
                      child: (_isLoading)
                          ? const CourseViewShimmer()
                          : CoursesListView(
                              courses: hsk4ChineseCourses,
                              displayItemCount: hsk4ChineseCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK5',
                    child: Center(
                      child: (_isLoading)
                          ? const CourseViewShimmer()
                          : CoursesListView(
                              courses: hsk5ChineseCourses,
                              displayItemCount: hsk5ChineseCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Chinese HSK6',
                    child: Center(
                      child: (_isLoading)
                          ? const CourseViewShimmer()
                          : CoursesListView(
                              courses: hsk6ChineseCourses,
                              displayItemCount: hsk6ChineseCourses.length,
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
