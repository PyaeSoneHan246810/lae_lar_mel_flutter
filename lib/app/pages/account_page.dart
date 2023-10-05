import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';

import '../config/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.pureWhiteColor,
        elevation: 2,
        toolbarHeight: 60,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Account',
            style: AppFontStyle.headerPrimary,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'wishlistPage');
              },
              icon: const Icon(
                Icons.favorite,
                size: 28,
                color: AppColor.lightBlackColor,
              ),
            ),
          )
        ],
      ),
      backgroundColor: AppColor.pureWhiteColor,
      body: const Center(
        child: Text('I am May Nyein'),
      ),
    );
  }
}
