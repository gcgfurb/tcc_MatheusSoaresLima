import 'package:hive/hive.dart';

part 'field_type.g.dart';

@HiveType(typeId: 9)
enum FieldType {

  @HiveField(0)
  text('text', 'Texto'),

  @HiveField(1)
  number('number', 'Número'),

  @HiveField(2)
  date('date', 'Data'),

  @HiveField(3)
  decimal('decimal', 'Decimal'),

  @HiveField(4)
  time('time', 'Hora');

  const FieldType(this.value, this.description);
  final String value;
  final String description;

}

extension FieldTypeExtension on FieldType {

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
    return FieldType.values.map((v) => v.description).toList();
  }
}
