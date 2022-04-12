import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/stores/activity_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CustomOptionSelector extends StatelessWidget {
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
                    CustomDropdownButtonFormField(activityStore, index),
                    const SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        onChanged: activityStore.setTitle,
                        controller: TextEditingController()
                          ..text =
                              activityStore.customFields[index].title ?? '',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () => activityStore.customFields.removeAt(index),
                        child: Ink(
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
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

class CustomDropdownButtonFormField extends StatelessWidget {
  final ActivityStore activityStore;
  final int index;

  const CustomDropdownButtonFormField(this.activityStore, this.index);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DropdownButtonFormField<String>(
        value: activityStore.customFields[index].type.getStringValue(),
        hint: const Text(
          'Tipo',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        onChanged: (String? newValue) {},
        items: FieldTypeExtension.getStringList()
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
