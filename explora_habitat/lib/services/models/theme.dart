import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/models/user.dart';

enum ThemeStatus {
  pending,
  inProgress,
  completed,
}

class ThemeExplora {
  String? id;
  User? creator;
  String title;
  String description;
  List<Objective> objectives = [];
  ThemeStatus status;

  ThemeExplora({
    this.id,
    this.creator,
    required this.title,
    required this.description,
    required this.objectives,
    this.status = ThemeStatus.pending,
  });
}
