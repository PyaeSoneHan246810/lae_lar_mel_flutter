import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';

import '../config/colors.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({super.key});

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
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
            'Featured',
            style: AppFontStyle.headerPrimary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
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
    );
  }
}
