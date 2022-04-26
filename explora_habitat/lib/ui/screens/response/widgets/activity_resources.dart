import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/ui/screens/response/widgets/resources/image/images_field.dart';
import 'package:flutter/material.dart';

class ActivityResources extends StatelessWidget {
  ActivityType activityType;

  ActivityResources(this.activityType);

  @override
  Widget build(BuildContext context) {
    if (ActivityType.audio == activityType) {
      return Container();
    } else if (ActivityType.drawing == activityType) {
      return Container();
    } else if (ActivityType.photo == activityType) {
      return Container();
    } else if (ActivityType.video == activityType) {
      return ImagesField();
    } else {
      return Container();
    }
  }
}
