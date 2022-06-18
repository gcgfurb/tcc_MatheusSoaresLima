// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_explora.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeExploraAdapter extends TypeAdapter<ThemeExplora> {
  @override
  final int typeId = 0;

  @override
  ThemeExplora read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeExplora(
      id: fields[0] as String?,
      creator: fields[1] as User?,
      title: fields[2] as String,
      description: fields[3] as String,
      objectives: (fields[4] as List).cast<Objective>(),
      status: fields[5] as ThemeStatus,
      isResponsesSynced: fields[6] == null ? false : fields[6] as bool,
      isResponsesPending: fields[7] == null ? false : fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeExplora obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creator)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.objectives)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.isResponsesSynced)
      ..writeByte(7)
      ..write(obj.isResponsesPending);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeExploraAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
