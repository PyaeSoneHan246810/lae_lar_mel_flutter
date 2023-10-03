import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/account_page.dart';
import 'package:lae_lar_mel_app/app/pages/featured_page.dart';
import 'package:lae_lar_mel_app/app/pages/my_learning_page.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Widget> mainPages = const [
    FeaturedPage(),
    MyLearningPage(),
    AccountPage()
  ];
  int _currentPage = 0;
  void _navigateBottomNavBarItem(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhiteColor,
      body: mainPages[_currentPage],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: AppColor.pureWhiteColor,
          elevation: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.star,
                  size: 28,
                ),
              ),
              label: 'Featured',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.slow_motion_video,
                  size: 28,
                ),
              ),
              label: 'My Learning',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Icon(
                  Icons.person,
                  size: 28,
                ),
              ),
              label: 'Account',
            ),
          ],
          unselectedItemColor: AppColor.lightBlackColor,
          selectedItemColor: AppColor.primaryColor,
          unselectedLabelStyle: AppFontStyle.bottomNavText,
          selectedLabelStyle: AppFontStyle.bottomNavTextSelected,
          currentIndex: _currentPage,
          onTap: _navigateBottomNavBarItem,
        ),
      ),
    );
  }
}
