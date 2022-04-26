import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:flutter/material.dart';

enum ActivityType {
  audio,
  drawing,
  photo,
  video,
}

extension ActivityTypeExtension on ActivityType {
  String getStringValue() {
    switch (this) {
      case ActivityType.audio:
        return 'Áudio';
      case ActivityType.drawing:
        return 'Desenho';
      case ActivityType.photo:
        return 'Foto';
      case ActivityType.video:
        return 'Vídeo';
    }
  }

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
    return ActivityType.values.map((v) => v.getStringValue()).toList();
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

class Activity {
  String title;
  List<ActivityType> types = [];
  List<CustomField> customFields = [];

  Activity({
    required this.title,
    required this.types,
    required this.customFields,
  });
}
