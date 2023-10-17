import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';

import '../widgets/custom_separator.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieAnimationController;

  @override
  void initState() {
    lottieAnimationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    lottieAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: 'About Us',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColor.pureWhiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              child: Center(
                child: Lottie.asset(
                  'assets/animations/mobile_platform_animation.json',
                  width: 240,
                  height: 240,
                  fit: BoxFit.fill,
                  repeat: false,
                  onLoaded: (composition) {
                    lottieAnimationController
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
            ),
            const CustomSeparator(
              height: 24,
            ),
            FadeInLeft(
              child: const Text(
                'About Lae Lar Mel',
                style: AppFontStyle.title1Primary,
              ),
            ),
            const CustomSeparator(
              height: 12,
            ),
            FadeInLeft(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LaeLarMel is the e-learning mobile application platform, offering language courses that include both free and paid options, taught by skilled instructors.',
                    style: AppFontStyle.bodyOffBlack,
                    textAlign: TextAlign.justify,
                  ),
                  CustomSeparator(
                    height: 2,
                  ),
                  Text(
                    'The application is available for both Android and iOS.',
                    style: AppFontStyle.bodyOffBlack,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const CustomSeparator(
              height: 24,
            ),
            FadeInLeft(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Our Story',
                    style: AppFontStyle.title2Secondary,
                  ),
                  const CustomSeparator(
                    height: 4,
                  ),
                  Container(
                    width: 28,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: AppColor.featuredColor,
                    ),
                  ),
                ],
              ),
            ),
            const CustomSeparator(
              height: 12,
            ),
            FadeInLeft(
              child: const Text(
                'A group of students from GUSTO University came up with the innovative idea for the LaeLarMel mobile application platform during the GUSTO Innovation Challenge in 2023.',
                style: AppFontStyle.bodyOffBlack,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
