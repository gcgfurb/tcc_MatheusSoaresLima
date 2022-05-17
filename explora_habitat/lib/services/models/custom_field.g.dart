// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_field.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomFieldAdapter extends TypeAdapter<CustomField> {
  @override
  final int typeId = 8;

  @override
  CustomField read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomField(
      title: fields[0] as String?,
      type: fields[1] as FieldType,
      value: fields[2] as dynamic,
      required: fields[3] == null ? false : fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CustomField obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.required);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomFieldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
