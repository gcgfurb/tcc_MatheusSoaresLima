// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FieldTypeAdapter extends TypeAdapter<FieldType> {
  @override
  final int typeId = 9;

  @override
  FieldType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FieldType.text;
      case 1:
        return FieldType.number;
      case 2:
        return FieldType.date;
      case 3:
        return FieldType.decimal;
      case 4:
        return FieldType.time;
      default:
        return FieldType.text;
    }
  }

  @override
  void write(BinaryWriter writer, FieldType obj) {
    switch (obj) {
      case FieldType.text:
        writer.writeByte(0);
        break;
      case FieldType.number:
        writer.writeByte(1);
        break;
      case FieldType.date:
        writer.writeByte(2);
        break;
      case FieldType.decimal:
        writer.writeByte(3);
        break;
      case FieldType.time:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FieldTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
