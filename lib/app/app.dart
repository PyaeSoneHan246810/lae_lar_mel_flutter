import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lae_lar_mel_app/app/pages/about_us_page.dart';
import 'package:lae_lar_mel_app/app/pages/contact_us_page.dart';
import 'package:lae_lar_mel_app/app/pages/courses_page_japanese.dart';
import 'package:lae_lar_mel_app/app/pages/courses_page_korean.dart';
import 'package:lae_lar_mel_app/app/pages/edit_profile_page.dart';
import 'package:lae_lar_mel_app/app/pages/faq_page.dart';
import 'package:lae_lar_mel_app/app/pages/intro_page.dart';
import 'package:lae_lar_mel_app/app/pages/courses_page_chinese.dart';
import 'package:lae_lar_mel_app/app/pages/complete_account_page.dart';
import 'package:lae_lar_mel_app/app/pages/courses_page_english.dart';
import 'package:lae_lar_mel_app/app/pages/login_page.dart';
import 'package:lae_lar_mel_app/app/pages/otp_verification_page.dart';
import 'package:lae_lar_mel_app/app/pages/phone_number_page.dart';
import 'package:lae_lar_mel_app/app/pages/reset_password_page.dart';
import 'package:lae_lar_mel_app/app/pages/root_page.dart';
import 'package:lae_lar_mel_app/app/pages/splash_screen.dart';
import 'package:lae_lar_mel_app/app/pages/wishlist_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lae_lar_mel_app/app/providers/locale_provider.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';
import 'config/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: AppColor.primaryColor,
              scaffoldBackgroundColor: AppColor.pureWhiteColor,
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
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
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
              'aboutUsPage': (context) => const AboutUsPage(),
              'contactUsPage': (context) => const ContactUsPage(),
              'faqPage': (context) => const FAQPage(),
            },
          );
        },
      );
}
