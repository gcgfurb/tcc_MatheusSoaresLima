import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/create_objective_store.dart';
import 'package:explora_habitat/services/stores/create_tema_store.dart';
import 'package:explora_habitat/services/stores/my_theme_store.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/components/qr_code_modal.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/create_objective_screen.dart';
import 'package:explora_habitat/ui/screens/theme/components/expandable_fab.dart';
import 'package:explora_habitat/ui/screens/theme/components/my_theme_card.dart';
import 'package:explora_habitat/ui/widgets/custom_alert_dialog.dart';
import 'package:explora_habitat/ui/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyThemeScreen extends StatefulWidget {
  static const _actionTitles = ['Sincronizar temas', 'Ler QRCode'];

  @override
  State<MyThemeScreen> createState() => _MyThemeScreenState();
}

class _MyThemeScreenState extends State<MyThemeScreen> {
  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(MyThemeScreen._actionTitles[index]),
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeStore themeStore = GetIt.I<ThemeStore>();

    void editTheme(int index) {
      var theme = themeStore.myThemesBox.get(index)!;

      final CreateThemeStore createThemeStore = CreateThemeStore()
        ..editTheme(
          theme,
          index,
        );
      createThemeStore.editTheme(theme, index);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => CreateObjectiveStore()
              ..setObjectives(theme.objectives
                  .map((objective) => objective.clone())
                  .toList()),
            child: CreateObjetivoScreen(
              createThemeStore: createThemeStore,
            ),
          ),
        ),
      );
    }

    void deleteTheme(int index) {
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
                title: 'Exclusão de tema',
                body: const Text(
                  'Tem certeza que deseja excluir este tema? Essa ação não poderá ser revertida!',
                  style: TextStyle(fontSize: 18),
                ),
                onSave: () {
                  themeStore.delete(index);
                  Navigator.pop(context);
                },
                onCancel: () => Navigator.pop(context),
              ));
    }

    void syncTheme(int index) {
      showDialog(
          context: context,
          builder: (context) => CustomAlertDialog(
                title: 'Sincronização de tema',
                body: const Text(
                  'Tem certeza que deseja sincronizar este tema? Após sincronizado, o tema não poderá ser editado ou excluido!',
                  style: TextStyle(fontSize: 18),
                ),
                onSave: () {
                  themeStore.sync(index);
                  Navigator.pop(context);
                },
                onCancel: () => Navigator.pop(context),
              ));
    }

    void readOnly(int index) {}

    void generateQrCode(int index) {
      var theme = themeStore.myThemesBox.get(index)!;
      showDialog(
        context: context,
        builder: (_) => QrCodeModal(data: theme.id!),
      );
    }

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Meus Temas'),
        centerTitle: true,
        actions: const [
          LogoutButton(),
        ],
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
      body: ValueListenableBuilder(
        valueListenable: themeStore.myThemesBox.listenable(),
        builder: (context, Box<ThemeExplora> box, widget) {
          if (box.isEmpty) {
            return const Center(
              child: Text('Empty'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (_, index) => Provider(
                create: (_) => MyThemeStore(box.getAt(index)!),
                child: MyThemeCard(
                  onDelete: () => deleteTheme(box.keyAt(index)!),
                  onCopy: () => themeStore.copy(box.keyAt(index)!),
                  onEdit: () => editTheme(box.keyAt(index)!),
                  onSync: () => syncTheme(box.keyAt(index)!),
                  onQrCode: () => generateQrCode(box.keyAt(index)!),
                  onReadOnly: () => readOnly(box.keyAt(index)!),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
