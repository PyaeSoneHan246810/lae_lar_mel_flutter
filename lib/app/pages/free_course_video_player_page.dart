import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import '../config/colors.dart';

class FreeCourseVideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  const FreeCourseVideoPlayerPage({
    super.key,
    required this.videoUrl,
  });

  @override
  State<FreeCourseVideoPlayerPage> createState() =>
      _FreeCourseVideoPlayerPageState();
}

class _FreeCourseVideoPlayerPageState extends State<FreeCourseVideoPlayerPage> {
  late final YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    //Window Manager
    FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_SECURE,
    );
    //Youtube Video Player
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _youtubePlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureBlackColor,
      body: SafeArea(
        child: Center(
          child: YoutubePlayer(
            controller: _youtubePlayerController,
            showVideoProgressIndicator: true,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  backgroundColor: AppColor.offBlackColor,
                  handleColor: AppColor.primaryColor,
                  bufferedColor: AppColor.lightBlackColor,
                  playedColor: AppColor.primaryColor,
                ),
              ),
              RemainingDuration(),
              const PlaybackSpeedButton(),
              FullScreenButton(),
            ],
          ),
        ),
      ),
    );
  }
}
