import 'package:explora_habitat/ui/components/custom_drawer/custom_drawer.dart';
import 'package:explora_habitat/ui/screens/tema/components/expandable_fab.dart';
import 'package:flutter/material.dart';

class TemaScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
