import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/stores/activity_store.dart';
import 'package:explora_habitat/services/stores/create_activity_store.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/components/create_activity_modal.dart';
import 'package:explora_habitat/ui/widgets/list_tile_activity_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomReorderableListView extends StatelessWidget {
  final bool readOnly;

  CustomReorderableListView({this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    final CreateActivityStore createActivityStore =
        Provider.of<CreateActivityStore>(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 600),
      child: ReorderableListView.builder(
        itemCount: createActivityStore.activities.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        onReorder: !readOnly ? createActivityStore.reOrder : (x, y) {},
        itemBuilder: (_, index) => Card(
            key: Key('$index'),
            elevation: 8,
            margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            shape: kRoundedRectangleBorder,
            color: Colors.white,
            child: ListTileActivityDetails(
              activity: createActivityStore.activities[index],
              onDelete: !readOnly
                  ? () {
                      createActivityStore.activities.removeAt(index);
                    }
                  : null,
              onTap: () => _showUpdateActivityDialog(
                  context, createActivityStore, index),
            )),
      ),
    );
  }

  void _showUpdateActivityDialog(BuildContext context,
      CreateActivityStore createActivityStore, index) async {
    Activity? activity = await showDialog(
      context: context,
      builder: (_) => Provider(
        create: (_) =>
            ActivityStore(activity: createActivityStore.activities[index]),
        child: CreateActivityModal(
          readOnly: readOnly,
        ),
      ),
    );
    if (activity != null) {
      createActivityStore.activities.removeAt(index);
      createActivityStore.activities.insert(index, activity);
      createActivityStore.objective.activities = createActivityStore.activities;
    }
  }
}
