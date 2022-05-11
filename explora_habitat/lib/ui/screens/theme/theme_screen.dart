import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/models/theme.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/screens/response/response_theme/response_theme_screen.dart';
import 'package:explora_habitat/ui/screens/theme/components/expandable_fab.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_content_container.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ThemeScreen extends StatelessWidget {
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

  String _getObjectiveText(ThemeExplora theme) {
    return theme.objectives.length == 1
        ? '1 Objetivo'
        : '${theme.objectives.length} Objetivos';
  }

  String _getActivityText(ThemeExplora theme) {
    final int activitiesSize = theme.objectives
        .map((Objective objective) => objective.activities.length)
        .fold(0, (num1, num2) => num1 + num2);

    return activitiesSize == 1 ? '1 Atividade' : '$activitiesSize Atividades';
  }

  @override
  Widget build(BuildContext context) {
    final ThemeStore themeStore = GetIt.I<ThemeStore>();

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Temas'),
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
      body: ListView.builder(
        itemCount: themeStore.themes.length,
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
                  theme: themeStore.themes[index],
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
                          theme: themeStore.themes[index],
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(),
                ThemeContentContainer(
                  themeStore.themes[index],
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
      ),
    );
  }
}
