// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityTypeAdapter extends TypeAdapter<ActivityType> {
  @override
  final int typeId = 7;

  @override
  ActivityType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActivityType.audio;
      case 1:
        return ActivityType.drawing;
      case 2:
        return ActivityType.photo;
      case 3:
        return ActivityType.video;
      default:
        return ActivityType.audio;
    }
  }

  @override
  void write(BinaryWriter writer, ActivityType obj) {
    switch (obj) {
      case ActivityType.audio:
        writer.writeByte(0);
        break;
      case ActivityType.drawing:
        writer.writeByte(1);
        break;
      case ActivityType.photo:
        writer.writeByte(2);
        break;
      case ActivityType.video:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
