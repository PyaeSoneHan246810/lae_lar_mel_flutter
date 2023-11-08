import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import 'custom_separator.dart';

class RewardPointsExchangeView extends StatelessWidget {
  final VoidCallback onTap;
  final String imagePath;
  final int couponPriceInMMK;
  final int numberOfRewardPoints;
  const RewardPointsExchangeView({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.couponPriceInMMK,
    required this.numberOfRewardPoints,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const CustomSeparator(
              width: 4,
              height: 0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${couponPriceInMMK.toString()} MMK off Discount Coupon",
                  style: AppFontStyle.bodyNavTextOffBlack(context),
                ),
                const CustomSeparator(
                  width: 0,
                  height: 4,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline_rounded,
                      size: 16,
                      color: AppColor.primaryColor,
                    ),
                    const CustomSeparator(
                      width: 2,
                      height: 0,
                    ),
                    Text(
                      '${numberOfRewardPoints.toString()} Reward Points',
                      style: AppFontStyle.bodyOffBlack(context),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
