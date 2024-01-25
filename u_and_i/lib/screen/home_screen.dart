import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 현재 날짜
    DateTime dateTime = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white24,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _DDay(),
            ),
            _BackImage(),
          ],
        ),
      ),
    );
  }
}

class _DDay extends StatefulWidget {
  const _DDay({super.key});

  @override
  State<_DDay> createState() => _DDayState();
}

class _DDayState extends State<_DDay> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Card(
                child: ListTile(
                  leading: FlutterLogo(),
                  title: Text('복습 주기 알리미', style: textTheme.displayLarge),
                  trailing: IconButton(
                    onPressed: () {
                      // 복습 노트 클릭 시, 하단에 Dialog 나타내며, 그 안에 DataPicker 나타내고, 선택한 날짜를 나타내기

                      // 240125 - testing...
                      // Future<DateTime?> selectDate() {
                      //   showCupertinoDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return showDatePicker(
                      //         context: context,
                      //         firstDate: firstDate,
                      //         lastDate: lastDate,
                      //         onDatePickerModeChange: (DateTime data) {
                      //
                      //         },
                      //       );
                      //     },
                      //   );
                      // }
                    },
                    icon: Icon(Icons.note_add, size: 40),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('최초 시작일로부터 30일이 지났습니다.', style: textTheme.headlineMedium),
              const SizedBox(height: 10),
              Text('복습할 날짜: 2024.01.26, 2024.01.30, ...', // 말줄임표 클릭하면 날짜 나타내기?
                  style: textTheme.headlineMedium),
            ],
          ),
        ],
      ),
    );
  }
}

class _BackImage extends StatelessWidget {
  const _BackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/img/image_2.jpeg',
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
