import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class CustomFieldText extends StatelessWidget {
  final CustomField customField;

  CustomFieldText(this.customField);

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      labelText: customField.title,
      errorText: null,
      inputType: TextInputType.text,
      onChanged: (value) => customField.value = value,
      initialValue: customField.value,
    );
  }
}
