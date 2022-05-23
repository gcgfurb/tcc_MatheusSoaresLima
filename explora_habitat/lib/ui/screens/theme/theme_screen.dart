import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/synced_theme_store.dart';
import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/screens/response/response_theme/response_theme_screen.dart';
import 'package:explora_habitat/ui/screens/theme/components/sync_theme_modal.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_content_container.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_details_tile.dart';
import 'package:explora_habitat/ui/widgets/logout_button.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class ThemeScreen extends StatelessWidget {
  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => SyncThemeModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SyncedThemeStore syncedThemeStore = GetIt.I<SyncedThemeStore>();

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Temas'),
        centerTitle: true,
        actions: const [
          LogoutButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAction(context, 0),
        backgroundColor: Colors.green,
        child: const Icon(Icons.sync),
      ),
      body: ValueListenableBuilder(
        valueListenable: syncedThemeStore.syncedThemeBox.listenable(),
        builder: (context, Box<ThemeExplora> box, widget) {
          if (box.isEmpty) {
            return Container();
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (_, index) => Card(
                elevation: 8,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                clipBehavior: Clip.antiAlias,
                shape: kRoundedRectangleBorder,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThemeDetailsTile(
                        theme: box.getAt(index)!,
                        actions: IconButton(
                          padding: const EdgeInsets.all(0),
                          splashRadius: 30,
                          icon: const Icon(Icons.play_arrow_sharp),
                          iconSize: 50,
                          color: Colors.green,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResponseThemeScreen(
                                theme: box.getAt(index)!,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      ThemeContentContainer(
                        box.getAt(index)!,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Não Iniciado',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
