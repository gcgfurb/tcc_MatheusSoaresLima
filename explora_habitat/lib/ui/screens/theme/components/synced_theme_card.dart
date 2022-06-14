import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/enum/theme_status.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/synced_theme_store.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_content_container.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SyncedThemeCard extends StatelessWidget {
  final Function()? onStart;
  final Function()? onSync;
  final Function()? onReadOnly;
  final Function()? onClose;

  SyncedThemeCard({
    required this.onStart,
    required this.onSync,
    required this.onReadOnly,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    SyncedThemeStore syncedThemeStore = Provider.of<SyncedThemeStore>(context);

    bool isThemePending() {
      return syncedThemeStore.theme.objectives.any((objective) => objective
          .activities
          .any((activity) => activity.responsesActivity.isEmpty || activity.responsesActivity.first.id == null));
    }

    Widget _getThemeActions() {
      return Column(
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isThemePending()
                  ? IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.play_arrow_sharp),
                iconSize: 35,
                color: Colors.green,
                onPressed: onStart,
              )
                  : IconButton(
                onPressed: onReadOnly,
                splashRadius: 20,
                icon: const Icon(
                  Icons.visibility,
                  color: Colors.blueGrey,
                ),
              ),
              isThemePending()
                  ? IconButton(
                splashRadius: 20,
                icon: const Icon(Icons.sync),
                color: Colors.green,
                onPressed: onSync,
              )
                  : Container(),
              IconButton(
                onPressed: onClose,
                splashRadius: 20,
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      );
    }

    return Card(
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
              theme: syncedThemeStore.theme,
              actions: Observer(
                builder: (_) => IconButton(
                  icon: syncedThemeStore.isExpanded
                      ? const Icon(Icons.expand_less)
                      : const Icon(Icons.expand_more),
                  onPressed: syncedThemeStore.toggleExpanded,
                ),
              ),
            ),
            Observer(
              builder: (_) => syncedThemeStore.isExpanded
                  ? _getThemeActions()
                  : Container(),
            ),
            const Divider(),
            ThemeContentContainer(
              syncedThemeStore.theme,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isThemePending() ? "Pendente" : "Sincronizado",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}