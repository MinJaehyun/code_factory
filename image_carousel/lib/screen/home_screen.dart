import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    getTimer();
    super.initState();
  }

  void getTimer() {
    Duration duration = Duration(seconds: 2);
    Timer.periodic(
      duration,
      (timer) {
        // UI에 나타내는 부분은 완료했고, 아래는 pageview를 controll 하기
        int currentPage = pageController.page!.toInt();
        print(currentPage);

        if (currentPage == 4) {
          currentPage = 0;
        } else {
          currentPage++;
        }

        pageController.animateToPage(
          currentPage,
          duration: duration,
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [1, 2, 3, 4, 5].map(
                (number) {
                  // 방법 1. 로컬 파일 가져오기
                  // return Image.asset(
                  //   'asset/img/image_$number.jpeg',
                  //   fit: BoxFit.cover,
                  // );

                  // 방법 2. 네트워크 이미지 가져오기: blob 대신 raw로 변경해야 가져올 수 있다
                  // return Image.network('https://github.com/codefactory-co/flutter-golden-rabbit-novice-v2/blob/main/ch09/image_carousel/asset/img/image_${number}.jpeg'); // error
                  return Image.network(
                    'https://github.com/codefactory-co/flutter-golden-rabbit-novice-v2/raw/main/ch09/image_carousel/asset/img/image_${number}.jpeg',
                    fit: BoxFit.cover,
                  );
                },
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
