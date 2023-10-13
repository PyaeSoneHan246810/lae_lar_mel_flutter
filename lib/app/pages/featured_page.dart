import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/pages/course_details_page.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';

import '../config/colors.dart';
import '../models/course_model.dart';
import '../models/language_category_model.dart';
import '../widgets/custom_course_view.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({super.key});

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  final String username = 'Pyae Sone';
  List<LanguageCategoryModel> languageCategories = [];
  List<Course> courses = [];
  List<Course> freeCourses = [];
  List<Course> premiumCourses = [];
  void _getInitialInfo() {
    languageCategories = LanguageCategoryModel.getLanguageCategories();
    courses = Course.getCourses();
    freeCourses = Course.getFreeCourses();
    premiumCourses = Course.getPremiumCourses();
  }

  void navigateToFreeCourseDetailsPage(int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CourseDetailsPage(
        course: freeCourses[index],
      ),
    ));
  }

  void navigateToPremiumCourseDetailsPage(int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CourseDetailsPage(
        course: premiumCourses[index],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Featured',
        onBackButtonPressed: () {
          Navigator.pushNamed(context, 'wishlistPage');
        },
      ),
      backgroundColor: AppColor.pureWhiteColor,
      body: FadeInDown(
        duration: const Duration(milliseconds: 750),
        child: ListView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          children: [
            const CustomSeparator(height: 14),
            Text(
              'Hello $username!',
              style: AppFontStyle.headerSecondary,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                'Welcome to the world of languages.',
                style: AppFontStyle.bodyOffBlack,
              ),
            ),
            const CustomSeparator(height: 42),
            const Text(
              'Languages',
              style: AppFontStyle.title1OffBlack,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                'Choose the language you want to learn.',
                style: AppFontStyle.bodyOffBlack,
              ),
            ),
            const CustomSeparator(height: 16),
            GridView.builder(
              itemCount: languageCategories.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 14,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4.5),
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      languageCategories[index].pageRouteName,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: AppColor.secondaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 34,
                              child: SvgPicture.asset(
                                languageCategories[index].languageFlagPath,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                languageCategories[index].languageName,
                                style: AppFontStyle.captionMediumPureWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const CustomSeparator(height: 42),
            const Text(
              'Free Courses',
              style: AppFontStyle.title1OffBlack,
            ),
            const CustomSeparator(height: 16),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return CustomCourseView(
                  courseImage: freeCourses[index].courseImage,
                  courseName: freeCourses[index].courseName,
                  coursePrice: freeCourses[index].coursePrice,
                  courseInstructorName: freeCourses[index].courseInstructorName,
                  courseLanguageCategory:
                      freeCourses[index].courseLanguageCategory,
                  courseLevel: freeCourses[index].courseLevel,
                  courseSkill: freeCourses[index].courseSkill,
                  onTap: () => navigateToFreeCourseDetailsPage(index),
                );
              },
              separatorBuilder: (context, index) {
                return const CustomSeparator(height: 15);
              },
            ),
            const CustomSeparator(height: 16),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColor.primaryColor,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'View all',
                  style: AppFontStyle.buttonNavTextOffBlack,
                ),
              ),
            ),
            const CustomSeparator(height: 42),
            const Text(
              'Premium Courses',
              style: AppFontStyle.title1OffBlack,
            ),
            const CustomSeparator(height: 16),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return CustomCourseView(
                  courseImage: premiumCourses[index].courseImage,
                  courseName: premiumCourses[index].courseName,
                  coursePrice: premiumCourses[index].coursePrice,
                  courseInstructorName:
                      premiumCourses[index].courseInstructorName,
                  courseLanguageCategory:
                      premiumCourses[index].courseLanguageCategory,
                  courseLevel: premiumCourses[index].courseLevel,
                  courseSkill: premiumCourses[index].courseSkill,
                  onTap: () => navigateToPremiumCourseDetailsPage(index),
                );
              },
              separatorBuilder: (context, index) {
                return const CustomSeparator(height: 15);
              },
            ),
            const CustomSeparator(height: 16),
            Center(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColor.primaryColor,
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'View all',
                  style: AppFontStyle.buttonNavTextOffBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
