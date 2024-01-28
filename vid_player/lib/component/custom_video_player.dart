import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;

  const CustomVideoPlayer({super.key, required this.video});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  // note: 초깃값 설정 안하면 late 에러 나면 아래 설정으로 해결해도 괜찮나?
  // late VideoPlayerController _videoController = VideoPlayerController.file(File(widget.video!.path));
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  void initializeController() async {
    // 방법 1. 문서: 초기화 한 값에 setState 처리함(변수 미생성)
    // _videoController = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });

    // 방법 2. 위 내용을 풀면 아래와 같다
    final _videoController = VideoPlayerController.file(
      File(widget.video!.path),
    );

    await _videoController.initialize();
    _videoController.addListener(videoPlayerController);

    setState(() {
      this._videoController = _videoController;
    });
  }

  void videoPlayerController() {
    setState(() {});
  }

  @override
  void dispose() {
    // _videoController?.dispose(); // controller 삭제가 아닌 listener 를 삭제해야 한다
    _videoController?.removeListener(videoPlayerController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_videoController == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Center(
      child: AspectRatio(
        aspectRatio: _videoController!.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(_videoController!),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Slider(
                min: 0,
                // 영상 총 시간
                max: _videoController!.value.duration.inSeconds.toDouble(),
                // 동영상 위치에 맞게 슬라이더를 이동한다
                value: _videoController!.value.position.inSeconds.toDouble(),
                // 슬라이더가 이동할 때마다 seekTo()로 동영상이 특정 위치로 이동한다
                onChanged: (double value) {
                  _videoController!.seekTo(Duration(seconds: value.toInt()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
