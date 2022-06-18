// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_activity_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseActivityStatusAdapter
    extends TypeAdapter<ResponseActivityStatus> {
  @override
  final int typeId = 11;

  @override
  ResponseActivityStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ResponseActivityStatus.pending;
      case 1:
        return ResponseActivityStatus.completed;
      default:
        return ResponseActivityStatus.pending;
    }
  }

  @override
  void write(BinaryWriter writer, ResponseActivityStatus obj) {
    switch (obj) {
      case ResponseActivityStatus.pending:
        writer.writeByte(0);
        break;
      case ResponseActivityStatus.completed:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseActivityStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
