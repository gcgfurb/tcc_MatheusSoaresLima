import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/stores/custom_field_store.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final CustomFieldStore customFieldStore;

  CustomDropdownButtonFormField(this.customFieldStore);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DropdownButtonFormField<String>(
        value: customFieldStore.customField!.type.getStringValue(),
        hint: const Text(
          'Tipo',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          if (value != null) {
            customFieldStore
                .setFieldType(FieldTypeExtension.getFromString(value));
          }
        },
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
