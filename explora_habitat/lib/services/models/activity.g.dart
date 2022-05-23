// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityAdapter extends TypeAdapter<Activity> {
  @override
  final int typeId = 5;

  @override
  Activity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Activity(
      id: fields[0] as String?,
      title: fields[1] as String,
      types: (fields[2] as List).cast<ActivityType>(),
      customFields: (fields[3] as List).cast<CustomField>(),
      status: fields[4] as ActivityStatus,
    )..responseActivity = fields[5] as ResponseActivity?;
  }

  @override
  void write(BinaryWriter writer, Activity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.types)
      ..writeByte(3)
      ..write(obj.customFields)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.responseActivity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
