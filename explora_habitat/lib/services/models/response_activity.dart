import 'package:explora_habitat/services/models/custom_field.dart';
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
}
