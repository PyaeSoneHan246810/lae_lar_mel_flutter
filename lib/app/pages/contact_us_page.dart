import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';
import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage>
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

  void _openYouTubeChannel() {
    const channelURL = 'https://www.youtube.com/@the1975?si=5WKboQArykfmRxm3';
    launch(channelURL);
  }

  void _openFacebookPage() {
    const pageURL = 'https://www.facebook.com/the1975?mibextid=ZbWKwL';
    launch(pageURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: AppLocalizations.of(context)!.contact_us,
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
                  'assets/animations/customer_support_animation.json',
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
                AppLocalizations.of(context)!.call_center,
                style: AppFontStyle.subtitleOffBlack,
              ),
            ),
            const CustomSeparator(
              height: 12,
            ),
            FadeInLeft(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '09-989366779',
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(
                          '+959989366779',
                        );
                      },
                      icon: const Icon(
                        Icons.phone_rounded,
                        size: 20,
                        color: AppColor.pureWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSeparator(
              height: 12,
            ),
            FadeInLeft(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '09-454343475',
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(
                          '+959454343475',
                        );
                      },
                      icon: const Icon(
                        Icons.phone_rounded,
                        size: 20,
                        color: AppColor.pureWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSeparator(
              height: 24,
            ),
            FadeInLeft(
              child: Text(
                AppLocalizations.of(context)!.business_calls,
                style: AppFontStyle.subtitleOffBlack,
              ),
            ),
            const CustomSeparator(
              height: 12,
            ),
            FadeInLeft(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '09-650466358',
                    style: AppFontStyle.captionBigOffBlack,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      onPressed: () async {
                        final indirectPhoneCall =
                            Uri.parse('tel:+959650466358');
                        if (await canLaunchUrl(indirectPhoneCall)) {
                          launchUrl(indirectPhoneCall);
                        } else {
                          throw 'Could not launch $indirectPhoneCall';
                        }
                      },
                      icon: const Icon(
                        Icons.phone_rounded,
                        size: 20,
                        color: AppColor.pureWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSeparator(
              height: 24,
            ),
            FadeInLeft(
              child: const Text(
                'Follow Us On',
                style: AppFontStyle.subtitleOffBlack,
              ),
            ),
            const CustomSeparator(
              height: 12,
            ),
            FadeInLeft(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _openFacebookPage,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: SvgPicture.asset(
                          'assets/images/facebook_logo.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const CustomSeparator(
                    width: 20,
                    height: 0,
                  ),
                  GestureDetector(
                    onTap: _openYouTubeChannel,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        width: 70,
                        height: 70,
                        child: SvgPicture.asset(
                          'assets/images/youtube_logo.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
