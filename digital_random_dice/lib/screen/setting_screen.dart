import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key, required this.threshold, required this.onThresholdChange});

  final double threshold;
  final void Function(double value) onThresholdChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('민감도 조절', style: TextStyle(fontSize: 20)),
        Slider(
          min: 0.1,
          max: 10.0,
          divisions: 101,
          onChanged: (value) {
            onThresholdChange(value);
          },
          value: threshold,
          label: threshold.toStringAsFixed(1),
        ),
      ],
    );
  }
}
