import 'package:flutter/material.dart';

import 'package:my_table_calendar/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  // note: 주의: 문서에 import 'package:intl/intl.dart'; 그대로 설정하면 에러난다.
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}