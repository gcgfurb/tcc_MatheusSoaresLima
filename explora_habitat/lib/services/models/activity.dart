import 'package:explora_habitat/services/enum/activity_status.dart';
import 'package:explora_habitat/services/enum/activity_type.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/models/response_activity.dart';
import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 5)
class Activity extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<ActivityType> types = [];

  @HiveField(3)
  List<CustomField> customFields = [];

  @HiveField(4)
  ActivityStatus status;

  @HiveField(5)
  ResponseActivity? responseActivity;

  Activity({
    required this.title,
    required this.types,
    required this.customFields,
    this.status = ActivityStatus.pending,
  });

  Activity clone() {
    return Activity(
      title: title,
      types: types,
      customFields: customFields,
    );
  }
}
