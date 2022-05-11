import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/theme.dart';
import 'package:explora_habitat/services/stores/edit_theme_store.dart';
import 'package:explora_habitat/ui/widgets/update_theme_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CardThemeDetails extends StatelessWidget {
  final ThemeExplora theme;
  final bool editing;

  CardThemeDetails({required this.theme, this.editing = false});

  @override
  Widget build(BuildContext context) {
    EditThemeStore editThemeStore = EditThemeStore(theme);

    void showEditDialog() async {
      await showDialog(
        context: context,
        builder: (_) => UpdateThemeModal(editThemeStore: editThemeStore),
      );
    }

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
            title: Observer(
              builder: (_) => Text(
                editThemeStore.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ),
            subtitle: Observer(
              builder: (_) => Text(editThemeStore.description),
            ),
            trailing: editing
                ? IconButton(
                    onPressed: showEditDialog,
                    icon: const Icon(Icons.edit),
                  )
                : null,
          )),
    );
  }
}
