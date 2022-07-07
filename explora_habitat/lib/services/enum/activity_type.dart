import 'package:explora_habitat/services/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'activity_type.g.dart';

@HiveType(typeId: 7)
enum ActivityType {
  @HiveField(0)
  audio('audio', 'Áudio'),

  @HiveField(1)
  drawing('drawing', 'Desenho'),

  @HiveField(2)
  photo('photo', 'Foto'),

  @HiveField(3)
  video('video', 'Vídeo');

  const ActivityType(this.value, this.description);
  final String value;
  final String description;

}

extension ActivityTypeExtension on ActivityType {

  static ActivityType getFromString(String value) {
    switch (value) {
      case 'Áudio':
        return ActivityType.audio;
      case 'Desenho':
        return ActivityType.drawing;
      case 'Foto':
        return ActivityType.photo;
      case 'Vídeo':
        return ActivityType.video;
      default:
        throw Exception('Tipo não mapeado');
    }
  }

  static List<String> getStringList() {
    return ActivityType.values.map((v) => v.description).toList();
  }

  static List<IconData> getActivityIcons(Activity activity) {
    return activity.types.map((type) => _getIconData(type)).toList();
  }

  static IconData _getIconData(ActivityType type) {
    switch (type) {
      case ActivityType.audio:
        return Icons.audio_file;
      case ActivityType.drawing:
        return Icons.draw_outlined;
      case ActivityType.photo:
        return Icons.camera_alt;
      case ActivityType.video:
        return Icons.video_call;
    }
  }
}
