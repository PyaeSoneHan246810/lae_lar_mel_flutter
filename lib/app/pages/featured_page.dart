import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/pages/view_all_courses_page.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_course_view_skeleton.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_outlined_button_rounded.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../config/colors.dart';
import '../models/course_model.dart';
import '../models/language_category_model.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_course_view_shimmer.dart';
import '../widgets/custom_courses_list_view.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({super.key});

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  List<LanguageCategoryModel> languageCategories = [];
  List<Course> courses = [];
  List<Course> freeCourses = [];
  List<Course> premiumCourses = [];

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
    languageCategories = LanguageCategoryModel.getLanguageCategories(context);
    courses = Course.getCourses();
    freeCourses = Course.getFreeCourses();
    premiumCourses = Course.getPremiumCourses();
  }

  void _navigateToViewAllCoursesPage(List<Course> courses, String courseType) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ViewAllCoursesPage(
        courses: courses,
        courseType: courseType,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    _getInitialInfo();
    return Scaffold(
      appBar: CustomAppBar(
        titleText: AppLocalizations.of(context)!.featured,
        isSearchIconVisible: true,
        context: context,
      ),
      body: SafeArea(
        child: FadeInDown(
          child: ListView(
            padding: const EdgeInsets.all(20),
            scrollDirection: Axis.vertical,
            children: [
              const CustomSeparator(height: 14),
              Text(
                '${AppLocalizations.of(context)!.greeting_title} ${authProvider.userModel.name}.',
                style: AppFontStyle.headerSecondary(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  AppLocalizations.of(context)!.greeting_subtitle,
                  style: AppFontStyle.bodyOffBlack(context),
                  textAlign: TextAlign.justify,
                ),
              ),
              const CustomSeparator(height: 42),
              Text(
                AppLocalizations.of(context)!.languages_title,
                style: AppFontStyle.title1OffBlack(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  AppLocalizations.of(context)!.languages_subtitle,
                  style: AppFontStyle.bodyOffBlack(context),
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
                        color: themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.secondaryColor
                            : AppColor.darkGreyLight2,
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
                style: AppFontStyle.title1OffBlack(context),
              ),
              const CustomSeparator(height: 16),
              (_isLoading)
                  ? const CourseViewShimmer()
                  : CoursesListView(
                      courses: freeCourses,
                      displayItemCount: 3,
                      isHeroAnimationEnabled: true,
                    ),
              const CustomSeparator(height: 16),
              Center(
                child: CustomOutlinedButtonRounded(
                  onPressed: () {
                    _navigateToViewAllCoursesPage(freeCourses, "free");
                  },
                  text: AppLocalizations.of(context)!.view_all,
                ),
              ),
              const CustomSeparator(height: 42),
              Text(
                AppLocalizations.of(context)!.premium_courses_title,
                style: AppFontStyle.title1OffBlack(context),
              ),
              const CustomSeparator(height: 16),
              (_isLoading)
                  ? const CourseViewShimmer()
                  : CoursesListView(
                      courses: premiumCourses,
                      displayItemCount: 3,
                      isHeroAnimationEnabled: true,
                    ),
              const CustomSeparator(height: 16),
              Center(
                child: CustomOutlinedButtonRounded(
                  onPressed: () {
                    _navigateToViewAllCoursesPage(premiumCourses, "premium");
                  },
                  text: AppLocalizations.of(context)!.view_all,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
