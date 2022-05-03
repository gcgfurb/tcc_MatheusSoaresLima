import 'package:explora_habitat/services/models/activity.dart';
import 'package:flutter/material.dart';

class PositionAcitivityDetails extends StatelessWidget {
  Activity activity;

  PositionAcitivityDetails(this.activity);

  @override
  Widget build(BuildContext context) {
    if (activity.responseActivity != null &&
        activity.responseActivity!.latitude != null &&
        activity.responseActivity!.longitude != null) {
      return Column(
        children: [
          Text(activity.responseActivity!.latitude!.toStringAsFixed(8)),
          Text(activity.responseActivity!.longitude!.toStringAsFixed(8))
        ],
      );
    } else {
      return Container();
    }
  }
}
