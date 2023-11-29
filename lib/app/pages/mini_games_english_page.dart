import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/mini_games_loading_page_orange.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_separator.dart';
import 'mini_games_loading_page_yellow.dart';
import 'mini_games_loading_page_cyan.dart';

class EnglishMiniGamesPage extends StatefulWidget {
  const EnglishMiniGamesPage({super.key});

  @override
  State<EnglishMiniGamesPage> createState() => _EnglishMiniGamesPageState();
}

class _EnglishMiniGamesPageState extends State<EnglishMiniGamesPage> {
  bool _isFamilyMiniGamesExpansionPanelExpanded = false;
  bool _isFoodMiniGamesExpansionPanelExpanded = false;
  bool _isPlacesMiniGamesExpansionPanelExpanded = false;
  bool _isBusinessMiniGamesExpansionPanelExpanded = false;
  bool _isEntertainmentMiniGamesExpansionPanelExpanded = false;

  @override
  Widget build(BuildContext context) {
    final themeModeProvider =
        Provider.of<ThemeModeProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: AppLocalizations.of(context)!.english_quiz_games,
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionPanelList(
                elevation: 0,
                expandedHeaderPadding: const EdgeInsets.all(0),
                dividerColor: Colors.transparent,
                children: [
                  ExpansionPanel(
                    hasIcon: false,
                    backgroundColor:
                        themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                    headerBuilder: (context, isExpanded) {
                      return Material(
                        color: themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isFamilyMiniGamesExpansionPanelExpanded =
                                    !_isFamilyMiniGamesExpansionPanelExpanded;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: themeModeProvider.themeMode ==
                                          ThemeMode.light
                                      ? AppColor.greyColor
                                      : AppColor.darkGreyLight2,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/mini_games_family_illustration_1.png",
                                          width: 100,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                        const CustomSeparator(
                                          width: 20,
                                          height: 0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Family",
                                              style:
                                                  AppFontStyle.subtitleOffBlack(
                                                      context),
                                            ),
                                            const CustomSeparator(
                                              width: 0,
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "0%",
                                                  style: AppFontStyle
                                                      .captionMediumSecondary(
                                                          context),
                                                ),
                                                const CustomSeparator(
                                                  width: 2,
                                                  height: 0,
                                                ),
                                                Text(
                                                  "Finished",
                                                  style: AppFontStyle
                                                      .captionMediumOffBlack(
                                                          context),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      _isFamilyMiniGamesExpansionPanelExpanded ==
                                              false
                                          ? Icons.keyboard_arrow_down_rounded
                                          : Icons.keyboard_arrow_up_rounded,
                                      color: themeModeProvider.themeMode ==
                                              ThemeMode.light
                                          ? AppColor.offBlackColor
                                          : AppColor.greyColor,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MiniGamesLoadingPageOrange(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Beginner",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      child: LinearPercentIndicator(
                                        width:
                                            125.0, // Adjust the width as needed
                                        lineHeight: 25,
                                        percent: 0.0,
                                        progressColor: AppColor.primaryColor,
                                        backgroundColor:
                                            themeModeProvider.themeMode ==
                                                    ThemeMode.light
                                                ? AppColor.greyColor
                                                : AppColor.darkGreyLight2,
                                        padding: const EdgeInsets.all(0.0),
                                        barRadius: const Radius.circular(8.0),
                                        center: Text(
                                          "0.0% Finished",
                                          style: AppFontStyle.bodyOffBlack(
                                              context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MiniGamesLoadingPageYellow(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Intermediate",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MiniGamesLoadingPageCyan(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Advanced",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    isExpanded: _isFamilyMiniGamesExpansionPanelExpanded,
                  ),
                  ExpansionPanel(
                    hasIcon: false,
                    backgroundColor:
                        themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                    headerBuilder: (context, isExpanded) {
                      return Material(
                        color: themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isFoodMiniGamesExpansionPanelExpanded =
                                    !_isFoodMiniGamesExpansionPanelExpanded;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: themeModeProvider.themeMode ==
                                          ThemeMode.light
                                      ? AppColor.greyColor
                                      : AppColor.darkGreyLight2,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/mini_games_food_illustration_1.png",
                                          width: 100,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                        const CustomSeparator(
                                          width: 20,
                                          height: 0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Food",
                                              style:
                                                  AppFontStyle.subtitleOffBlack(
                                                      context),
                                            ),
                                            const CustomSeparator(
                                              width: 0,
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "0%",
                                                  style: AppFontStyle
                                                      .captionMediumSecondary(
                                                          context),
                                                ),
                                                const CustomSeparator(
                                                  width: 2,
                                                  height: 0,
                                                ),
                                                Text(
                                                  "Finished",
                                                  style: AppFontStyle
                                                      .captionMediumOffBlack(
                                                          context),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      _isFoodMiniGamesExpansionPanelExpanded ==
                                              false
                                          ? Icons.keyboard_arrow_down_rounded
                                          : Icons.keyboard_arrow_up_rounded,
                                      color: themeModeProvider.themeMode ==
                                              ThemeMode.light
                                          ? AppColor.offBlackColor
                                          : AppColor.greyColor,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Beginner",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      child: LinearPercentIndicator(
                                        width:
                                            125.0, // Adjust the width as needed
                                        lineHeight: 25,
                                        percent: 0.0,
                                        progressColor: AppColor.primaryColor,
                                        backgroundColor:
                                            themeModeProvider.themeMode ==
                                                    ThemeMode.light
                                                ? AppColor.greyColor
                                                : AppColor.darkGreyLight2,
                                        padding: const EdgeInsets.all(0.0),
                                        barRadius: const Radius.circular(8.0),
                                        center: Text(
                                          "0.0% Finished",
                                          style: AppFontStyle.bodyOffBlack(
                                              context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Intermediate",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Advanced",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    isExpanded: _isFoodMiniGamesExpansionPanelExpanded,
                  ),
                  ExpansionPanel(
                    hasIcon: false,
                    backgroundColor:
                        themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                    headerBuilder: (context, isExpanded) {
                      return Material(
                        color: themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isPlacesMiniGamesExpansionPanelExpanded =
                                    !_isPlacesMiniGamesExpansionPanelExpanded;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: themeModeProvider.themeMode ==
                                          ThemeMode.light
                                      ? AppColor.greyColor
                                      : AppColor.darkGreyLight2,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/mini_games_places_illustration_1.png",
                                          width: 100,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                        const CustomSeparator(
                                          width: 20,
                                          height: 0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Places",
                                              style:
                                                  AppFontStyle.subtitleOffBlack(
                                                      context),
                                            ),
                                            const CustomSeparator(
                                              width: 0,
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "0%",
                                                  style: AppFontStyle
                                                      .captionMediumSecondary(
                                                          context),
                                                ),
                                                const CustomSeparator(
                                                  width: 2,
                                                  height: 0,
                                                ),
                                                Text(
                                                  "Finished",
                                                  style: AppFontStyle
                                                      .captionMediumOffBlack(
                                                          context),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      _isPlacesMiniGamesExpansionPanelExpanded ==
                                              false
                                          ? Icons.keyboard_arrow_down_rounded
                                          : Icons.keyboard_arrow_up_rounded,
                                      color: themeModeProvider.themeMode ==
                                              ThemeMode.light
                                          ? AppColor.offBlackColor
                                          : AppColor.greyColor,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Beginner",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      child: LinearPercentIndicator(
                                        width:
                                            125.0, // Adjust the width as needed
                                        lineHeight: 25,
                                        percent: 0.0,
                                        progressColor: AppColor.primaryColor,
                                        backgroundColor:
                                            themeModeProvider.themeMode ==
                                                    ThemeMode.light
                                                ? AppColor.greyColor
                                                : AppColor.darkGreyLight2,
                                        padding: const EdgeInsets.all(0.0),
                                        barRadius: const Radius.circular(8.0),
                                        center: Text(
                                          "0.0% Finished",
                                          style: AppFontStyle.bodyOffBlack(
                                              context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Intermediate",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Advanced",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    isExpanded: _isPlacesMiniGamesExpansionPanelExpanded,
                  ),
                  ExpansionPanel(
                    hasIcon: false,
                    backgroundColor:
                        themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                    headerBuilder: (context, isExpanded) {
                      return Material(
                        color: themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isBusinessMiniGamesExpansionPanelExpanded =
                                    !_isBusinessMiniGamesExpansionPanelExpanded;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: themeModeProvider.themeMode ==
                                          ThemeMode.light
                                      ? AppColor.greyColor
                                      : AppColor.darkGreyLight2,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/mini_games_business_illustration_1.png",
                                          width: 100,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                        const CustomSeparator(
                                          width: 20,
                                          height: 0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Business",
                                              style:
                                                  AppFontStyle.subtitleOffBlack(
                                                      context),
                                            ),
                                            const CustomSeparator(
                                              width: 0,
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "0%",
                                                  style: AppFontStyle
                                                      .captionMediumSecondary(
                                                          context),
                                                ),
                                                const CustomSeparator(
                                                  width: 2,
                                                  height: 0,
                                                ),
                                                Text(
                                                  "Finished",
                                                  style: AppFontStyle
                                                      .captionMediumOffBlack(
                                                          context),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      _isBusinessMiniGamesExpansionPanelExpanded ==
                                              false
                                          ? Icons.keyboard_arrow_down_rounded
                                          : Icons.keyboard_arrow_up_rounded,
                                      color: themeModeProvider.themeMode ==
                                              ThemeMode.light
                                          ? AppColor.offBlackColor
                                          : AppColor.greyColor,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Beginner",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      child: LinearPercentIndicator(
                                        width:
                                            125.0, // Adjust the width as needed
                                        lineHeight: 25,
                                        percent: 0.0,
                                        progressColor: AppColor.primaryColor,
                                        backgroundColor:
                                            themeModeProvider.themeMode ==
                                                    ThemeMode.light
                                                ? AppColor.greyColor
                                                : AppColor.darkGreyLight2,
                                        padding: const EdgeInsets.all(0.0),
                                        barRadius: const Radius.circular(8.0),
                                        center: Text(
                                          "0.0% Finished",
                                          style: AppFontStyle.bodyOffBlack(
                                              context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Intermediate",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Advanced",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    isExpanded: _isBusinessMiniGamesExpansionPanelExpanded,
                  ),
                  ExpansionPanel(
                    hasIcon: false,
                    backgroundColor:
                        themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                    headerBuilder: (context, isExpanded) {
                      return Material(
                        color: themeModeProvider.themeMode == ThemeMode.light
                            ? AppColor.pureWhiteColor
                            : AppColor.darkGrey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isEntertainmentMiniGamesExpansionPanelExpanded =
                                    !_isEntertainmentMiniGamesExpansionPanelExpanded;
                              });
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: themeModeProvider.themeMode ==
                                          ThemeMode.light
                                      ? AppColor.greyColor
                                      : AppColor.darkGreyLight2,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/mini_games_entertainment_illustration_1.png",
                                          width: 100,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                        const CustomSeparator(
                                          width: 20,
                                          height: 0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Entertainment",
                                              style:
                                                  AppFontStyle.subtitleOffBlack(
                                                      context),
                                            ),
                                            const CustomSeparator(
                                              width: 0,
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "0%",
                                                  style: AppFontStyle
                                                      .captionMediumSecondary(
                                                          context),
                                                ),
                                                const CustomSeparator(
                                                  width: 2,
                                                  height: 0,
                                                ),
                                                Text(
                                                  "Finished",
                                                  style: AppFontStyle
                                                      .captionMediumOffBlack(
                                                          context),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      _isEntertainmentMiniGamesExpansionPanelExpanded ==
                                              false
                                          ? Icons.keyboard_arrow_down_rounded
                                          : Icons.keyboard_arrow_up_rounded,
                                      color: themeModeProvider.themeMode ==
                                              ThemeMode.light
                                          ? AppColor.offBlackColor
                                          : AppColor.greyColor,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Beginner",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppColor.primaryColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                      ),
                                      child: LinearPercentIndicator(
                                        width:
                                            125.0, // Adjust the width as needed
                                        lineHeight: 25,
                                        percent: 0.0,
                                        progressColor: AppColor.primaryColor,
                                        backgroundColor:
                                            themeModeProvider.themeMode ==
                                                    ThemeMode.light
                                                ? AppColor.greyColor
                                                : AppColor.darkGreyLight2,
                                        padding: const EdgeInsets.all(0.0),
                                        barRadius: const Radius.circular(8.0),
                                        center: Text(
                                          "0.0% Finished",
                                          style: AppFontStyle.bodyOffBlack(
                                              context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Intermediate",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const CustomSeparator(
                            width: 0,
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Advanced",
                                  style:
                                      AppFontStyle.bodyNavTextOffBlack(context),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.lock_rounded,
                                      size: 18,
                                    ),
                                    const CustomSeparator(
                                      width: 2,
                                      height: 0,
                                    ),
                                    Text(
                                      "Locked",
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    isExpanded: _isEntertainmentMiniGamesExpansionPanelExpanded,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
