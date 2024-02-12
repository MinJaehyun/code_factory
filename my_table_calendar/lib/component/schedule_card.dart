import 'package:flutter/material.dart';
import 'package:my_table_calendar/const/colors.dart';

class ScheduleCard extends StatelessWidget {
  // 시작 시간 start time, 종료 시간: timeout time, 내용: content
  final int startTime;
  final int endTime;
  final String content;

  const ScheduleCard({super.key, required this.startTime, required this.endTime, required this.content});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Card(
            child: ListTile(
              title: IntrinsicHeight(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${startTime.toString().padLeft(2,'0')}:00', style: TextStyle(color: PRIMARY_COLOR)),
                        Text('${endTime.toString().padLeft(2, '0')}:00', style: TextStyle(color: PRIMARY_COLOR)),
                      ],
                    ),
                    SizedBox(width: 100),
                    Expanded(child: Text(content))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
