import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/stores/my_theme_store.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_content_container.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyThemeCard extends StatelessWidget {
  final Function()? onDelete;
  final Function()? onEdit;
  final Function()? onSync;
  final Function()? onCopy;

  MyThemeCard({
    required this.onDelete,
    required this.onEdit,
    required this.onCopy,
    required this.onSync,
  });

  @override
  Widget build(BuildContext context) {
    MyThemeStore myThemeStore = Provider.of<MyThemeStore>(context);

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
              theme: myThemeStore.theme,
              actions: SizedBox(
                height: 120,
                width: 120,
                child: _getThemeActions(myThemeStore),
              ),
            ),
            const Divider(),
            ThemeContentContainer(
              myThemeStore.theme,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  myThemeStore.theme.id == null
                      ? 'Não sincronizado'
                      : 'Sincronizado',
                  style: const TextStyle(
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
    );
  }

  Widget _getThemeActions(MyThemeStore myThemeStore) {
    return SizedBox(
      height: 120,
      width: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          myThemeStore.theme.id == null
              ? IconButton(
                  onPressed: onEdit,
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.edit,
                    color: darkerGreen,
                  ),
                )
              : Container(),
          myThemeStore.theme.id == null
              ? IconButton(
                  onPressed: onDelete,
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              : Container(),
          myThemeStore.theme.id == null
              ? IconButton(
                  onPressed: onSync,
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.sync,
                    color: Colors.orange,
                  ),
                )
              : Container(),
          IconButton(
            onPressed: onCopy,
            splashRadius: 20,
            icon: const Icon(
              Icons.copy,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
