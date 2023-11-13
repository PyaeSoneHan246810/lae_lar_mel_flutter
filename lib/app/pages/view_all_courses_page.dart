import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_courses_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../models/course_model.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_course_view_shimmer.dart';
import '../widgets/custom_course_view_skeleton.dart';

class ViewAllCoursesPage extends StatefulWidget {
  final List<Course> courses;
  final String courseType;

  ViewAllCoursesPage({
    Key? key,
    required this.courses,
    required this.courseType,
  }) : super(key: key);

  @override
  State<ViewAllCoursesPage> createState() => _ViewAllCoursesPageState();
}

class _ViewAllCoursesPageState extends State<ViewAllCoursesPage> {
  late List<Course> displayedCourses;
  late Map<String, Map<String, List<Course>>> allCourses;

  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        _isLoading = false;
      });
    });
    _getInitialInfo();
    displayedCourses = widget.courses;
    super.initState();
  }

  void _getInitialInfo() {
    allCourses = {
      'free': {
        'English': Course.getFreeEnglishCourses(),
        'Chinese': Course.getFreeChineseCourses(),
        'Japanese': Course.getFreeJapaneseCourses(),
        'Korean': Course.getFreeKoreanCourses(),
      },
      'premium': {
        'English': Course.getPremiumEnglishCourses(),
        'Chinese': Course.getPremiumChineseCourses(),
        'Japanese': Course.getPremiumJapaneseCourses(),
        'Korean': Course.getPremiumKoreanCourses(),
      },
    };
  }

  String _dropdownValue = "All";
  final _dropdownMenuItems = [
    "All",
    "English",
    "Chinese",
    "Japanese",
    "Korean"
  ];

  void updateDisplayedCourses() {
    String language = _dropdownValue;
    if (_dropdownValue == "All") {
      displayedCourses = widget.courses;
    } else {
      Map<String, List<Course>> coursesByType =
          allCourses[widget.courseType.toLowerCase()]!;
      displayedCourses = coursesByType[language]!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: (widget.courseType == "free")
            ? AppLocalizations.of(context)!.free_courses_title
            : AppLocalizations.of(context)!.premium_courses_title,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
        scrollDirection: Axis.vertical,
        child: FadeInDown(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.greyColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: DropdownButton(
                        items:
                            _dropdownMenuItems.map((String dropdownMenuItem) {
                          return DropdownMenuItem(
                            value: dropdownMenuItem,
                            child: Text(dropdownMenuItem),
                          );
                        }).toList(),
                        value: _dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            _dropdownValue = newValue!;
                            updateDisplayedCourses();
                          });
                        },
                        style: AppFontStyle.bodyNavTextOffBlack(context),
                        borderRadius: BorderRadius.circular(10),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: themeModeProvider.themeMode == ThemeMode.light
                              ? AppColor.offBlackColor
                              : AppColor.pureWhiteColor,
                        ),
                        underline: Container(),
                      ),
                    ),
                  ),
                ],
              ),
              const CustomSeparator(
                height: 20,
                width: 0,
              ),
              (_isLoading)
                  ? const CourseViewShimmer()
                  : CoursesListView(
                      courses: displayedCourses,
                      displayItemCount: displayedCourses.length,
                      isHeroAnimationEnabled: false,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
