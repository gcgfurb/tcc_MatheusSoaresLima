// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeStatusAdapter extends TypeAdapter<ThemeStatus> {
  @override
  final int typeId = 1;

  @override
  ThemeStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeStatus.pending;
      case 1:
        return ThemeStatus.inProgress;
      case 2:
        return ThemeStatus.completed;
      default:
        return ThemeStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeStatus obj) {
    switch (obj) {
      case ThemeStatus.pending:
        writer.writeByte(0);
        break;
      case ThemeStatus.inProgress:
        writer.writeByte(1);
        break;
      case ThemeStatus.completed:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
