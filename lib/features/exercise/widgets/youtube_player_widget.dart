import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  final String videoUrl;
  final VoidCallback onVideoEnd;

  YoutubePlayerWidget(
      {Key? key, required this.videoUrl, required this.onVideoEnd})
      : super(key: key);

  @override
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);

    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          showLiveFullscreenButton: false,
          hideThumbnail: true,
          autoPlay: true,
          mute: false,
        ),
      )..addListener(() {
          if (_controller.value.playerState == PlayerState.ended) {
            widget.onVideoEnd(); // Method to navigate to the next exercise
          }
        });
      ;
    } else {
      // Handle the scenario where the video ID couldn't be extracted
      // You might want to show an error or a placeholder
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          print('YouTube Player is ready.');
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
