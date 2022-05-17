// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObjectiveAdapter extends TypeAdapter<Objective> {
  @override
  final int typeId = 4;

  @override
  Objective read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Objective(
      title: fields[1] as String,
      activities: (fields[2] as List).cast<Activity>(),
      keepOrder: fields[3] as bool,
    )..id = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Objective obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.activities)
      ..writeByte(3)
      ..write(obj.keepOrder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjectiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
