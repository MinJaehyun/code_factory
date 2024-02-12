import 'package:flutter/material.dart';
import 'package:my_table_calendar/const/colors.dart';

class TodayBanner extends StatelessWidget {
  final selectedDay;
  final todoCount;

  const TodayBanner({super.key, required this.selectedDay, required this.todoCount});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Container(
      color: PRIMARY_COLOR,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('선택한 날짜: ${selectedDay.year}.${selectedDay.month}.${selectedDay.day}', style: textStyle),
            Text('총 개수: $todoCount', style: textStyle),
          ],
        ),
      ),
    );
  }
}
