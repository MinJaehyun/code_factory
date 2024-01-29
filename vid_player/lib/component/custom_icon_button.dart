import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData icon;

  const CustomIconButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: IconButton(
        // note: 중복 처리 시, Icon() 내에 내용을 처리한다!
        icon: Icon(icon), // Icons.rotate_left
        onPressed: onPressed,
        color: Colors.white,
      ),
    );
  }
}
