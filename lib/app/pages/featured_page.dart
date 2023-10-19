import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/pages/course_details_page.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_outlined_button_rounded.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    languageCategories = LanguageCategoryModel.getLanguageCategories(context);
    courses = Course.getCourses();
    freeCourses = Course.getFreeCourses();
    premiumCourses = Course.getPremiumCourses();
  }

  void navigateToCourseDetailsPage(int index, List<Course> courses) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CourseDetailsPage(
        course: courses[index],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: CustomAppBar(
        titleText: AppLocalizations.of(context)!.featured,
        context: context,
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
              '${AppLocalizations.of(context)!.greeting_title} $username!',
              style: AppFontStyle.headerSecondary,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                AppLocalizations.of(context)!.greeting_subtitle,
                style: AppFontStyle.bodyOffBlack,
                textAlign: TextAlign.justify,
              ),
            ),
            const CustomSeparator(height: 42),
            Text(
              AppLocalizations.of(context)!.languages_title,
              style: AppFontStyle.title1OffBlack,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                AppLocalizations.of(context)!.languages_subtitle,
                style: AppFontStyle.bodyOffBlack,
                textAlign: TextAlign.justify,
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
                              child: CountryFlag.fromCountryCode(
                                languageCategories[index].languageCountryCode,
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
            Text(
              AppLocalizations.of(context)!.free_courses_title,
              style: AppFontStyle.title1OffBlack,
            ),
            const CustomSeparator(height: 16),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return CustomCourseView(
                  courseType: freeCourses[index].courseType,
                  courseImage: freeCourses[index].courseImage,
                  courseName: freeCourses[index].courseName,
                  coursePriceInMMK: freeCourses[index].coursePriceInMMK,
                  courseInstructorName: freeCourses[index].courseInstructorName,
                  courseLanguageCategory:
                      freeCourses[index].courseLanguageCategory,
                  courseLevel: freeCourses[index].courseLevel,
                  courseSkill: freeCourses[index].courseSkill,
                  onTap: () => navigateToCourseDetailsPage(index, freeCourses),
                );
              },
              separatorBuilder: (context, index) {
                return const CustomSeparator(height: 15);
              },
            ),
            const CustomSeparator(height: 16),
            Center(
              child: CustomOutlinedButtonRounded(
                onPressed: () {},
                text: AppLocalizations.of(context)!.view_all,
              ),
            ),
            const CustomSeparator(height: 42),
            Text(
              AppLocalizations.of(context)!.premium_courses_title,
              style: AppFontStyle.title1OffBlack,
            ),
            const CustomSeparator(height: 16),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return CustomCourseView(
                  courseType: premiumCourses[index].courseType,
                  courseImage: premiumCourses[index].courseImage,
                  courseName: premiumCourses[index].courseName,
                  coursePriceInMMK: premiumCourses[index].coursePriceInMMK,
                  courseInstructorName:
                      premiumCourses[index].courseInstructorName,
                  courseLanguageCategory:
                      premiumCourses[index].courseLanguageCategory,
                  courseLevel: premiumCourses[index].courseLevel,
                  courseSkill: premiumCourses[index].courseSkill,
                  onTap: () =>
                      navigateToCourseDetailsPage(index, premiumCourses),
                );
              },
              separatorBuilder: (context, index) {
                return const CustomSeparator(height: 15);
              },
            ),
            const CustomSeparator(height: 16),
            Center(
              child: CustomOutlinedButtonRounded(
                onPressed: () {},
                text: AppLocalizations.of(context)!.view_all,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
