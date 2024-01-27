import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('asset/img/$number.png'),
            const SizedBox(height: 10),
            const Text('행운의 숫자', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Text('$number', style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
