import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../widgets/custom_circle_animation_gif.dart';
import '../widgets/custom_separator.dart';

class MiniGamesLoadingPageYellow extends StatefulWidget {
  const MiniGamesLoadingPageYellow({super.key});

  @override
  State<MiniGamesLoadingPageYellow> createState() =>
      _MiniGamesLoadingPageYellowState();
}

class _MiniGamesLoadingPageYellowState
    extends State<MiniGamesLoadingPageYellow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.yellowColor,
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
                    animationGifPath: "assets/gifs/gif_bee.gif",
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
