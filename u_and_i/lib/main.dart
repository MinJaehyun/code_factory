import 'package:flutter/material.dart';
import 'package:u_and_i/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        textTheme: TextTheme(
          // headline1: ,
          displayLarge: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.bold),
          // headline2: ,
          displayMedium: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold),
          // h3
          displaySmall: TextStyle(color: Colors.redAccent, fontSize: 20,),
          // headline4:
          headlineMedium: TextStyle(color: Colors.redAccent, fontSize: 20,),
        )
      ),
    );
  }
}
