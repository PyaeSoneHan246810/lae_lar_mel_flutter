import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/account_page.dart';
import 'package:lae_lar_mel_app/app/pages/featured_page.dart';
import 'package:lae_lar_mel_app/app/pages/my_learning_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/font_styles.dart';
import 'games_page.dart';

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
    GamesPage(),
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
      body: _mainPages[_currentPage],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          elevation: 12,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.star_rounded,
                  size: 26,
                ),
              ),
              label: AppLocalizations.of(context)!.featured,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.slow_motion_video_rounded,
                  size: 26,
                ),
              ),
              label: AppLocalizations.of(context)!.my_learning,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.extension_rounded,
                  size: 26,
                ),
              ),
              label: "Games",
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.person_rounded,
                  size: 26,
                ),
              ),
              label: AppLocalizations.of(context)!.account,
            ),
          ],
          unselectedLabelStyle: AppFontStyle.bottomNavTextUnselected,
          selectedLabelStyle: AppFontStyle.bottomNavTextSelected,
          currentIndex: _currentPage,
          onTap: _navigateBottomNavBarItem,
        ),
      ),
    );
  }
}
