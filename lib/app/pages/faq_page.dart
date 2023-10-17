import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';

import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: 'FAQs',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColor.pureWhiteColor,
    );
  }
}
