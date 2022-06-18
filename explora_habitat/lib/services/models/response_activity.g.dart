// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseActivityAdapter extends TypeAdapter<ResponseActivity> {
  @override
  final int typeId = 10;

  @override
  ResponseActivity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseActivity()
      ..audios = (fields[0] as List).cast<dynamic>()
      ..images = (fields[1] as List).cast<dynamic>()
      ..videos = (fields[2] as List).cast<dynamic>()
      ..drawings = (fields[3] as List).cast<dynamic>()
      ..latitude = fields[4] as double?
      ..longitude = fields[5] as double?
      ..customFields = (fields[6] as List).cast<CustomField>()
      ..user = fields[7] as User?
      ..id = fields[8] as String?
      ..status = fields[9] == null
          ? ResponseActivityStatus.pending
          : fields[9] as ResponseActivityStatus;
  }

  @override
  void write(BinaryWriter writer, ResponseActivity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.audios)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.videos)
      ..writeByte(3)
      ..write(obj.drawings)
      ..writeByte(4)
      ..write(obj.latitude)
      ..writeByte(5)
      ..write(obj.longitude)
      ..writeByte(6)
      ..write(obj.customFields)
      ..writeByte(7)
      ..write(obj.user)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
