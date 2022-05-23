import 'package:hive/hive.dart';
import 'package:explora_habitat/services/enum/field_type.dart';

part 'custom_field.g.dart';

@HiveType(typeId: 8)
class CustomField extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  FieldType type;

  @HiveField(2)
  dynamic value;

  @HiveField(3, defaultValue: false)
  bool required;

  CustomField({
    required this.title,
    required this.type,
    this.value,
    this.required = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type.value,
      'value': value,
      'required': required,
    };
  }
}
