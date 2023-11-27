import 'package:animate_do/animate_do.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lae_lar_mel_app/app/pages/games_chinese_page.dart';
import 'package:lae_lar_mel_app/app/pages/games_english_page.dart';
import 'package:lae_lar_mel_app/app/pages/games_japanese_page.dart';
import 'package:lae_lar_mel_app/app/pages/games_korean_page.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../providers/auth_provider.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_separator.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "Games",
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
                const CustomSeparator(height: 14),
                Text(
                  "Welcome, ${authProvider.userModel.name}.",
                  style: AppFontStyle.title1OffBlack(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    "Let's play mini quiz games to improve your language proficiency while having fun. Choose a language below.",
                    style: AppFontStyle.bodyOffBlack(context),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const CustomSeparator(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomChooseLanguageButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EnglishGamesPage(),
                                ),
                              );
                            },
                            countryCode: "GB",
                            languageName: "English",
                          ),
                          CustomChooseLanguageButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ChineseGamesPage(),
                                ),
                              );
                            },
                            countryCode: "CN",
                            languageName: "Chinese",
                          ),
                        ],
                      ),
                      const CustomSeparator(
                        height: 20,
                        width: 0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomChooseLanguageButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const JapaneseGamesPage(),
                                ),
                              );
                            },
                            countryCode: "JP",
                            languageName: "Japanese",
                          ),
                          CustomChooseLanguageButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const KoreanGamesPage(),
                                ),
                              );
                            },
                            countryCode: "KR",
                            languageName: "Korean",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const CustomSeparator(height: 30),
                Center(
                  child: SvgPicture.asset(
                    "assets/images/quiz_game_illustration.svg",
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                const CustomSeparator(height: 14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomChooseLanguageButton extends StatelessWidget {
  final Function() onTap;
  final String countryCode;
  final String languageName;
  const CustomChooseLanguageButton({
    super.key,
    required this.onTap,
    required this.countryCode,
    required this.languageName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 145,
        height: 115,
        decoration: ShapeDecoration(
          color: AppColor.pureWhiteColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: AppColor.pureWhiteColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 12,
              offset: Offset(0, 4),
              spreadRadius: -2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 42,
                child: CountryFlag.fromCountryCode(
                  countryCode,
                ),
              ),
              const CustomSeparator(
                height: 12,
                width: 0,
              ),
              Text(
                languageName,
                style: AppFontStyle.captionMediumOffBlack(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
