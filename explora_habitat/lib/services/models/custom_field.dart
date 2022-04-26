enum FieldType {
  text,
  number,
  date,
  decimal,
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

class CustomField {
  String? title;
  FieldType type;
  dynamic value;

  CustomField({required this.title, required this.type, this.value});
}
