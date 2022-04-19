import 'package:explora_habitat/constants/constants_style.dart';
import 'package:flutter/material.dart';

class CustomMaterialButtom extends StatelessWidget {

  final Color color;
  final String text;
  final Function()? onPressed;

  CustomMaterialButtom({required this.color, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      disabledColor: color.withAlpha(120),
      disabledTextColor: Colors.teal,
      color: color,
      shape: kRoundedRectangleBorder,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
