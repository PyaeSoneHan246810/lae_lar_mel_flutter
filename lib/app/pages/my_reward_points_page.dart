import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyRewardPointsPage extends StatefulWidget {
  const MyRewardPointsPage({super.key});

  @override
  State<MyRewardPointsPage> createState() => _MyRewardPointsPageState();
}

class _MyRewardPointsPageState extends State<MyRewardPointsPage> {
  var rewardPoints = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: AppLocalizations.of(context)!.reward_points,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          children: [
            ZoomIn(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.accumulated,
                    style: AppFontStyle.title2OffBlack(context),
                  ),
                  const CustomSeparator(
                    height: 10,
                  ),
                  Text(
                    rewardPoints.toString(),
                    style: AppFontStyle.hugeTextPrimary,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_outline_rounded,
                        color: AppColor.primaryColor,
                      ),
                      const CustomSeparator(
                        width: 4,
                        height: 0,
                      ),
                      Text(
                        'Reward Points',
                        style: AppFontStyle.captionBigOffBlack(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CustomSeparator(
              height: 70,
            ),
            FadeInLeft(
              child: Center(
                child: SizedBox(
                  height: 155,
                  width: 155,
                  child: Image.asset(
                    'assets/images/click_ad_illustration.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const CustomSeparator(
              height: 10,
            ),
            FadeInLeft(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.get_more_reward,
                  style: AppFontStyle.captionMediumOffBlack(context),
                ),
              ),
            ),
            const CustomSeparator(
              height: 30,
            ),
            FadeInLeft(
              child: Center(
                child: MaterialButton(
                  onPressed: () {},
                  color: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  height: 50,
                  elevation: 1.5,
                  hoverElevation: 2.0,
                  child: Text(
                    AppLocalizations.of(context)!.get_reward_points,
                    style: AppFontStyle.buttonNavTextPureWhite,
                  ),
                ),
              ),
            ),
            const CustomSeparator(
              height: 20,
            ),
            FadeInLeft(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed("myRewardPointsUsedHistoryPage");
                  },
                  child: Text(
                    AppLocalizations.of(context)!.view_points_used,
                    style: AppFontStyle.bodyNavTextOffBlackUnderlined(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
