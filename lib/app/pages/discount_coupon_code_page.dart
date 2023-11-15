import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/utils/utils.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../providers/theme_mode_provider.dart';

class DiscountCouponCodePage extends StatefulWidget {
  const DiscountCouponCodePage({super.key});

  @override
  State<DiscountCouponCodePage> createState() => _DiscountCouponCodePageState();
}

class _DiscountCouponCodePageState extends State<DiscountCouponCodePage> {
  //Function to generate the coupon code
  String generateCouponCode(int length) {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String couponCode = '';
    for (int i = 0; i < length; i++) {
      int randomIndex = random.nextInt(chars.length);
      couponCode += chars[randomIndex];
    }
    return couponCode;
  }

  // Function to calculate the expiration date 30 days from now
  DateTime calculateExpirationDate() {
    return DateTime.now().add(const Duration(days: 30));
  }

  //Function to copy coupon code to clipboard
  void _copyCouponCodeToClipboard(BuildContext context, String code) {
    Clipboard.setData(ClipboardData(text: code));
    showSnackBar(context, 'Discount Coupon Code is copied to clipboard.');
  }

  @override
  Widget build(BuildContext context) {
    //get coupon code
    String couponCode = generateCouponCode(8);
    //get expiration date
    DateTime expirationDate = calculateExpirationDate();
    String expirationDateFormatted =
        "${expirationDate.day}/${expirationDate.month}/${expirationDate.year}";
    final themeModeProvider = Provider.of<ThemeModeProvider>(context);
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: 'Discount Coupon Code',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Lottie.asset(
                'assets/animations/gift_box_open_animation.json',
                repeat: false,
              ),
              const CustomSeparator(
                height: 20,
                width: 0,
              ),
              Text(
                'Your Discount Coupon Code',
                style: AppFontStyle.title2OffBlack(context),
              ),
              const CustomSeparator(
                height: 10,
                width: 0,
              ),
              Text(
                couponCode,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: AppColor.primaryColor,
                ),
              ),
              const CustomSeparator(
                height: 20,
                width: 0,
              ),
              Text(
                'This discount coupon code can only be used once before it expires in 30 days.',
                style: AppFontStyle.bodyOffBlack(context),
                textAlign: TextAlign.center,
              ),
              const CustomSeparator(
                height: 10,
                width: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.schedule,
                    size: 18,
                    color: AppColor.primaryColor,
                  ),
                  const CustomSeparator(
                    width: 4,
                    height: 0,
                  ),
                  Text(
                    'Expires on $expirationDateFormatted',
                    style: AppFontStyle.bodyNavTextOffBlack(context),
                  ),
                ],
              ),
              const CustomSeparator(
                height: 20,
                width: 0,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _copyCouponCodeToClipboard(context, couponCode);
                },
                style: ButtonStyle(
                  backgroundColor: themeModeProvider.themeMode ==
                          ThemeMode.light
                      ? const MaterialStatePropertyAll(AppColor.pureWhiteColor)
                      : const MaterialStatePropertyAll(AppColor.darkGreyLight2),
                ),
                icon: const Icon(
                  Icons.content_copy,
                  size: 18,
                  color: AppColor.primaryColor,
                ),
                label: Text(
                  'Copy Coupon Code',
                  style: AppFontStyle.buttonNavTextOffBlack(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
