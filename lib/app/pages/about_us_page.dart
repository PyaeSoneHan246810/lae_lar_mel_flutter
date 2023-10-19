import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        titleText: AppLocalizations.of(context)!.about_us,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
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
              child: Text(
                AppLocalizations.of(context)!.about_laelarmel,
                style: AppFontStyle.title1Primary,
              ),
            ),
            const CustomSeparator(
              height: 12,
            ),
            FadeInLeft(
              child: Text(
                AppLocalizations.of(context)!.about_laelarmel_text,
                style: AppFontStyle.bodyOffBlack,
                textAlign: TextAlign.justify,
              ),
            ),
            const CustomSeparator(
              height: 24,
            ),
            FadeInLeft(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.our_story,
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
              child: Text(
                AppLocalizations.of(context)!.our_story_text,
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
