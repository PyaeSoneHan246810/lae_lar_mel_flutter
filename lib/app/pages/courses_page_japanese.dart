import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shimmer/shimmer.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../models/course_model.dart';
import '../widgets/course_card_skeleton.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_list_view.dart';
import '../widgets/custom_courses_tabbar_view.dart';

class JapaneseCoursesPage extends StatefulWidget {
  const JapaneseCoursesPage({super.key});

  @override
  State<JapaneseCoursesPage> createState() => _JapaneseCoursesPageState();
}

class _JapaneseCoursesPageState extends State<JapaneseCoursesPage> {
  List<Course> n5JapaneseCourses = [];
  List<Course> n4JapaneseCourses = [];
  List<Course> n3JapaneseCourses = [];
  List<Course> n2JapaneseCourses = [];
  List<Course> n1JapaneseCourses = [];

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
    n5JapaneseCourses = Course.getN5JapaneseCourses();
    n4JapaneseCourses = Course.getN4JapaneseCourses();
    n3JapaneseCourses = Course.getN3JapaneseCourses();
    n2JapaneseCourses = Course.getN2JapaneseCourses();
    n1JapaneseCourses = Course.getN1JapaneseCourses();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppBarWithBackArrowAndTitle(
          titleText: AppLocalizations.of(context)!.japanese,
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Column(
          children: [
            const TabBar(
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
                              courses: n5JapaneseCourses,
                              displayItemCount: n5JapaneseCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Japanese N4',
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
                              courses: n4JapaneseCourses,
                              displayItemCount: n4JapaneseCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Japanese N3',
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
                              courses: n3JapaneseCourses,
                              displayItemCount: n3JapaneseCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Japanese N2',
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
                              courses: n2JapaneseCourses,
                              displayItemCount: n2JapaneseCourses.length,
                              isHeroAnimationEnabled: false,
                            ),
                    ),
                  ),
                  CoursesTabBarView(
                    languageLevel: 'Japanese N1',
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
                              courses: n1JapaneseCourses,
                              displayItemCount: n1JapaneseCourses.length,
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
