import 'package:explora_habitat/services/models/activity.dart';
import 'package:hive/hive.dart';

part 'objective.g.dart';

@HiveType(typeId: 4)
class Objective extends HiveObject{

  @HiveField(0)
  String? id;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<Activity> activities = [];

  @HiveField(3)
  bool keepOrder;

  Objective({
    this.id,
    required this.title,
    required this.activities,
    this.keepOrder = false,
  });

  Objective clone() {

    List<Activity> clonedActivities = activities.map((activity) => activity.clone()).toList();

    return Objective(
      title: title,
      activities: clonedActivities,
      keepOrder: keepOrder,
    );
  }
}
