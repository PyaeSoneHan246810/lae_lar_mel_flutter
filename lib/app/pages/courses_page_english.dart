import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_courses_tabbar_view.dart';
import 'package:shimmer/shimmer.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../models/course_model.dart';
import '../widgets/course_card_skeleton.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_list_view.dart';

class EnglishCoursesPage extends StatefulWidget {
  const EnglishCoursesPage({super.key});

  @override
  State<EnglishCoursesPage> createState() => _EnglishCoursesPageState();
}

class _EnglishCoursesPageState extends State<EnglishCoursesPage> {
  List<Course> beginnerEnglishCourses = [];
  List<Course> intermediateEnglishCourses = [];
  List<Course> advancedEnglishCourses = [];
  List<Course> ieltsEnglishCourses = [];

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
    beginnerEnglishCourses = Course.getBeginnerEnglishCourses();
    intermediateEnglishCourses = Course.getIntermediateEnglishCourses();
    advancedEnglishCourses = Course.getAdvancedEnglishCourses();
    ieltsEnglishCourses = Course.getIeltsEnglishCourses();
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
                      child: (_isLoading)
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: CourseCardSkeleton(),
                              ),
                            )
                          : CoursesListView(
                              courses: beginnerEnglishCourses,
                              displayItemCount: beginnerEnglishCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Intermediate English',
                    child: Center(
                      child: (_isLoading)
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: CourseCardSkeleton(),
                              ),
                            )
                          : CoursesListView(
                              courses: intermediateEnglishCourses,
                              displayItemCount:
                                  intermediateEnglishCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Advanced English',
                    child: Center(
                      child: (_isLoading)
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: CourseCardSkeleton(),
                              ),
                            )
                          : CoursesListView(
                              courses: advancedEnglishCourses,
                              displayItemCount: advancedEnglishCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'IELTS',
                    child: Center(
                      child: (_isLoading)
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: CourseCardSkeleton(),
                              ),
                            )
                          : CoursesListView(
                              courses: ieltsEnglishCourses,
                              displayItemCount: ieltsEnglishCourses.length,
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
