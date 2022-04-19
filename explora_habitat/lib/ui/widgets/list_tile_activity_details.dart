import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/ui/widgets/acitivity_container_details.dart';
import 'package:flutter/material.dart';

class ListTileActivityDetails extends StatelessWidget {
  final Activity activity;
  final Function()? onTap;

  ListTileActivityDetails({required this.activity, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(25),
      title: Text(
        activity.title,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: onTap,
      subtitle: AcitivityContainerDetails(activity),
      trailing: const Icon(Icons.drag_handle),
    );
  }
}
