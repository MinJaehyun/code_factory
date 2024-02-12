import 'package:flutter/material.dart';
import 'package:my_table_calendar/component/custom_text_field.dart';

class ScheduleBottomSheet extends StatelessWidget {
  const ScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // view 머시기 설정하기
    final viewInsetsBottom = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 2 + viewInsetsBottom,
        color: Colors.white,
        child: CusTomTextField(),
      ),
    );
  }
}
