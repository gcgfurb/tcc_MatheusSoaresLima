import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;

  PageTile({
    required this.label,
    required this.iconData,
    required this.onTap,
    required this.highlighted,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: highlighted ? darkGreen : Colors.black54,
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? darkGreen : Colors.black54,
      ),
      onTap: onTap,
    );
  }
}
