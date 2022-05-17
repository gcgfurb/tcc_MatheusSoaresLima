import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/stores/custom_field_store.dart';
import 'package:explora_habitat/ui/screens/create/create_objective/widgets/custom_dropdown_button_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomFieldSelector extends StatelessWidget {
  final CustomField? customField;
  final Function()? onRemove;

  CustomFieldSelector({required this.customField, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final CustomFieldStore customFieldStore = CustomFieldStore(customField);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Observer(
            builder: (_) => Checkbox(
              value: customFieldStore.required,
              onChanged: (value) {
                customFieldStore.toggleRequired();
                customField!.required = customFieldStore.required;
              },
            ),
          ),
          CustomDropdownButtonFormField(customFieldStore),
          const SizedBox(width: 10),
          Flexible(
            child: TextFormField(
              initialValue: customFieldStore.customField!.title,
              onChanged: customFieldStore.setTitle,
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              onTap: onRemove,
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
    );
  }
}
