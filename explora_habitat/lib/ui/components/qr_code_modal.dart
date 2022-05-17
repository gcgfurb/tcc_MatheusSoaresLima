import 'package:explora_habitat/constants/constants_style.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeModal extends StatelessWidget {
  final String data;

  QrCodeModal({required this.data});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: kRoundedRectangleBorder,
      elevation: 8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Colors.lightGreen,
              ),
              child: const Text(
                'QrCode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: QrImage(
                data: data,
                version: QrVersions.auto,
                size: 300.0,
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.greenAccent.withAlpha(120),
              child: IconButton(
                icon: const Icon(Icons.close),
                color: Colors.black,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
