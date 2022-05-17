import 'package:hive/hive.dart';

part 'field_type.g.dart';

@HiveType(typeId: 9)
enum FieldType {
  @HiveField(0)
  text,

  @HiveField(1)
  number,

  @HiveField(2)
  date,

  @HiveField(3)
  decimal,

  @HiveField(4)
  time,
}

extension FieldTypeExtension on FieldType {
  String getStringValue() {
    switch (this) {
      case FieldType.text:
        return 'Texto';
      case FieldType.number:
        return 'Número';
      case FieldType.date:
        return 'Data';
      case FieldType.decimal:
        return 'Decimal';
      case FieldType.time:
        return 'Hora';
    }
  }

  String getValue() {
    switch (this) {
      case FieldType.text:
        return 'text';
      case FieldType.number:
        return 'number';
      case FieldType.date:
        return 'date';
      case FieldType.decimal:
        return 'decimal';
      case FieldType.time:
        return 'time';
    }
  }

  static FieldType getFromString(String type) {
    switch (type) {
      case 'Texto':
        return FieldType.text;
      case 'Número':
        return FieldType.number;
      case 'Data':
        return FieldType.date;
      case 'Decimal':
        return FieldType.decimal;
      case 'Hora':
        return FieldType.time;
      default:
        throw Exception('Tipo não mapeado');
    }
  }

  static List<String> getStringList() {
    return FieldType.values.map((v) => v.getStringValue()).toList();
  }
}
