import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:lae_lar_mel_app/app/widgets/popup_card_route.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import '../config/font_styles.dart';
import '../providers/reward_points_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../utils/utils.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/custom_reward_points_exchange_view.dart';

class RewardPointsExchangePage extends StatefulWidget {
  const RewardPointsExchangePage({super.key});

  @override
  State<RewardPointsExchangePage> createState() =>
      _RewardPointsExchangePageState();
}

class _RewardPointsExchangePageState extends State<RewardPointsExchangePage> {
  @override
  Widget build(BuildContext context) {
    final rewardPointsProvider = Provider.of<RewardPointsProvider>(context);
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: AppLocalizations.of(context)!.exchange_reward,
        onBackButtonPressed: () {
          Navigator.pop(context);
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
                AppLocalizations.of(context)!.exchange_reward_points,
                style: AppFontStyle.captionBigOffBlack(context),
              ),
            ),
            const CustomSeparator(
              width: 0,
              height: 30,
            ),
            RewardPointsExchangeView(
              onTap: () {
                Navigator.of(context).push(
                  PopupCardRoute(
                    builder: (context) {
                      return _RewardPointsExchangePopupCard(
                        priceInMMK: 1000,
                        rewardPointsAmount: 1000,
                        onRedeemButtonClicked: () {
                          if (rewardPointsProvider.rewardPoints >= 1000) {
                            rewardPointsProvider.subtractPoints(1000);
                          } else {
                            showSnackBar(
                              context,
                              AppLocalizations.of(context)!
                                  .not_enough_points_to_purchase,
                            );
                          }
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                );
              },
              imagePath: 'assets/images/discount_illustration_1.png',
              couponPriceInMMK: 1000,
              numberOfRewardPoints: 1000,
            ),
            const Divider(),
            RewardPointsExchangeView(
              onTap: () {
                Navigator.of(context).push(
                  PopupCardRoute(
                    builder: (context) {
                      return _RewardPointsExchangePopupCard(
                        priceInMMK: 3000,
                        rewardPointsAmount: 3000,
                        onRedeemButtonClicked: () {
                          if (rewardPointsProvider.rewardPoints >= 3000) {
                            rewardPointsProvider.subtractPoints(3000);
                          } else {
                            showSnackBar(
                              context,
                              AppLocalizations.of(context)!
                                  .not_enough_points_to_purchase,
                            );
                          }
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                );
              },
              imagePath: 'assets/images/discount_illustration_1.png',
              couponPriceInMMK: 3000,
              numberOfRewardPoints: 3000,
            ),
            const Divider(),
            RewardPointsExchangeView(
              onTap: () {
                Navigator.of(context).push(
                  PopupCardRoute(
                    builder: (context) {
                      return _RewardPointsExchangePopupCard(
                        priceInMMK: 5000,
                        rewardPointsAmount: 5000,
                        onRedeemButtonClicked: () {
                          if (rewardPointsProvider.rewardPoints >= 5000) {
                            rewardPointsProvider.subtractPoints(5000);
                          } else {
                            showSnackBar(
                              context,
                              AppLocalizations.of(context)!
                                  .not_enough_points_to_purchase,
                            );
                          }
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                );
              },
              imagePath: 'assets/images/discount_illustration_1.png',
              couponPriceInMMK: 5000,
              numberOfRewardPoints: 5000,
            ),
            const Divider(),
            RewardPointsExchangeView(
              onTap: () {
                Navigator.of(context).push(
                  PopupCardRoute(
                    builder: (context) {
                      return _RewardPointsExchangePopupCard(
                        priceInMMK: 10000,
                        rewardPointsAmount: 10000,
                        onRedeemButtonClicked: () {
                          if (rewardPointsProvider.rewardPoints >= 10000) {
                            rewardPointsProvider.subtractPoints(10000);
                          } else {
                            showSnackBar(
                              context,
                              AppLocalizations.of(context)!
                                  .not_enough_points_to_purchase,
                            );
                          }
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                );
              },
              imagePath: 'assets/images/discount_illustration_1.png',
              couponPriceInMMK: 10000,
              numberOfRewardPoints: 10000,
            ),
          ],
        ),
      ),
    );
  }
}

class _RewardPointsExchangePopupCard extends StatefulWidget {
  final int priceInMMK;
  final int rewardPointsAmount;
  final VoidCallback onRedeemButtonClicked;
  const _RewardPointsExchangePopupCard({
    super.key,
    required this.priceInMMK,
    required this.rewardPointsAmount,
    required this.onRedeemButtonClicked,
  });

  @override
  State<_RewardPointsExchangePopupCard> createState() =>
      _RewardPointsExchangePopupCardState();
}

class _RewardPointsExchangePopupCardState
    extends State<_RewardPointsExchangePopupCard> {
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
                    "${widget.priceInMMK.toString()} MMK off Discount Coupon",
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
                        '${widget.rewardPointsAmount.toString()} Reward Points',
                        style: AppFontStyle.captionMediumOffBlack(context),
                      ),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/discount_illustration_2.png',
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomFilledButton(
                    onPressed: widget.onRedeemButtonClicked,
                    text: AppLocalizations.of(context)!.redeem,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
