import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFieldNumber extends StatelessWidget {
  final CustomField customField;

  const CustomFieldNumber(this.customField);

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      labelText: customField.title,
      errorText: null,
      inputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {},
    );
  }
}
