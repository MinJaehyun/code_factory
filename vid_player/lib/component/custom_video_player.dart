import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({super.key, required this.video});
  final XFile video;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  // note: 초깃값 설정 안하면 late null 에러 발생 하는데, 값 설정 괜찮은지?
  // late VideoPlayerController _controller = VideoPlayerController.file(File(widget.video!.path));
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  void initializeController() async {
    // 방법 1. 패키지 문서 초기화 방법
    // _controller = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });

    // 방법 2.
    final _controller = VideoPlayerController.file(
      File(widget.video!.path),
    );

    await _controller.initialize();

    setState(() {
      this._controller = _controller;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return AspectRatio(
      aspectRatio: _controller!.value.aspectRatio,
      // todo: 상단 배치된 동영상을 중앙에 배치하는 방법은?
      child: VideoPlayer(_controller!),
    );
  }
}
