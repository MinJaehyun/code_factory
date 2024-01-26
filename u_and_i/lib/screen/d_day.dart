import 'package:flutter/material.dart';

class DDay extends StatelessWidget {
  const DDay({super.key, required this.firstDate, required this.onSelectedDate});

  final DateTime firstDate;
  final void Function() onSelectedDate;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final String selectedDate = '${firstDate.year}.${firstDate.month}.${firstDate.day}';
    List<int> reviewCycle = [1, 4, 7, 14, 30, 60];

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    leading: const FlutterLogo(),
                    title: Text('복습 주기 알리미', style: textTheme.displayLarge),
                    trailing: IconButton(
                      onPressed: () {
                        // 복습 노트 클릭 시 하단에 Dialog 나타내며, 그 안에 DataPicker 나타내고 선택한 날짜를 UI로 나타내기
                        onSelectedDate();
                      },
                      icon: const Icon(Icons.note_add, size: 40),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // note: 날짜를 선택하면 복습 주기를 알려 드립니다.
                Text('선택한 날짜: $selectedDate', style: textTheme.headlineMedium),
                const SizedBox(height: 10),
                Text("복습 주기: ", style: textTheme.headlineMedium),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: reviewCycle.length,
                    itemBuilder: (context, index) {
                      final reviewDate = firstDate.add(Duration(days: reviewCycle[index]));
                      final String formattedMonth = reviewDate.month < 10 ? '0${reviewDate.month}' : '${reviewDate.month}';
                      final String formattedDay = reviewDate.day < 10 ? '0${reviewDate.day}' : '${reviewDate.day}';

                      return Column(
                        children: [
                          const SizedBox(height: 5),
                          Text("${index + 1}:  ${reviewDate.year}.$formattedMonth.$formattedDay", style: textTheme.headlineMedium),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
