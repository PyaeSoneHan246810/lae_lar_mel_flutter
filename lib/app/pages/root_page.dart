import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/account_page.dart';
import 'package:lae_lar_mel_app/app/pages/featured_page.dart';
import 'package:lae_lar_mel_app/app/pages/my_learning_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentPage = 0;
  final List<Widget> _mainPages = const [
    FeaturedPage(),
    MyLearningPage(),
    AccountPage()
  ];
  void _navigateBottomNavBarItem(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhiteColor,
      body: _mainPages[_currentPage],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: AppColor.pureWhiteColor,
          elevation: 12,
          items: [
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.star_rounded,
                  size: 28,
                ),
              ),
              label: AppLocalizations.of(context)!.featured,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.slow_motion_video_rounded,
                  size: 28,
                ),
              ),
              label: AppLocalizations.of(context)!.my_learning,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.person_rounded,
                  size: 28,
                ),
              ),
              label: AppLocalizations.of(context)!.account,
            ),
          ],
          unselectedItemColor: AppColor.lightBlackColor,
          selectedItemColor: AppColor.primaryColor,
          unselectedLabelStyle: AppFontStyle.bottomNavTextUnselected,
          selectedLabelStyle: AppFontStyle.bottomNavTextSelected,
          currentIndex: _currentPage,
          onTap: _navigateBottomNavBarItem,
        ),
      ),
    );
  }
}
