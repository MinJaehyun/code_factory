import 'package:flutter/material.dart';
import 'package:youtube_play/component/custom_youtube_player.dart';
import 'package:youtube_play/model/video_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomYoutubePlayer(
          // note: 구조 익숙해지기 (위젯 내 속성 내려줄 때, model 통한 인스턴스 생성하여 내려주고 있다)
          videoModel: VideoModel(
            id: 'iLnmTe5Q2Qw',
            title: 'flutter',
          ),
        ),
      ),
    );
  }
}
