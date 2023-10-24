import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';

// Light Theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColor.primaryColor,
  useMaterial3: false,
  scaffoldBackgroundColor: AppColor.pureWhiteColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColor.pureWhiteColor,
    iconTheme: IconThemeData(
      color: AppColor.lightBlackColor,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColor.primaryColor,
    unselectedLabelColor: AppColor.lightBlackColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColor.pureWhiteColor,
    unselectedItemColor: AppColor.lightBlackColor,
    selectedItemColor: AppColor.primaryColor,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    dragHandleColor: AppColor.primaryColor,
    showDragHandle: true,
    backgroundColor: AppColor.lightestBlueColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColor.primaryColor,
  useMaterial3: false,
  scaffoldBackgroundColor: AppColor.darkGrey,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColor.darkGreyLight1,
    iconTheme: IconThemeData(
      color: AppColor.greyColor,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColor.primaryColor,
    unselectedLabelColor: AppColor.greyColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColor.darkGreyLight1,
    unselectedItemColor: AppColor.greyColor,
    selectedItemColor: AppColor.primaryColor,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    dragHandleColor: AppColor.primaryColor,
    showDragHandle: true,
    backgroundColor: AppColor.darkGreyLight1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
  ),
);
