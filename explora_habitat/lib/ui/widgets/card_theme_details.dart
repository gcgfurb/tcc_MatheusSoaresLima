import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/theme.dart';
import 'package:flutter/material.dart';

class CardThemeDetails extends StatelessWidget {
  final ThemeExplora theme;

  const CardThemeDetails({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      shape: kRoundedRectangleBorder,
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: const Icon(
              Icons.newspaper,
              size: 35,
            ),
            title: Text(
              theme.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            ),
            subtitle: Text(theme.description),
          )),
    );
  }
}
