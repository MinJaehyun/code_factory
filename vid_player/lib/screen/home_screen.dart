import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:vid_player/component/custom_video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: video == null ? renderEmpty() : renderVideo(),
      ),
    );
  }

  Widget renderEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                // note: 아래는 STL class Logo(), AppName()으로 분리할 수 있다
                GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    // 방법 1. 기존 Video를 gallery에서 가져오는 방법
                    // final XFile? media = await picker.pickVideo(source: ImageSource.gallery);

                    // 방법 2. 문서: pickMedia 사용하여 한 개의 이미지 또는 영상을 가져올 수 있다
                    final XFile? media = await picker.pickMedia();

                    if (media != null) {
                      setState(() {
                        video = media;
                      });
                    }
                    // print(media!.path); // data/user/0/com.example.vid_player/cache/c1ee5fa9-99ed-4b5c-bdc2-c9060f136f1bchatting_app_240101.drawio
                  },
                  child: Image.asset('asset/img/logo.png'),
                ),
                SizedBox(height: 15),
                Text('영상을 선택해 주세요.', style: TextStyle(fontSize: 20, color: Colors.white30)),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget renderVideo() {
    return CustomVideoPlayer(video:video!);
  }
}
