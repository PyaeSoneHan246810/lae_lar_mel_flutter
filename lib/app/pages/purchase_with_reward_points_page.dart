import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lae_lar_mel_app/app/utils/utils.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../providers/course_enrollment_provider.dart';
import '../providers/reward_points_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/custom_separator.dart';
import '../widgets/popup_card_route.dart';

class PurchaseWithRewardPointsPage extends StatefulWidget {
  final int courseId;
  final double coursePriceInMMK;
  const PurchaseWithRewardPointsPage({
    super.key,
    required this.courseId,
    required this.coursePriceInMMK,
  });

  @override
  State<PurchaseWithRewardPointsPage> createState() =>
      _PurchaseWithRewardPointsPageState();
}

class _PurchaseWithRewardPointsPageState
    extends State<PurchaseWithRewardPointsPage> {
  late int rewardPointsAmountRequired;
  @override
  void initState() {
    super.initState();
    rewardPointsAmountRequired = widget.coursePriceInMMK.toInt();
  }

  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    final courseEnrollmentProvider =
        Provider.of<CourseEnrollmentProvider>(context, listen: false);
    final rewardPointsProvider = Provider.of<RewardPointsProvider>(context);
    final rewardPointsAmountNeeded =
        rewardPointsAmountRequired - rewardPointsProvider.rewardPoints;
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: 'Purchase with reward points',
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          children: [
            const CustomSeparator(
              width: 0,
              height: 10,
            ),
            ZoomIn(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You have',
                        style: AppFontStyle.title2OffBlack(context),
                      ),
                      const CustomSeparator(
                        width: 0,
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            rewardPointsProvider.rewardPoints.toString(),
                            style: AppFontStyle.headerPrimary,
                          ),
                          const CustomSeparator(
                            width: 12,
                            height: 0,
                          ),
                          Text(
                            'Reward Points',
                            style: AppFontStyle.bodyOffBlack(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/images/reward_star_illustration_1.svg',
                    height: 124,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            const CustomSeparator(
              width: 0,
              height: 60,
            ),
            FadeInLeft(
              child: Text(
                'Purchase the course with',
                style: AppFontStyle.subtitleOffBlack(context),
              ),
            ),
            const CustomSeparator(
              width: 0,
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  PopupCardRoute(
                    builder: (context) {
                      return _PurchaseWithRewardPointsPopupCard(
                        rewardPointsAmountRequired: rewardPointsAmountRequired,
                        onBuyNowButtonPressed: () {
                          if (rewardPointsProvider.rewardPoints >=
                              rewardPointsAmountRequired) {
                            courseEnrollmentProvider
                                .enrollCourse(widget.courseId);
                            rewardPointsProvider
                                .subtractPoints(rewardPointsAmountRequired);
                            showSnackBar(
                              context,
                              AppLocalizations.of(context)!
                                  .successfully_enrolled_course,
                            );
                            for (int i = 0; i < 3; i++) {
                              Navigator.of(context).pop();
                            }
                          } else {
                            showSnackBar(
                              context,
                              "You don't have enough points to purchase.",
                            );
                            Navigator.of(context).pop();
                          }
                        },
                      );
                    },
                  ),
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: FadeInLeft(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/reward_star_illustration_2.png',
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      const CustomSeparator(
                        width: 25,
                        height: 0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$rewardPointsAmountRequired Reward Points',
                            style: AppFontStyle.captionMediumOffBlack(context),
                          ),
                          Visibility(
                            visible: (rewardPointsAmountRequired >
                                rewardPointsProvider.rewardPoints),
                            child: Text(
                              '$rewardPointsAmountNeeded more points needed',
                              style:
                                  themeModeProvider.themeMode == ThemeMode.light
                                      ? AppFontStyle.bodyLightBlack
                                      : AppFontStyle.bodyPureWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const CustomSeparator(
              width: 0,
              height: 60,
            ),
            FadeInLeft(
              child: Text(
                'Not enough points?',
                style: AppFontStyle.subtitleOffBlack(context),
              ),
            ),
            const CustomSeparator(
              width: 0,
              height: 15,
            ),
            FadeInLeft(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('rewardPointsExchangePage');
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Exchange reward points with discount coupon code',
                          style: AppFontStyle.bodyOffBlack(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FadeInLeft(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('rewardPointsPage');
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Get more reward points',
                          style: AppFontStyle.bodyOffBlack(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ),
                    ],
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

class _PurchaseWithRewardPointsPopupCard extends StatefulWidget {
  final int rewardPointsAmountRequired;
  final VoidCallback onBuyNowButtonPressed;
  const _PurchaseWithRewardPointsPopupCard({
    super.key,
    required this.rewardPointsAmountRequired,
    required this.onBuyNowButtonPressed,
  });

  @override
  State<_PurchaseWithRewardPointsPopupCard> createState() =>
      _PurchaseWithRewardPointsPopupCardState();
}

class _PurchaseWithRewardPointsPopupCardState
    extends State<_PurchaseWithRewardPointsPopupCard> {
  @override
  Widget build(BuildContext context) {
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Material(
          color: themeModeProvider.themeMode == ThemeMode.light
              ? AppColor.lightestBlueColor
              : AppColor.darkGreyLight2,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Purchase with",
                    style: AppFontStyle.subtitleOffBlack(context),
                  ),
                  const CustomSeparator(
                    width: 0,
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_outline_rounded,
                        size: 18,
                        color: AppColor.primaryColor,
                      ),
                      const CustomSeparator(
                        width: 2,
                        height: 0,
                      ),
                      Text(
                        '${widget.rewardPointsAmountRequired} Reward Points',
                        style: AppFontStyle.captionMediumOffBlack(context),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/reward_star_illustration_3.png',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  CustomFilledButton(
                    onPressed: widget.onBuyNowButtonPressed,
                    text: "Buy now",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
