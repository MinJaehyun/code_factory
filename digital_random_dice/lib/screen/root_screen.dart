import 'package:flutter/material.dart';

import 'dart:math';
import 'package:shake/shake.dart';
import 'package:digital_random_dice/screen/home_screen.dart';
import 'package:digital_random_dice/screen/setting_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  late TabController tabController;
  double threshold = 2.85;
  late int randomDice = Random().nextInt(5)+1;
  late ShakeDetector detector;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    // todo: 컨트롤러 속성이 변경될 때마다 실행될 함수 등록: 없어도 실행 되는 이유?
    // tabController.addListener(tabListener);
    // note: 흔들기 감지기 초기 설정
    detector = ShakeDetector.autoStart(
      // 감지 주기
      shakeSlopTimeMS: 100,
        // 중력 민감도
        shakeThresholdGravity: threshold,
        // 감지 후 실행할 함수
        onPhoneShake: () {
          // 흔든값을 기존 주사위num state에 저장한다
          setState(() {
            randomDice = Random().nextInt(5)+1;
          });
        }
    );
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  // tabListener() {
  //   setState(() {});
  // }

  void onThresholdChange(double value) {
    setState(() {
      threshold = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    void onItemTapped(index) {
      // 방법 1. tabController.index = index;
      // 방법 2. animateTo: 애니메이션 제어 메서드
      setState(() {
        tabController.animateTo(index);
      });
    }

    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: [
            HomeScreen(number: randomDice),
            SettingScreen(threshold: threshold, onThresholdChange: onThresholdChange),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.flutter_dash), label: '주사위'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
        ],
        currentIndex: tabController.index,
        selectedItemColor: Colors.amber[800],
        onTap: onItemTapped,
      ),
    );
  }
}
