import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:vid_player/component/custom_icon_button.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final GestureTapCallback onNewImage;

  const CustomVideoPlayer({super.key, required this.video, required this.onNewImage});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? _videoController;
  bool isShowControllers = false;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  void initializeController() async {
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
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 선택한 video가 다른 경우(상위에서 선택한 video.path을 자식에서 받고 있다)
    if (oldWidget.video!.path != widget.video!.path) {
      initializeController();
    }
  }

  @override
  void dispose() {
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

    return GestureDetector(
      onTap: () {
        setState(() {
          isShowControllers = !isShowControllers;
        });

        Future.delayed(const Duration(milliseconds: 3500), () {
          setState(() {
            if (_videoController!.value.isPlaying || !_videoController!.value.isPlaying) {
              isShowControllers = !isShowControllers;
            }
          });
        });
      },
      child: Center(
        child: AspectRatio(
          aspectRatio: _videoController!.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(_videoController!),
              if (isShowControllers) Container(color: Colors.black.withOpacity(0.5)),
              if (isShowControllers)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      // note: 현재 진행 시간: .position
                      Text(
                          '${_videoController!.value.position.inHours.toString().padLeft(2, '0')}:'
                          '${(_videoController!.value.position.inMinutes % 60).toString().padLeft(2, '0')}:'
                          '${(_videoController!.value.position.inSeconds % 60).toString().padLeft(2, '0')}',
                          style: TextStyle(color: Colors.white)),
                      Expanded(
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
                      // note: 총 시간: .duration;
                      Text(
                        '${_videoController!.value.duration.inHours.toString().padLeft(2, '0')}:'
                        '${(_videoController!.value.duration.inMinutes % 60).toString().padLeft(2, '0')}:'
                        '${(_videoController!.value.duration.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              if (isShowControllers)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(icon: Icon(Icons.photo_camera_back), onPressed: widget.onNewImage, color: Colors.white),
                ),
              if (isShowControllers)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                      icon: Icons.rotate_left,
                      onPressed: onReversePressed,
                    ),
                    CustomIconButton(
                      icon: _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      onPressed: onPlayPressed,
                    ),
                    CustomIconButton(
                      icon: Icons.rotate_right,
                      onPressed: onForwardPressed,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  void onReversePressed() {
    final currentPosition = _videoController!.value.position;
    Duration position = Duration();
    // print(currentPosition); // 0:00:05.000000

    if (currentPosition.inSeconds > 3) {
      position = currentPosition - Duration(seconds: 3);
      // print(position); // 0:00:02.000000
    }

    _videoController!.seekTo(position);
  }

  void onPlayPressed() {
    // 컨트롤러가 실행 중이면 pause(), 아니면 play()
    if (_videoController!.value.isPlaying) {
      _videoController!.pause();
    } else {
      _videoController!.play();
    }
  }

  void onForwardPressed() {
    final maxPosition = _videoController!.value.duration;
    final currentPosition = _videoController!.value.position;
    print(maxPosition); // 0:00:15.066000, Duration type
    print(currentPosition); //0:00:10.000000, Duration type

    Duration position = maxPosition;

    // note: ***
    if ((maxPosition - Duration(seconds: 3)).inSeconds > currentPosition.inSeconds) {
      position = currentPosition + Duration(seconds: 3);
    }

    _videoController!.seekTo(position);
  }
}
