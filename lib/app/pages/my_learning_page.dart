import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../config/colors.dart';
import '../models/course_model.dart';
import '../providers/course_enrollment_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_course_view_shimmer.dart';
import '../widgets/custom_course_view_skeleton.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_courses_list_view.dart';
import '../widgets/custom_separator.dart';

class MyLearningPage extends StatefulWidget {
  const MyLearningPage({super.key});

  @override
  State<MyLearningPage> createState() => _MyLearningPageState();
}

class _MyLearningPageState extends State<MyLearningPage> {
  int numberOfCoursesEnrolled = 0;
  int numberOfCoursesCompleted = 0;
  int totalMinutesLearnedToday = 0;
  List<Course> enrolledCourses = [];

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

  void _getInitialInfo(BuildContext context) {
    enrolledCourses = Course.getEnrolledCourses(context);
    numberOfCoursesEnrolled = enrolledCourses.length;
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    _getInitialInfo(context);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: AppLocalizations.of(context)!.my_learning,
        isSearchIconVisible: false,
        context: context,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: FadeInDown(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSeparator(
                  height: 14,
                ),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            // (Blue Container Box)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: themeModeProvider.themeMode ==
                                        ThemeMode.light
                                    ? AppColor.secondaryColor
                                    : AppColor.darkGreyLight2,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 14, right: 16, bottom: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.fact_check_rounded,
                                      size: 30,
                                      color: themeModeProvider.themeMode ==
                                              ThemeMode.light
                                          ? AppColor.pureWhiteColor
                                          : AppColor.lightPurpleColor,
                                    ),
                                    const CustomSeparator(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          numberOfCoursesEnrolled.toString(),
                                          style: AppFontStyle.subtitlePureWhite,
                                        ),
                                        const CustomSeparator(
                                          width: 2,
                                          height: 0,
                                        ),
                                        Text(
                                          (numberOfCoursesEnrolled > 1)
                                              ? 'Courses'
                                              : 'Course',
                                          style: AppFontStyle.subtitlePureWhite,
                                        ),
                                      ],
                                    ),
                                    const CustomSeparator(
                                      height: 4,
                                    ),
                                    const Text(
                                      "Enrolled",
                                      style: AppFontStyle.bodyPureWhite,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const CustomSeparator(
                              height: 10,
                            ), // to create space between the containers
                            // (Teal Container Box)
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: themeModeProvider.themeMode ==
                                        ThemeMode.light
                                    ? AppColor.primaryColor
                                    : AppColor.darkGreyLight2,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, top: 14, right: 16, bottom: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.school_rounded,
                                      size: 30,
                                      color: themeModeProvider.themeMode ==
                                              ThemeMode.light
                                          ? AppColor.pureWhiteColor
                                          : AppColor.primaryColor,
                                    ),
                                    const CustomSeparator(
                                      height: 6,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          numberOfCoursesCompleted.toString(),
                                          style: AppFontStyle.subtitlePureWhite,
                                        ),
                                        const CustomSeparator(
                                          width: 2,
                                          height: 0,
                                        ),
                                        Text(
                                          (numberOfCoursesCompleted > 1)
                                              ? 'Courses'
                                              : 'Course',
                                          style: AppFontStyle.subtitlePureWhite,
                                        ),
                                      ],
                                    ),
                                    const CustomSeparator(
                                      height: 4,
                                    ),
                                    const Text(
                                      "Completed",
                                      style: AppFontStyle.bodyPureWhite,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CustomSeparator(
                        width: 10,
                        height: 0,
                      ),
                      //(Orange Container Box)
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                themeModeProvider.themeMode == ThemeMode.light
                                    ? AppColor.orangeColor
                                    : AppColor.darkGreyLight2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 27, bottom: 27),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  totalMinutesLearnedToday.toString(),
                                  style: AppFontStyle.hugeTextPureWhite,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.alarm_rounded,
                                      size: 28,
                                      color: themeModeProvider.themeMode ==
                                              ThemeMode.light
                                          ? AppColor.pureWhiteColor
                                          : AppColor.orangeColor,
                                    ),
                                    const CustomSeparator(
                                      width: 10,
                                      height: 0,
                                    ),
                                    Text(
                                      (totalMinutesLearnedToday > 1)
                                          ? 'Minutes'
                                          : 'Minute',
                                      style: AppFontStyle.subtitlePureWhite,
                                    ),
                                  ],
                                ),
                                const CustomSeparator(
                                  height: 6,
                                ),
                                const Text(
                                  "Learned Today",
                                  style: AppFontStyle.bodyPureWhite,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomSeparator(
                  height: 38,
                ),
                Text(
                  AppLocalizations.of(context)!.continue_learning_title,
                  style: AppFontStyle.title1OffBlack(context),
                ),
                const CustomSeparator(
                  height: 28,
                ),
                (enrolledCourses.isEmpty)
                    ? Column(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 230,
                              height: 170,
                              child: SvgPicture.asset(
                                'assets/images/empty_course_placeholder.svg',
                              ),
                            ),
                          ),
                          const CustomSeparator(
                            height: 28,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .empty_ongoing_course_message,
                            style: AppFontStyle.bodyOffBlack(context),
                          ),
                        ],
                      )
                    : (_isLoading)
                        ? const CourseViewShimmer()
                        : CoursesListView(
                            courses: enrolledCourses,
                            displayItemCount: enrolledCourses.length,
                            isHeroAnimationEnabled: true,
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
