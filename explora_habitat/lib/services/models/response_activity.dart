import 'package:explora_habitat/services/enum/response_activity_status.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/models/user.dart';
import 'package:hive/hive.dart';

part 'response_activity.g.dart';

@HiveType(typeId: 10)
class ResponseActivity extends HiveObject {

  @HiveField(0)
  List audios = [];

  @HiveField(1)
  List images = [];

  @HiveField(2)
  List videos = [];

  @HiveField(3)
  List drawings = [];

  @HiveField(4)
  double? latitude;

  @HiveField(5)
  double? longitude;

  @HiveField(6)
  List<CustomField> customFields = [];

  @HiveField(7)
  User? user;

  @HiveField(8)
  String? id;

  @HiveField(9, defaultValue: ResponseActivityStatus.pending)
  ResponseActivityStatus status = ResponseActivityStatus.pending;

  ResponseActivity clone() {
    ResponseActivity responseCloned = ResponseActivity();
    responseCloned.id = id;
    responseCloned.videos = videos;
    responseCloned.images = images;
    responseCloned.audios = audios;
    responseCloned.drawings = drawings;
    responseCloned.user = user;
    responseCloned.id = id;
    responseCloned.latitude = latitude;
    responseCloned.longitude = longitude;
    responseCloned.customFields = customFields
        .map((e) => CustomField(
              type: e.type,
              title: e.title,
              required: e.required,
              value: e.value,
            ))
        .toList();
    return responseCloned;
  }
}
