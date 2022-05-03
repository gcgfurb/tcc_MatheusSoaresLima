import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDialog extends StatefulWidget {
  final dynamic video;
  final VoidCallback onDelete;

  VideoDialog({required this.video, required this.onDelete});

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<bool>(
              future: started(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController),
                  );
                } else if (snapshot.hasError) {
                  return Text('Deu erro...${snapshot.error}');
                } else {
                  return const Text('Carregando...');
                }
              }),
          TextButton(
            child: const Text('Excluir'),
            onPressed: () {
              Navigator.pop(context);
              widget.onDelete();
            },
          ),
        ],
      ),
    );
  }
}
