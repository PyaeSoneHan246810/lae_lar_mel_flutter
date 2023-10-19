import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/models/course_model.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_course_view_with_delete_button.dart';
import 'package:lae_lar_mel_app/boxes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  void initState() {
    super.initState();
    if (boxCourses.length > 0) {
      _isVisible = !_isVisible;
    }
  }

  void _navigateToCourseDetailsPage(int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CourseDetailsPage(
        course: boxCourses.getAt(index),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: AppLocalizations.of(context)!.wishlist,
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
                      Text(
                        AppLocalizations.of(context)!.empty_wishlist_message,
                        style: AppFontStyle.bodyOffBlack,
                        textAlign: TextAlign.justify,
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
                        onTap: () => _navigateToCourseDetailsPage(index),
                        onDeleteIconButtonTap: () {
                          //Todo: .deleteAt
                          setState(() {
                            boxCourses.deleteAt(index);
                          });
                          displaySuccessfulSnackBar(
                            context,
                            AppLocalizations.of(context)!.removed_course,
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
                    displaySuccessfulSnackBar(
                      context,
                      (boxCourses.length > 0)
                          ? AppLocalizations.of(context)!.removed_all
                          : AppLocalizations.of(context)!.already_removed_all,
                      1200,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.greyColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.delete_rounded,
                          color: Colors.red,
                        ),
                        Text(
                          AppLocalizations.of(context)!.remove_all,
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
