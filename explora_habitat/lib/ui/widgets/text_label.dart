import 'package:explora_habitat/constants/constants_style.dart';
import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;
  final Color color;

  const TextLabel(this.text, {this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: kLabelStyle.copyWith(color: color),
      ),
    );
  }
}
