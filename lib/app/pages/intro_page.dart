import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:animate_do/animate_do.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 62, right: 20, bottom: 62),
          child: Column(
            children: [
              const CustomSeparator(height: 40),
              FadeInDown(
                child: const Text(
                  'Upgrade your language skills with us.',
                  style: AppFontStyle.headerPrimary,
                ),
              ),
              const CustomSeparator(height: 20),
              FadeInDown(
                child: const Text(
                  'From beginner to advanced, learn from the experienced instructors.',
                  style: AppFontStyle.captionBigOffBlack,
                ),
              ),
              const CustomSeparator(height: 80),
              FadeInDown(
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(
                      'assets/images/intro_illustration.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const CustomSeparator(height: 100),
              FadeInUp(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomFilledButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('phoneNumberPage');
                        },
                        text: 'Getting Started',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
