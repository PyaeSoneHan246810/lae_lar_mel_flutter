import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lae_lar_mel_app/app/config/themes.dart';
import 'package:lae_lar_mel_app/app/pages/reward_points_exchange_page.dart';
import 'package:lae_lar_mel_app/app/pages/reward_points_page.dart';
import 'package:lae_lar_mel_app/app/pages/about_us_page.dart';
import 'package:lae_lar_mel_app/app/pages/contact_us_page.dart';
import 'package:lae_lar_mel_app/app/pages/courses_page_japanese.dart';
import 'package:lae_lar_mel_app/app/pages/courses_page_korean.dart';
import 'package:lae_lar_mel_app/app/pages/edit_profile_page.dart';
import 'package:lae_lar_mel_app/app/pages/faq_page.dart';
import 'package:lae_lar_mel_app/app/pages/reward_points_used_history_page.dart';
import 'package:lae_lar_mel_app/app/pages/notifications_page.dart';
import 'package:lae_lar_mel_app/app/pages/search_page.dart';
import 'package:lae_lar_mel_app/app/pages/settings_page.dart';
import 'package:lae_lar_mel_app/app/pages/welcome_page.dart';
import 'package:lae_lar_mel_app/app/pages/courses_page_chinese.dart';
import 'package:lae_lar_mel_app/app/pages/complete_account_page.dart';
import 'package:lae_lar_mel_app/app/pages/courses_page_english.dart';
import 'package:lae_lar_mel_app/app/pages/login_page.dart';
import 'package:lae_lar_mel_app/app/pages/phone_number_page.dart';
import 'package:lae_lar_mel_app/app/pages/reset_password_page.dart';
import 'package:lae_lar_mel_app/app/pages/root_page.dart';
import 'package:lae_lar_mel_app/app/pages/splash_screen.dart';
import 'package:lae_lar_mel_app/app/pages/wishlist_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lae_lar_mel_app/app/providers/auth_provider.dart';
import 'package:lae_lar_mel_app/app/providers/course_enrollment_provider.dart';
import 'package:lae_lar_mel_app/app/providers/locale_provider.dart';
import 'package:lae_lar_mel_app/app/providers/theme_mode_provider.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
        ChangeNotifierProvider<ThemeModeProvider>(
            create: (_) => ThemeModeProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<CourseEnrollmentProvider>(
            create: (_) => CourseEnrollmentProvider()),
      ],
      child: Builder(
        builder: (context) {
          final provider = Provider.of<LocaleProvider>(context);
          final themeModeProvider = Provider.of<ThemeModeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeModeProvider.themeMode,
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
              'welcomePage': (context) => const WelcomePage(),
              'phoneNumberPage': (context) => const PhoneNumberPage(),
              'completeAccountPage': (context) => const CompleteAccountPage(),
              'rootPage': (context) => const RootPage(),
              'searchPage': (context) => const SearchPage(),
              'notificationsPage': (context) => const NotificationsPage(),
              'wishlistPage': (context) => const WishlistPage(),
              'englishCoursesPage': (context) => const EnglishCoursesPage(),
              'chineseCoursesPage': (context) => const ChineseCoursesPage(),
              'japaneseCoursesPage': (context) => const JapaneseCoursesPage(),
              'koreanCoursesPage': (context) => const KoreanCoursesPage(),
              'editProfilePage': (context) => const EditProfilePage(),
              'settingsPage': (context) => const SettingsPage(),
              'rewardPointsPage': (context) => const RewardPointsPage(),
              'rewardPointsUsedHistoryPage': (context) =>
                  const RewardPointsUsedHistoryPage(),
              'rewardPointsExchangePage': (context) =>
                  const RewardPointsExchangePage(),
              'aboutUsPage': (context) => const AboutUsPage(),
              'contactUsPage': (context) => const ContactUsPage(),
              'faqPage': (context) => const FAQPage(),
            },
          );
        },
      ),
    );
  }
}
