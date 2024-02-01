import 'package:flutter/material.dart';
import 'package:youtube_play/repository/youtube_repository.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomYoutubePlayer extends StatefulWidget {
  final videoModel;

  const CustomYoutubePlayer({super.key, required this.videoModel});

  @override
  State<CustomYoutubePlayer> createState() => _CustomYoutubePlayerState();
}

class _CustomYoutubePlayerState extends State<CustomYoutubePlayer> {
  YoutubePlayerController? youtubePlayerController;

  @override
  void initState() {
    super.initState();

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.videoModel.id,
      flags: YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        YoutubePlayer(
          controller: youtubePlayerController!,
          showVideoProgressIndicator: true,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.videoModel!.title,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            YoutubeRepository.getVideo();
          },
          child: Text('test', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    youtubePlayerController!.dispose();
  }
}
