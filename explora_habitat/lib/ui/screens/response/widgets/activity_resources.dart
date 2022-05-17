import 'package:explora_habitat/services/enum/activity_type.dart';
import 'package:explora_habitat/ui/screens/response/widgets/resources/image/images_field.dart';
import 'package:explora_habitat/ui/screens/response/widgets/resources/video/videos_field.dart';
import 'package:flutter/material.dart';

class ActivityResources extends StatelessWidget {
  ActivityType activityType;

  ActivityResources(this.activityType);

  @override
  Widget build(BuildContext context) {
    if (ActivityType.audio == activityType) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(),
      );
    } else if (ActivityType.drawing == activityType) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(),
      );
    } else if (ActivityType.photo == activityType) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ImagesField(),
      );
    } else if (ActivityType.video == activityType) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: VideosField(),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(),
      );
    }
  }
}
