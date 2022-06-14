import 'dart:io';

import 'package:explora_habitat/services/stores/response_activity_store.dart';
import 'package:explora_habitat/ui/screens/response/widgets/resources/video/video_dialog.dart';
import 'package:explora_habitat/ui/screens/response/widgets/resources/video/video_source_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class VideosField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResponseActivityStore responseActivityStore =
        Provider.of<ResponseActivityStore>(context);

    void onVideoSelected(File? video) {
      if (video != null) {
        responseActivityStore.videos.add(video.path);
      }
      Navigator.pop(context);
    }

    return Column(
      children: [
        const Text(
          "Grave videos para a atividade",
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
              itemCount: responseActivityStore.videos.length < 5
                  ? responseActivityStore.videos.length + 1
                  : 5,
              itemBuilder: (_, index) {
                if (index == responseActivityStore.videos.length) {
                  return responseActivityStore.readOnly
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: GestureDetector(
                            onTap: () {
                              if (Platform.isAndroid) {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (_) =>
                                      VideoSourceModal(onVideoSelected),
                                );
                              } else {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (_) =>
                                      VideoSourceModal(onVideoSelected),
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
                                    Icons.video_call,
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
                          builder: (_) => VideoDialog(
                            video: File(responseActivityStore.videos[index]),
                            readOnly: responseActivityStore.readOnly,
                            onDelete: () =>
                                responseActivityStore.videos.removeAt(index),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 44,
                        backgroundImage: FileImage(
                            File(responseActivityStore.videos[index])),
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
