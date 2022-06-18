import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/response_theme_store.dart';
import 'package:explora_habitat/services/stores/synced_theme_store.dart';
import 'package:explora_habitat/services/stores/synced_themes_store.dart';
import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/screens/response/response_theme/response_theme_screen.dart';
import 'package:explora_habitat/ui/screens/theme/components/sync_theme_modal.dart';
import 'package:explora_habitat/ui/screens/theme/components/synced_theme_card.dart';
import 'package:explora_habitat/ui/widgets/custom_alert_dialog.dart';
import 'package:explora_habitat/ui/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class ThemeScreen extends StatefulWidget {
  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  final SyncedThemesStore syncedThemesStore = GetIt.I<SyncedThemesStore>();

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => SyncThemeModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    void startTheme(int key, bool readOnly) {
      var theme = syncedThemesStore.syncedThemeBox.get(key)!;
      var clonedTheme = theme.clone(cloneResponse: true);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => ResponseThemeStore(
              theme: clonedTheme,
              key: key,
              readOnly: readOnly,
            ),
            child: ResponseThemeScreen(),
          ),
        ),
      );
    }

    void closeTheme(int key) {
      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Remover tema sincronizado',
          body: const Text(
            'Tem certeza que deseja remover este tema? Respostas não sincronizadas serão descartadas!',
            style: TextStyle(fontSize: 18),
          ),
          onSave: () {
            syncedThemesStore.delete(key);
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
        ),
      );
    }

    void syncTheme(int key) async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Observer(
          builder: (_) => CustomAlertDialog(
            loading: syncedThemesStore.syncing,
            title: 'Sincronizar repostas',
            body: const Text(
              'Tem certeza que deseja sincronizar as respostas deste tema? Após sincronizadas não poderão ser alteradas!',
              style: TextStyle(fontSize: 18),
            ),
            onSave: () {
              syncedThemesStore
                  .sync(key)
                  .then((value) => Navigator.pop(context));
            },
            onCancel: () => Navigator.pop(context),
          ),
        ),
      );
    }
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Temas'),
        centerTitle: true,
        actions: [
          LogoutButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAction(context, 0),
        backgroundColor: Colors.green,
        child: const Icon(Icons.sync),
      ),
      body: ValueListenableBuilder(
        valueListenable: syncedThemesStore.syncedThemeBox.listenable(),
        builder: (context, Box<ThemeExplora> box, widget) {
          if (syncedThemesStore.loading) {
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
                create: (_) => SyncedThemeStore(box.getAt(index)!),
                child: SyncedThemeCard(
                  onStart: () => startTheme(box.keyAt(index)!, false),
                  onSync: () => syncTheme(box.keyAt(index)!),
                  onReadOnly: () => startTheme(box.keyAt(index)!, true),
                  onClose: () => closeTheme(box.keyAt(index)!),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
