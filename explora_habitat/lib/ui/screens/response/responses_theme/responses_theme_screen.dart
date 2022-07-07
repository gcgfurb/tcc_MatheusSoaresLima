import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/response_theme_store.dart';
import 'package:explora_habitat/services/stores/responses_theme_store.dart';
import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/screens/response/response_theme/response_theme_screen.dart';
import 'package:explora_habitat/ui/screens/response/widgets/response_theme_card.dart';
import 'package:explora_habitat/ui/widgets/custom_alert_dialog.dart';
import 'package:explora_habitat/ui/widgets/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class ResponsesThemeScreen extends StatelessWidget {
  final ResponsesThemeStore responsesThemeStore =
      GetIt.I<ResponsesThemeStore>();

  @override
  Widget build(BuildContext context) {
    void checkError() {
      if (responsesThemeStore.error != null) {
        final snackBar = SnackBar(
          content: Text(
            responsesThemeStore.error!,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    void _syncResponses() async {
      await showDialog<void>(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Sincronizar respostas',
          body: const Text(
            'Deseja buscar os temas finalizados? Após realizado esta operação, irá retornar todos os temas criados por você e que foram finalizados',
            style: TextStyle(fontSize: 18),
          ),
          onSave: () {
            responsesThemeStore.syncThemes().then((value) => checkError());
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
        ),
      );
    }

    void openResponse(int key) {
      var theme = responsesThemeStore.completedThemesBox.get(key)!;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Provider(
            create: (_) => ResponseThemeStore(
              theme: theme,
              key: key,
              readOnly: true,
              completed: true,
            ),
            child: ResponseThemeScreen(),
          ),
        ),
      );
    }

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
            responsesThemeStore.delete(index);
            Navigator.pop(context);
          },
          onCancel: () => Navigator.pop(context),
        ),
      );
    }

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Respostas'),
        centerTitle: true,
        actions: [
          LogoutButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _syncResponses(),
        backgroundColor: Colors.green,
        child: const Icon(Icons.sync),
      ),
      body: ValueListenableBuilder(
        valueListenable: responsesThemeStore.completedThemesBox.listenable(),
        builder: (context, Box<ThemeExplora> box, widget) {
          if (responsesThemeStore.loading) {
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
                create: (_) => ResponseThemeStore(
                    theme: box.getAt(index)!, key: box.keyAt(index)!),
                child: ResponseThemeCard(
                  onOpenResponse: () => openResponse(box.keyAt(index)!),
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
