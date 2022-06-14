import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/stores/response_theme_store.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_content_container.dart';
import 'package:explora_habitat/ui/screens/theme/widgets/theme_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ResponseThemeCard extends StatelessWidget {
  final Function()? onOpenResponse;
  final Function()? onClose;

  ResponseThemeCard({
    required this.onOpenResponse,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    ResponseThemeStore responseThemeStore =
        Provider.of<ResponseThemeStore>(context);

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
              theme: responseThemeStore.theme,
              actions: Observer(
                builder: (_) => IconButton(
                  icon: responseThemeStore.isExpanded
                      ? const Icon(Icons.expand_less)
                      : const Icon(Icons.expand_more),
                  onPressed: responseThemeStore.toggleExpanded,
                ),
              ),
            ),
            Observer(
              builder: (_) => responseThemeStore.isExpanded
                  ? _getThemeActions()
                  : Container(),
            ),
            const Divider(),
            ThemeContentContainer(
              responseThemeStore.theme,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Finalizado',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getThemeActions() {
    return Column(
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.question_answer),
              color: Colors.green,
              onPressed: onOpenResponse,
            ),
            IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.close),
              color: Colors.red,
              onPressed: onClose,
            ),
          ],
        ),
      ],
    );
  }
}
