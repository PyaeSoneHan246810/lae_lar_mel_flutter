import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:pod_player/pod_player.dart';
import '../config/colors.dart';
import '../config/font_styles.dart';

class PremiumCourseVideoPlayerPage extends StatefulWidget {
  final String videoID;
  const PremiumCourseVideoPlayerPage({
    super.key,
    required this.videoID,
  });

  @override
  State<PremiumCourseVideoPlayerPage> createState() =>
      _PremiumCourseVideoPlayerPageState();
}

class _PremiumCourseVideoPlayerPageState
    extends State<PremiumCourseVideoPlayerPage> {
  late final PodPlayerController _podPlayerController;

  @override
  void initState() {
    super.initState();
    //Window manager
    FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_SECURE,
    );
    //Pod Player
    _podPlayerController = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo(widget.videoID),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: true,
        isLooping: false,
      ),
    )..initialise();
  }

  @override
  void dispose() {
    _podPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureBlackColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: PodVideoPlayer(
          controller: _podPlayerController,
          alwaysShowProgressBar: false,
          podProgressBarConfig: const PodProgressBarConfig(
            backgroundColor: AppColor.offBlackColor,
            circleHandlerColor: AppColor.primaryColor,
            bufferedBarColor: AppColor.lightBlackColor,
            playingBarColor: AppColor.primaryColor,
          ),
          onLoading: (context) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
                CustomSeparator(
                  height: 18,
                ),
                SizedBox(
                  height: 20.0,
                  child: Text(
                    'Loading',
                    style: AppFontStyle.captionBigPureWhite,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
