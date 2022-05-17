import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:flutter/material.dart';

class ThemeDetailsTile extends StatelessWidget {
  final ThemeExplora theme;
  final Widget actions;

  ThemeDetailsTile({required this.theme, required this.actions});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.newspaper,
        size: 50.0,
      ),
      trailing: actions,
      title: Text(
        theme.title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        theme.description,
        style: const TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }
}
