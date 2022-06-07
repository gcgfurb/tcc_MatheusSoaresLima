import 'package:explora_habitat/services/models/activity.dart';
import 'package:flutter/material.dart';

class PositionAcitivityDetails extends StatelessWidget {
  Activity activity;

  PositionAcitivityDetails(this.activity);

  @override
  Widget build(BuildContext context) {
    if (activity.responsesActivity.isNotEmpty &&
        activity.responsesActivity.first.latitude != null &&
        activity.responsesActivity.first.longitude != null) {
      return Column(
        children: [
          Text(activity.responsesActivity.first.latitude!.toStringAsFixed(8)),
          Text(activity.responsesActivity.first.longitude!.toStringAsFixed(8))
        ],
      );
    } else {
      return Container();
    }
  }
}
