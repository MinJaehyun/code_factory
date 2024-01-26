import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:u_and_i/screen/back_image.dart';
import 'package:u_and_i/screen/d_day.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DDay(firstDate: dateTime, onSelectedDate: onSelectedDate),
            const BackImage(),
          ],
        ),
      ),
    );
  }

  void onSelectedDate() {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            color: Colors.white,
            child: CupertinoDatePicker(
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              onDateTimeChanged: (DateTime time) {
                setState(() {
                  dateTime = time;
                });
              },
            ),
          ),
        );
      },
    );
  }
}
