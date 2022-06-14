import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/enum/theme_status.dart';
import 'package:explora_habitat/services/stores/my_theme_store.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_content_container.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyThemeCard extends StatelessWidget {
  final Function()? onDelete;
  final Function()? onEdit;
  final Function()? onSync;
  final Function()? onCopy;
  final Function()? onQrCode;
  final Function()? onReadOnly;
  final Function()? onClose;
  final Function()? onFinish;

  MyThemeCard({
    Key? key,
    required this.onDelete,
    required this.onEdit,
    required this.onCopy,
    required this.onSync,
    required this.onQrCode,
    required this.onReadOnly,
    required this.onClose,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyThemeStore myThemeStore = Provider.of<MyThemeStore>(context);

    return Card(
      key: key,
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
              actions: Observer(
                builder: (_) => IconButton(
                  icon: myThemeStore.isExpanded
                      ? const Icon(Icons.expand_less)
                      : const Icon(Icons.expand_more),
                  onPressed: myThemeStore.toggleExpanded,
                ),
              ),
            ),
            Observer(
              builder: (_) => myThemeStore.isExpanded
                  ? _getThemeActions(myThemeStore)
                  : Container(),
            ),
            const Divider(),
            ThemeContentContainer(
              myThemeStore.theme,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observer(
                  builder: (_) => myThemeStore.theme.id == null
                      ? const Text(
                          'Não sincronizado',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : myThemeStore.theme.status == ThemeStatus.completed
                          ? const Text(
                              'Finalizado',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : SelectableText(
                              myThemeStore.theme.id!,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
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
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
            myThemeStore.theme.id != null
                ? IconButton(
                    onPressed: onReadOnly,
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.blueGrey,
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
            myThemeStore.theme.id != null &&
                    myThemeStore.theme.status != ThemeStatus.completed
                ? IconButton(
                    onPressed: onQrCode,
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.qr_code,
                      color: Colors.black,
                    ),
                  )
                : Container(),
            myThemeStore.theme.id != null &&
                    myThemeStore.theme.status != ThemeStatus.completed
                ? IconButton(
                    onPressed: onFinish,
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.pin_end,
                      color: Colors.red,
                    ),
                  )
                : Container(),
            myThemeStore.theme.id != null
                ? IconButton(
                    onPressed: onClose,
                    splashRadius: 20,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
