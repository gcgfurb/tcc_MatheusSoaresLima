import 'package:explora_habitat/services/stores/create_objective_store.dart';
import 'package:explora_habitat/services/stores/create_tema_store.dart';
import 'package:explora_habitat/services/stores/my_theme_store.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/create_objective_screen.dart';
import 'package:explora_habitat/ui/screens/theme/components/expandable_fab.dart';
import 'package:explora_habitat/ui/screens/theme/components/my_theme_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class MyThemeScreen extends StatelessWidget {
  static const _actionTitles = ['Sincronizar temas', 'Ler QRCode'];

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeStore themeStore = GetIt.I<ThemeStore>();

    void editTheme(int index) {
      final CreateThemeStore createThemeStore = CreateThemeStore()
        ..editTheme(
          themeStore.themes[index],
          index,
        );
      createThemeStore.editTheme(themeStore.themes[index], index);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => CreateObjectiveStore()
              ..setObjectives(themeStore.themes[index].objectives
                  .map((objective) => objective.clone())
                  .toList()),
            child: CreateObjetivoScreen(
              createThemeStore: createThemeStore,
            ),
          ),
        ),
      );
    }

    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: const Text('Meus Temas'),
          centerTitle: true,
        ),
        floatingActionButton: ExpandableFab(
          distance: 70,
          children: [
            ActionButton(
              onPressed: () => _showAction(context, 0),
              icon: const Icon(Icons.sync),
            ),
            ActionButton(
              onPressed: () => _showAction(context, 1),
              icon: const Icon(Icons.qr_code_scanner),
            ),
          ],
        ),
        body: Observer(
          builder: (_) => ListView.builder(
            itemCount: themeStore.themes.length,
            itemBuilder: (_, index) => Provider(
              create: (_) => MyThemeStore(themeStore.themes[index]),
              child: MyThemeCard(
                onDelete: () => themeStore.delete(index),
                onCopy: () => themeStore.copy(index),
                onEdit: () => editTheme(index),
                onSync: () => themeStore.sync(index),
              ),
            ),
          ),
        ));
  }
}
