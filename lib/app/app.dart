import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/course_details_page.dart';
import 'package:lae_lar_mel_app/app/pages/edit_profile_page.dart';
import 'package:lae_lar_mel_app/app/pages/featured_page.dart';
import 'package:lae_lar_mel_app/app/pages/intro_page.dart';
import 'package:lae_lar_mel_app/app/pages/language_pages/chinese_courses_page.dart';
import 'package:lae_lar_mel_app/app/pages/complete_account_page.dart';
import 'package:lae_lar_mel_app/app/pages/language_pages/english_courses_page.dart';
import 'package:lae_lar_mel_app/app/pages/language_pages/japanese_courses_page.dart';
import 'package:lae_lar_mel_app/app/pages/language_pages/korean_courses_page.dart';
import 'package:lae_lar_mel_app/app/pages/login_page.dart';
import 'package:lae_lar_mel_app/app/pages/otp_verification_page.dart';
import 'package:lae_lar_mel_app/app/pages/phone_number_page.dart';
import 'package:lae_lar_mel_app/app/pages/reset_password_page.dart';
import 'package:lae_lar_mel_app/app/pages/root_page.dart';
import 'package:lae_lar_mel_app/app/pages/splash_screen.dart';
import 'package:lae_lar_mel_app/app/pages/wishlist_page.dart';

import 'config/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: AppColor.primaryColor,
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
      ),
      home: const SplashScreen(),
      routes: {
        'introPage': (context) => const IntroPage(),
        'phoneNumberPage': (context) => const PhoneNumberPage(),
        'otpVerificationPage': (context) => const OTPVerificationPage(),
        'completeAccountPage': (context) => const CompleteAccountPage(),
        'loginPage': (context) => const LoginPage(),
        'resetPasswordPage': (context) => const ResetPasswordPage(),
        'rootPage': (context) => const RootPage(),
        'wishlistPage': (context) => const WishlistPage(),
        'englishCoursesPage': (context) => const EnglishCoursesPage(),
        'chineseCoursesPage': (context) => const ChineseCoursesPage(),
        'japaneseCoursesPage': (context) => const JapaneseCoursesPage(),
        'koreanCoursesPage': (context) => const KoreanCoursesPage(),
        'editProfilePage': (context) => const EditProfilePage(),
      },
    );
  }
}
