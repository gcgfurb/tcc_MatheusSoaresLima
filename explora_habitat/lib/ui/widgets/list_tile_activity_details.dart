import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/ui/widgets/acitivity_container_details.dart';
import 'package:flutter/material.dart';

class ListTileActivityDetails extends StatelessWidget {
  final Activity activity;
  final Function()? onTap;
  final Function()? onDelete;

  ListTileActivityDetails({required this.activity, this.onTap, this.onDelete});

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
      trailing: onDelete != null
          ? IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            )
          : const Icon(Icons.drag_handle),
    );
  }
}
