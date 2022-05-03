import 'package:explora_habitat/services/models/activity.dart';

class Objective {
  String title;
  List<Activity> activities = [];
  bool keepOrder;

  Objective({required this.title, required this.activities, this.keepOrder = false});
}
