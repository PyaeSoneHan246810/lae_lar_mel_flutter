import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';

class AppFontStyle {
  AppFontStyle._();
  static const TextStyle headerPrimary = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColor.primaryColor,
  );
  static const TextStyle bottomNavText = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.lightBlackColor,
  );
  static const TextStyle bottomNavTextSelected = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColor.primaryColor,
  );
}
