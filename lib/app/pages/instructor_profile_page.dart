import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lae_lar_mel_app/app/models/course_instructor_model.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../models/course_model.dart';
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.courseInstructor.courseInstructorImage,
                    width: 120,
                    height: 160,
                    fit: BoxFit.cover,
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
                            'Yangon',
                            style: AppFontStyle.captionMediumOffBlack(context),
                          ),
                        ],
                      )
                    ],
                  ),
                )
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
                      onTap: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          'assets/images/icon_facebook.svg',
                          width: 24,
                          height: 24,
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
                        child: SvgPicture.asset(
                          'assets/images/icon_linkedin.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    const CustomSeparator(
                      width: 20,
                      height: 0,
                    ),
                    InkWell(
                      onTap: () async {
                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'pyaesonehan246810@gmail.com',
                        );
                        if (await canLaunchUrl(emailUri)) {
                          launchUrl(emailUri);
                        } else {
                          throw Exception('Could not launch $emailUri');
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SvgPicture.asset(
                          'assets/images/icon_mail.svg',
                          width: 24,
                          height: 24,
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
