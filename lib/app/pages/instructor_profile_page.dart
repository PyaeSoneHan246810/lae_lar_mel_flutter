import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lae_lar_mel_app/app/models/course_instructor_model.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../models/course_model.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import '../widgets/custom_courses_list_view.dart';

class InstructorProfilePage extends StatefulWidget {
  final CourseInstructor courseInstructor;
  const InstructorProfilePage({
    super.key,
    required this.courseInstructor,
  });

  @override
  State<InstructorProfilePage> createState() => _InstructorProfilePageState();
}

class _InstructorProfilePageState extends State<InstructorProfilePage> {
  List<Course> instructorCourses = [];
  bool isReadMore = false;
  void _getInitialInfo() {
    instructorCourses = Course.getInstructorCourses(
        widget.courseInstructor.courseInstructorName);
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    final maxLines = isReadMore ? null : 4;
    final overflow = isReadMore ? TextOverflow.visible : TextOverflow.ellipsis;
    _getInitialInfo();
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: 'Instructor profile',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            child: Center(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: widget
                                    .courseInstructor.courseInstructorImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.courseInstructor.courseInstructorImage,
                      width: 120,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const CustomSeparator(
                  width: 24,
                  height: 0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSeparator(
                        height: 20,
                        width: 0,
                      ),
                      Text(
                        widget.courseInstructor.courseInstructorName,
                        style: AppFontStyle.title1OffBlack(context),
                      ),
                      const CustomSeparator(
                        height: 10,
                        width: 0,
                      ),
                      Text(
                        widget.courseInstructor.courseInstructorMajor,
                        style: AppFontStyle.captionMediumOffBlack(context),
                      ),
                      const CustomSeparator(
                        height: 12,
                        width: 0,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            size: 20,
                            color: AppColor.primaryColor,
                          ),
                          const CustomSeparator(
                            width: 4,
                            height: 0,
                          ),
                          Text(
                            widget.courseInstructor.courseInstructorCityAddress,
                            style: AppFontStyle.captionMediumOffBlack(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const CustomSeparator(
              height: 40,
              width: 0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About the instructor',
                  style: AppFontStyle.title2OffBlack(context),
                ),
                const CustomSeparator(
                  height: 20,
                  width: 0,
                ),
                Text(
                  widget.courseInstructor.courseInstructorDescription,
                  style: AppFontStyle.bodyOffBlack(context),
                  maxLines: maxLines,
                  overflow: overflow,
                ),
                const CustomSeparator(
                  height: 10,
                  width: 0,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isReadMore = !isReadMore;
                    });
                  },
                  child: Text(
                    isReadMore ? 'Read less' : 'Read more',
                    style: AppFontStyle.captionMediumPrimary,
                  ),
                ),
                const CustomSeparator(
                  height: 20,
                  width: 0,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        // final Uri emailUri = Uri(
                        //   scheme: 'mailto',
                        //   path: 'pyaesonehan246810@gmail.com',
                        // );
                        // if (await canLaunchUrl(emailUri)) {
                        //   launchUrl(emailUri);
                        // } else {
                        //   throw Exception('Could not launch $emailUri');
                        // }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.mail_rounded,
                          color: themeModeProvider.themeMode == ThemeMode.light
                              ? AppColor.offBlackColor
                              : AppColor.pureWhiteColor,
                        ),
                      ),
                    ),
                    const CustomSeparator(
                      width: 20,
                      height: 0,
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.facebook_rounded,
                          color: themeModeProvider.themeMode == ThemeMode.light
                              ? AppColor.offBlackColor
                              : AppColor.pureWhiteColor,
                        ),
                      ),
                    ),
                    const CustomSeparator(
                      width: 20,
                      height: 0,
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: themeModeProvider.themeMode == ThemeMode.light
                            ? SvgPicture.asset(
                                'assets/images/icon_linkedin_dark.svg',
                                width: 22,
                                height: 22,
                              )
                            : SvgPicture.asset(
                                'assets/images/icon_linkedin_white.svg',
                                width: 22,
                                height: 22,
                              ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const CustomSeparator(
              height: 40,
              width: 0,
            ),
            Text(
              'Courses',
              style: AppFontStyle.title2OffBlack(context),
            ),
            const CustomSeparator(
              height: 20,
              width: 0,
            ),
            CoursesListView(
              courses: instructorCourses,
              displayItemCount: instructorCourses.length,
              isHeroAnimationEnabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
