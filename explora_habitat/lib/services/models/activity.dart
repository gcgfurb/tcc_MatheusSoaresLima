import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/models/response_activity.dart';
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

enum ActivityStatus {
  pending,
  completed,
}

class Activity {
  String title;
  List<ActivityType> types = [];
  List<CustomField> customFields = [];
  ActivityStatus activityStatus;
  ResponseActivity? responseActivity;

  Activity({
    required this.title,
    required this.types,
    required this.customFields,
    this.activityStatus = ActivityStatus.pending,
  });

  Activity clone() {
    return Activity(
      title: title,
      types: types,
      customFields: customFields,
    );
  }
}
