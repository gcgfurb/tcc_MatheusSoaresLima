import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/ui/screens/response/widgets/custom_field/custom_field_date.dart';
import 'package:explora_habitat/ui/screens/response/widgets/custom_field/custom_field_decimal.dart';
import 'package:explora_habitat/ui/screens/response/widgets/custom_field/custom_field_number.dart';
import 'package:explora_habitat/ui/screens/response/widgets/custom_field/custom_field_text.dart';
import 'package:explora_habitat/ui/screens/response/widgets/custom_field/custom_field_time.dart';
import 'package:flutter/material.dart';

class CustomActivityField extends StatelessWidget {
  final CustomField customField;

  CustomActivityField(this.customField);

  @override
  Widget build(BuildContext context) {
    if (FieldType.text == customField.type) {
      return CustomFieldText(customField);
    } else if (FieldType.date == customField.type) {
      return CustomFieldDate(customField);
    } else if (FieldType.time == customField.type) {
      return CustomFieldTime(customField);
    } else if (FieldType.decimal == customField.type) {
      return CustomFieldDecimal(customField);
    } else {
      return CustomFieldNumber(customField);
    }
  }
}
