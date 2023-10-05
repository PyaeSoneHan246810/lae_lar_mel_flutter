import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar.dart';

import '../config/colors.dart';
import '../models/language_category_model.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({super.key});

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  final String username = 'Pyae Sone';
  List<LanguageCategoryModel> languageCategories = [];
  void _getInitialInfo() {
    languageCategories = LanguageCategoryModel.getLanguageCategories();
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Text(
              'Hello $username!',
              style: AppFontStyle.headerSecondary,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              'Welcome to the world of languages.',
              style: AppFontStyle.bodyOffBlack,
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 42,
          ),
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
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
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
                            padding: const EdgeInsets.only(left: 10),
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
          const SizedBox(
            width: double.infinity,
            height: 42,
          ),
          const Text(
            'Free Courses',
            style: AppFontStyle.title1OffBlack,
          ),
          const SizedBox(
            width: double.infinity,
            height: 16,
          ),
        ],
      ),
    );
  }
}
