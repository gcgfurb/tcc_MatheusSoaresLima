import 'package:explora_habitat/services/models/custom_field.dart';

enum ActivityType {
  audio,
  datetime,
  drawing,
  photo,
  video,
}

extension ActivityTypeExtension on ActivityType {
  String getStringValue() {
    switch (this) {
      case ActivityType.audio:
        return 'Áudio';
      case ActivityType.datetime:
        return 'Data';
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
      case 'Data':
        return ActivityType.datetime;
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
