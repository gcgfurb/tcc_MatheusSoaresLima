import 'dart:io';

import 'package:explora_habitat/services/stores/response_activity_store.dart';
import 'package:explora_habitat/ui/screens/response/widgets/resources/image/image_dialog.dart';
import 'package:explora_habitat/ui/screens/response/widgets/resources/image/image_source_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';

class ImagesField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResponseActivityStore responseActivityStore =
        Provider.of<ResponseActivityStore>(context);

    void onImageSelected(CroppedFile? image) {
      if (image != null) {
        responseActivityStore.images.add(image.path);
      }

      Navigator.pop(context);
    }

    return Column(
      children: [
        const Text(
          "Tire fotos para a atividade",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          color: Colors.grey[200],
          height: 120,
          child: Observer(
            builder: (_) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: responseActivityStore.images.length < 5
                  ? responseActivityStore.images.length + 1
                  : 5,
              itemBuilder: (_, index) {
                if (index == responseActivityStore.images.length) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: GestureDetector(
                      onTap: () {
                        if (Platform.isAndroid) {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => ImageSourceModal(onImageSelected),
                          );
                        } else {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (_) => ImageSourceModal(onImageSelected),
                          );
                        }
                      },
                      child: CircleAvatar(
                        radius: 44,
                        backgroundColor: Colors.grey[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding:
                        EdgeInsets.fromLTRB(8, 16, index == 4 ? 16 : 0, 16),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => ImageDialog(
                            image: File(responseActivityStore.images[index]),
                            onDelete: () =>
                                responseActivityStore.images.removeAt(index),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 44,
                        backgroundImage: FileImage(
                            File(responseActivityStore.images[index])),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
