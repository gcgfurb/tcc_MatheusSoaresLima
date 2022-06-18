import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/create_objective_store.dart';
import 'package:explora_habitat/services/stores/create_tema_store.dart';
import 'package:explora_habitat/services/stores/my_theme_store.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/components/qr_code_modal.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/create_objective_screen.dart';
import 'package:explora_habitat/ui/screens/theme/components/my_theme_card.dart';
import 'package:explora_habitat/ui/widgets/custom_alert_dialog.dart';
import 'package:explora_habitat/ui/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class MyThemeScreen extends StatefulWidget {
  @override
  State<MyThemeScreen> createState() => _MyThemeScreenState();
}

class _MyThemeScreenState extends State<MyThemeScreen> {
  final ThemeStore themeStore = GetIt.I<ThemeStore>();

  @override
  Widget build(BuildContext context) {
    void closeTheme(int index) {
      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Remover tema sincronizado',
          body: const Text(
            'Tem certeza que deseja remover este tema? Será necessário realizar uma nova sincronização para obter o tema novamente!',
            style: TextStyle(fontSize: 18),
          ),
          onSave: () {
            themeStore.delete(index);
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
        ),
      );
    }

    void openTheme(int index, bool readOnly) {
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
              readOnly: readOnly,
            ),
          ),
        ),
      );
    }

    void _syncThemes(BuildContext context) {
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => CustomAlertDialog(
          title: 'Buscar temas sincronizados',
          body: const Text(
            'Ao realizar este processo temas não sincronizados serão descartados. Tem certeza que deseja prosseguir?',
            style: TextStyle(fontSize: 18),
          ),
          onSave: () {
            themeStore.syncThemes();
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
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
          onSave: () async {
            themeStore.delete(index);
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
        ),
      );
    }

    void finishTheme(int index) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Observer(
          builder: (_) => CustomAlertDialog(
            loading: themeStore.syncing,
            title: 'Finalizar tema',
            body: const Text(
              'Tem certeza que deseja finalizar o envio de respostas para este tema? Após finalizado nenhum clubista poderá realizar o envio!',
              style: TextStyle(fontSize: 18),
            ),
            onSave: () async {
              themeStore.finish(index);
              Navigator.pop(context);
            },
            onCancel: () => Navigator.pop(context),
          ),
        ),
      );
    }

    void syncTheme(int index) async {
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Observer(
          builder: (_) => CustomAlertDialog(
            loading: themeStore.syncing,
            title: 'Sincronização de tema',
            body: const Text(
              'Tem certeza que deseja sincronizar este tema? Após sincronizado, o tema não poderá ser editado ou excluido!',
              style: TextStyle(fontSize: 18),
            ),
            onSave: () {
              themeStore.sync(index).then((value) => Navigator.pop(context));
            },
            onCancel: () => Navigator.pop(context),
          ),
        ),
      );
    }

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
        actions: [
          LogoutButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _syncThemes(context),
        backgroundColor: Colors.green,
        child: const Icon(Icons.sync),
      ),
      body: ValueListenableBuilder(
        valueListenable: themeStore.myThemesBox.listenable(),
        builder: (context, Box<ThemeExplora> box, widget) {
          if (themeStore.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (box.isEmpty) {
            return Container();
          } else {
            return ListView.builder(
              key: Key(box.length.toString()),
              itemCount: box.length,
              itemBuilder: (_, index) => Provider(
                create: (_) => MyThemeStore(box.getAt(index)!),
                child: MyThemeCard(
                  onDelete: () => deleteTheme(box.keyAt(index)!),
                  onCopy: () => themeStore.copy(box.keyAt(index)!),
                  onEdit: () => openTheme(box.keyAt(index)!, false),
                  onSync: () => syncTheme(box.keyAt(index)!),
                  onQrCode: () => generateQrCode(box.keyAt(index)!),
                  onReadOnly: () => openTheme(box.keyAt(index)!, true),
                  onClose: () => closeTheme(box.keyAt(index)!),
                  onFinish: () => finishTheme(box.keyAt(index)!),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
