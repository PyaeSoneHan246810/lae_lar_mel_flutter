import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';

class AppFontStyle {
  AppFontStyle._();
  //header
  static TextStyle headerOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
      height: 1.45,
    );
  }

  static const TextStyle headerPureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColor.pureWhiteColor,
    height: 1.45,
  );
  static const TextStyle headerPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColor.primaryColor,
    height: 1.45,
  );
  static TextStyle headerSecondary(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.secondaryColor
          : AppColor.lightPurpleColor,
      height: 1.45,
    );
  }

  //title1
  static TextStyle title1OffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle title1PureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle title1Primary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColor.primaryColor,
  );
  //title2
  static TextStyle title2OffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle title2PureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle title2Primary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.primaryColor,
  );
  static TextStyle title2Secondary(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.secondaryColor
          : AppColor.lightPurpleColor,
    );
  }

  //title3
  static TextStyle title3OffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle title3PureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle title3Primary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
  );
  //subtitle
  static TextStyle subtitleOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle subtitlePureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle subtitlePrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.primaryColor,
  );
  //caption_big
  static TextStyle captionBigOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle captionBigPureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle captionBigPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryColor,
  );
  //caption_medium
  static TextStyle captionMediumOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle captionMediumPureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle captionMediumPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
  );
  static TextStyle captionMediumSecondary(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.secondaryColor
          : AppColor.lightPurpleColor,
    );
  }

  //caption_small
  static TextStyle captionSmallOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle captionSmallPureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle captionSmallPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryColor,
  );
  static const TextStyle captionSmallLightBlack = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColor.lightBlackColor,
  );
  //body
  static TextStyle bodyOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
      height: 1.8,
    );
  }

  static const TextStyle bodyLightBlack = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.lightBlackColor,
    height: 1.8,
  );

  static const TextStyle bodyPureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.pureWhiteColor,
    height: 1.8,
  );
  static const TextStyle bodyPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryColor,
    height: 1.8,
  );
  //body_nav_text
  static TextStyle bodyNavTextOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static TextStyle bodyNavTextOffBlackUnderlined(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
      decoration: TextDecoration.underline,
    );
  }

  static const TextStyle bodyNavTextPureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle bodyNavTextPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
  );
  //nav_text
  static TextStyle navTextOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle navTextPureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle navTextPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.primaryColor,
  );
  static const TextStyle navTextRed = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );
  //button_nav_text
  static TextStyle buttonNavTextOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle buttonNavTextPureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle buttonNavTextPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
  );
  //bottom_nav_text_unselected
  static const TextStyle bottomNavTextUnselected = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.lightBlackColor,
  );
  //bottom_nav_text_selected
  static const TextStyle bottomNavTextSelected = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColor.primaryColor,
  );
  //tab_nav_text
  static const TextStyle tabNavText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  //input_hint_text
  static const TextStyle inputHintText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.softLightBlackColor,
  );
  //input_text
  static const TextStyle inputText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.offBlackColor,
  );
  //alert_title
  static TextStyle alertTitleOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle alertTitlePrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.primaryColor,
  );
  //alert_text
  static TextStyle alertTextOffBlack(BuildContext context) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Theme.of(context).brightness == Brightness.light
          ? AppColor.offBlackColor
          : AppColor.greyColor,
    );
  }

  static const TextStyle alertTextPureWhite = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle alertTextRed = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );
  //huge_title
  static const TextStyle hugeText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 64,
    fontWeight: FontWeight.w800,
    color: AppColor.pureWhiteColor,
  );
  static const TextStyle hugeTextPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 64,
    fontWeight: FontWeight.w800,
    color: AppColor.primaryColor,
  );
}
