enum FieldType {
  text,
  number,
  decimal,
}

extension FieldTypeExtension on FieldType {
  String getStringValue() {
    switch (this) {
      case FieldType.text:
        return 'Texto';
      case FieldType.number:
        return 'Número';
      case FieldType.decimal:
        return 'Decimal';
    }
  }

  static FieldType getFromString(String type) {
    switch (type) {
      case 'Texto':
        return FieldType.text;
      case 'Número' :
        return FieldType.number;
      case 'Decimal':
        return FieldType.decimal;
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
