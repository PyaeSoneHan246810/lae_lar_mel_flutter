import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';

import '../config/colors.dart';
import '../widgets/custom_appbar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Account',
        onBackButtonPressed: () {
          Navigator.pushNamed(context, 'wishlistPage');
        },
      ),
      backgroundColor: AppColor.pureWhiteColor,
      body: const Center(
        child: Text('I am May Nyein'),
      ),
    );
  }
}
