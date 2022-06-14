import 'package:explora_habitat/constants/constants_style.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Function()? onSave;
  final Function()? onCancel;
  final Widget body;
  final bool info;
  final bool loading;

  CustomAlertDialog({
    required this.title,
    this.onSave,
    this.onCancel,
    required this.body,
    this.loading = false,
    this.info = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: kRoundedRectangleBorder,
      title: Text(title),
      content: SingleChildScrollView(
        child: body,
      ),
      actions: _getActions(),
    );
  }

  List<Widget> _getActions() {
    return info
        ? [
            TextButton(
              onPressed: loading ? null : onCancel,
              child: const Text(
                'Fechar',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            )
          ]
        : [
            TextButton(
              onPressed: loading ? null : onCancel,
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: loading ? null : onSave,
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text(
                      'Confirmar',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                      ),
                    ),
            )
          ];
  }
}
