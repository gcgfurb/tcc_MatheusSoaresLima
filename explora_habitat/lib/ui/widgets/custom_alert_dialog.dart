import 'package:explora_habitat/constants/constants_style.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Function()? onSave;
  final Function()? onCancel;
  final Widget body;

  CustomAlertDialog({
    required this.title,
    this.onSave,
    this.onCancel,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: kRoundedRectangleBorder,
      title: Text(title),
      content: SingleChildScrollView(
        child: body,
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
          ),
          onPressed: onCancel,
        ),
        TextButton(
          child: const Text(
            'Confirmar',
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
            ),
          ),
          onPressed: onSave,
        ),
      ],
    );
  }
}
