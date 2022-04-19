import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/stores/activity_store.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/widgets/custom_field_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CustomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ActivityStore activityStore = Provider.of<ActivityStore>(context);

    return Column(
      children: [
        Observer(
          builder: (_) => ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 250),
            child: ListView.builder(
              itemCount: activityStore.customFields.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: CustomFieldSelector(
                        customField: activityStore.customFields[index],
                        onRemove: () =>
                            activityStore.customFields.removeAt(index),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Observer(
          builder: (_) => InkWell(
            onTap: () => activityStore.customFields.add(CustomField(
              title: '',
              type: FieldType.text,
            )),
            child: Ink(
              child: const Icon(
                Icons.add_circle,
                color: Colors.teal,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
