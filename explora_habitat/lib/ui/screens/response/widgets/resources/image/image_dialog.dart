import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final dynamic image;
  final VoidCallback onDelete;
  final bool readOnly;

  ImageDialog({
    required this.image,
    required this.onDelete,
    this.readOnly = false,
  });

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
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.file(image),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      readOnly
                          ? Container()
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, right: 15),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Colors.greenAccent.withAlpha(120),
                                child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    onDelete();
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.greenAccent.withAlpha(120),
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            color: darkerGreen,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
