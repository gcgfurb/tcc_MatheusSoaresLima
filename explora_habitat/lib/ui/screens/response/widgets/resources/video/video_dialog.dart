import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDialog extends StatefulWidget {
  final dynamic video;
  final VoidCallback onDelete;
  final bool readOnly;

  VideoDialog({
    required this.video,
    required this.onDelete,
    this.readOnly = false,
  });

  @override
  State<VideoDialog> createState() => _VideoDialogState();
}

class _VideoDialogState extends State<VideoDialog> {
  late VideoPlayerController _videoPlayerController;

  bool startedPlaying = false;

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();

    startedPlaying = true;
    return true;
  }

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.file(widget.video);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

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
                  FutureBuilder<bool>(
                      future: started(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController),
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                              'Erro ao carregar o vídeo...${snapshot.error}');
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.readOnly
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
                                    widget.onDelete();
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
