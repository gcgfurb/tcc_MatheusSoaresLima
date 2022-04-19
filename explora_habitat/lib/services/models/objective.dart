import 'package:explora_habitat/services/models/activity.dart';

class Objective {
  String title;
  List<Activity> activities = [];

  Objective({required this.title, required this.activities});
}
