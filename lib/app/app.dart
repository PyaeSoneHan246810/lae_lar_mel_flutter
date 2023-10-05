import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/language_pages/chinese_courses_page.dart';
import 'package:lae_lar_mel_app/app/pages/language_pages/english_courses_page.dart';
import 'package:lae_lar_mel_app/app/pages/language_pages/japanese_courses_page.dart';
import 'package:lae_lar_mel_app/app/pages/language_pages/korean_courses_page.dart';
import 'package:lae_lar_mel_app/app/pages/root_page.dart';
import 'package:lae_lar_mel_app/app/pages/wishlist_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const RootPage(),
      routes: {
        'wishlistPage': (context) => const WishlistPage(),
        'englishCoursesPage': (context) => const EnglishCoursesPage(),
        'chineseCoursesPage': (context) => const ChineseCoursesPage(),
        'japaneseCoursesPage': (context) => const JapaneseCoursesPage(),
        'koreanCoursesPage': (context) => const KoreanCoursesPage(),
      },
    );
  }
}
