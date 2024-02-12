import 'package:flutter/material.dart';
import 'package:my_table_calendar/component/main_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? selectedDay;
  DateTime? focusedDay;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('일정 관리 앱')),
        body: Column(
          children: [
            Expanded(
              child: MainCalendar(
                selectedDay: selectedDay ?? DateTime.now(),
                focusedDay: focusedDay ?? DateTime.now(),
                onDaySelected: onDaySelected,
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('선택한 날짜: 2024.02.14'), Text('총 개수: 4')],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('시작 시간'),
                              Text('종료 시간'),
                            ],
                          ),
                          SizedBox(width: 100),
                          Text('contents')
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('18:00'),
                              Text('19:00'),
                            ],
                          ),
                          SizedBox(width: 100),
                          Text('16장 달력 UI 구현하기')
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
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
