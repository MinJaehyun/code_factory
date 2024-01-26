import 'package:flutter/material.dart';

class BackImage extends StatelessWidget {
  const BackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/img/image_2.jpeg',
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
