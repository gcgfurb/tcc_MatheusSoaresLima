import 'package:explora_habitat/services/models/activity.dart';
import 'package:flutter/material.dart';

class AcitivityContainerDetails extends StatelessWidget {
  final Activity activity;

  AcitivityContainerDetails(this.activity);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: ActivityTypeExtension.getActivityIcons(activity)
              .map(
                (icon) => Padding(
                  padding: const EdgeInsets.only(top: 8, right: 4, bottom: 8),
                  child: Icon(icon),
                ),
              )
              .toList(),
        ),
        Text(getActivityCustomFieldsText(activity)),
        const SizedBox(height: 10),
      ],
    );
  }

  String getActivityCustomFieldsText(Activity activity) {
    return activity.customFields.length == 1
        ? '1 Pergunta'
        : '${activity.customFields.length} Perguntas';
  }
}
