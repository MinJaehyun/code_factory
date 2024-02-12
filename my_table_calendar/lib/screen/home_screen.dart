import 'package:flutter/material.dart';
import 'package:my_table_calendar/component/main_calendar.dart';
import 'package:my_table_calendar/component/schedule_bottom_sheet.dart';
import 'package:my_table_calendar/component/schedule_card.dart';
import 'package:my_table_calendar/component/today_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime? focusedDay;
  DateTime? startTime;
  DateTime? endTime;
  String? content;
  int? todoCount;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('일정 관리 앱')),
        body: Column(
          children: [
            MainCalendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay ?? DateTime.now(),
              onDaySelected: onDaySelected,
            ),
            // 날짜와 개수 내려주기
            TodayBanner(selectedDay: selectedDay, todoCount: 1),

            // 3개 녀려주기
            // ScheduleCard(startTime:startTime, endTime:endTime, content: content),
            ScheduleCard(startTime: 12, endTime: 14, content: 'content'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // note: showModalBottomSheet 생성 위치 주의!
            showModalBottomSheet(
              context: context,
              isDismissible: true,
              builder: (context) {
                return ScheduleBottomSheet();
              },
              // note: sheet 화면에서 키보드 띄우면 화면 가려지는데, isScrollControlled 설정하면 해결됨.
              isScrollControlled: true,
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = focusedDay;
    });
  }
}
