import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/models/course_model.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_course_view_with_delete_button.dart';
import 'package:lae_lar_mel_app/boxes.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../widgets/custom_separator.dart';
import 'course_details_page.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool _isVisible = true;
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    if (boxCourses.length > 0) {
      _isVisible = !_isVisible;
    }
  }

  void _getInitialInfo() {
    courses = Course.getCourses();
  }

  void navigateToCourseDetailsPage(int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CourseDetailsPage(
        course: boxCourses.getAt(index),
      ),
    ));
  }

  Future<void> _displaySuccessfulSnackBar(
      BuildContext context, String message, int durationInMilliseconds) async {
    // Create a Completer to represent the completion of the future
    final Completer<void> completer = Completer<void>();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: durationInMilliseconds),
            backgroundColor: AppColor.primaryColor,
            showCloseIcon: true,
            closeIconColor: AppColor.pureWhiteColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            content: Text(
              message,
              style: AppFontStyle.alertTextPureWhite,
            ),
          ),
        )
        .closed
        .then((reason) {
      completer.complete(); // Complete the future when SnackBar is hidden
    });

    // Return the Future
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: 'Wishlist',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColor.pureWhiteColor,
      body: FadeInDown(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Visibility(
                visible: _isVisible,
                child: Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 100,
                      ),
                      SizedBox(
                        width: 230,
                        height: 170,
                        child: SvgPicture.asset(
                          'assets/images/empty_course_placeholder.svg',
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 20,
                      ),
                      const Text(
                        "You don't have any courses on your wishlist. Want to save something for later?",
                        style: AppFontStyle.bodyOffBlack,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: !_isVisible,
                child: Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: boxCourses.length,
                    itemBuilder: (context, index) {
                      //Todo: .getAt
                      Course course = boxCourses.getAt(index);
                      return CustomCourseViewWithDeleteButton(
                        courseType: course.courseType,
                        courseImage: course.courseImage,
                        courseName: course.courseName,
                        coursePriceInMMK: course.coursePriceInMMK,
                        courseInstructorName: course.courseInstructorName,
                        courseLanguageCategory: course.courseLanguageCategory,
                        courseLevel: course.courseLevel,
                        courseSkill: course.courseSkill,
                        onTap: () => navigateToCourseDetailsPage(index),
                        onDeleteIconButtonTap: () {
                          //Todo: .deleteAt
                          setState(() {
                            boxCourses.deleteAt(index);
                          });
                          _displaySuccessfulSnackBar(
                            context,
                            "Removed course from the wishlist",
                            1200,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const CustomSeparator(height: 15);
                    },
                  ),
                ),
              ),
              Visibility(
                visible: !_isVisible,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      boxCourses.clear();
                    });
                    _displaySuccessfulSnackBar(
                      context,
                      (boxCourses.length > 0)
                          ? "Removed all courses from the wishlist"
                          : "Already removed all courses from the wishlist",
                      1200,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.greyColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                        ),
                        Text(
                          'Delete all',
                          style: AppFontStyle.navTextOffBlack,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
