import 'package:flutter/material.dart';

import 'package:my_table_calendar/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final DateTime selectedDay;
  final DateTime focusedDay;
  final void Function(DateTime, DateTime) onDaySelected;

  const MainCalendar({super.key, required this.selectedDay, required this.focusedDay, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
      onDaySelected: onDaySelected,
      // 상단 달력 style
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
      ),
      calendarStyle: CalendarStyle(
        // 오늘 날짜 흐린 스타일 제거하기
        isTodayHighlighted: false,
        // 평일 style
        defaultDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: LIGHT_GREY_COLOR,
        ),
        // 주말 style
        weekendDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: LIGHT_GREY_COLOR,
        ),
        // 선택한 날짜 style
        selectedDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: PRIMARY_COLOR,
        ),
        // 평일 글꼴 style
        defaultTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        // 주말 글꼴 style
        weekendTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: DARK_GREY_COLOR,
        ),
        // 선택한 날짜 글꼴 style
        selectedTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: PRIMARY_COLOR,
        )
      ),
    );
  }
}
