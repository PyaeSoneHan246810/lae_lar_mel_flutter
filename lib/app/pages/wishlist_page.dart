import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: 'Wishlist',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColor.pureWhiteColor,
      body: FadeInDown(
        child: ListView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 100,
            ),
            SizedBox(
              width: 230,
              height: 170,
              child: SvgPicture.asset(
                'assets/images/empty_course_placeholder.svg',
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 20,
            ),
            const Text(
              "You don't have any courses on your wishlist. Want to save something for later?",
              style: AppFontStyle.bodyOffBlack,
            ),
          ],
        ),
      ),
    );
  }
}
