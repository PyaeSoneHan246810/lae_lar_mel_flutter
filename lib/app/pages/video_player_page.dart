import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:pod_player/pod_player.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoID;
  const VideoPlayerPage({
    super.key,
    required this.videoID,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late final PodPlayerController _podPlayerController;

  @override
  void initState() {
    super.initState();
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
      body: Center(
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
