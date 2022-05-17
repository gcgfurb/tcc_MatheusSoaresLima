// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityStatusAdapter extends TypeAdapter<ActivityStatus> {
  @override
  final int typeId = 6;

  @override
  ActivityStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ActivityStatus.pending;
      case 1:
        return ActivityStatus.completed;
      default:
        return ActivityStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, ActivityStatus obj) {
    switch (obj) {
      case ActivityStatus.pending:
        writer.writeByte(0);
        break;
      case ActivityStatus.completed:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
