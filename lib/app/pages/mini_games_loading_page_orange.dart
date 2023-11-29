import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/pages/mini_games_quiz_page.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';

import '../widgets/custom_circle_animation_gif.dart';

class MiniGamesLoadingPageOrange extends StatefulWidget {
  const MiniGamesLoadingPageOrange({super.key});

  @override
  State<MiniGamesLoadingPageOrange> createState() =>
      _MiniGamesLoadingPageOrangeState();
}

class _MiniGamesLoadingPageOrangeState extends State<MiniGamesLoadingPageOrange>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const MiniGamesQuizPage();
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.orangeColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomIn(
                  child: const Text(
                    "Loading...",
                    style: AppFontStyle.mediumTextPureWhite,
                    textAlign: TextAlign.center,
                  ),
                ),
                const CustomSeparator(
                  height: 40,
                  width: 0,
                ),
                ZoomIn(
                  child: const CustomCircleAnimationGif(
                    animationGifPath: "assets/gifs/gif_bear.gif",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
