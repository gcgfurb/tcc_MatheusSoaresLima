import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  final Function(CroppedFile?) onImageSelected;

  ImageSourceModal(this.onImageSelected);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              child: const Text('Câmera'),
              onPressed: getFromCamera,
            ),
            TextButton(
              child: const Text('Galeria'),
              onPressed: getFromGallery,
            ),
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        title: const Text('Selecionar foto para a atividade'),
        message: const Text('Escolha a origem da foto'),
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child: const Text('Câmera'),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child: const Text('Galeria'),
          ),
        ],
      );
    }
  }

  Future<void> getFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageSelected(File(pickedFile.path));
    }
  }

  Future<void> getFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageSelected(File(pickedFile.path));
    }
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper().cropImage(
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Editar imagem',
          toolbarColor: Colors.green,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(
          title: 'Editar imagem',
          cancelButtonTitle: 'Cancelar',
          doneButtonTitle: 'Concluir,',
        ),
      ],
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(
        ratioX: 1,
        ratioY: 1,
      ),
    );
    onImageSelected(croppedFile);
  }
}
