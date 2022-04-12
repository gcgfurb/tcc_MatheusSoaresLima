import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function()? onPressed;
  final Color color;
  final Size? size;

  CustomElevatedButton({
    required this.icon,
    this.iconSize = 30,
    required this.onPressed,
    this.color = Colors.green,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: size ?? const Size(60, 60),
        shape: const CircleBorder(),
        primary: color,
      ),
      onPressed: onPressed,
      child: Icon(icon, size: iconSize),
    );
  }
}
