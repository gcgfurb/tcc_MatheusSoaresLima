import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/models/user.dart';
import 'package:hive/hive.dart';

import '../enum/theme_status.dart';

part 'theme_explora.g.dart';

@HiveType(typeId: 0)
class ThemeExplora extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  User? creator;

  @HiveField(2)
  String title;

  @HiveField(3)
  String description;

  @HiveField(4)
  List<Objective> objectives = [];

  @HiveField(5)
  ThemeStatus status;

  ThemeExplora({
    this.id,
    this.creator,
    required this.title,
    required this.description,
    required this.objectives,
    this.status = ThemeStatus.pending,
  });

  ThemeExplora clone() {
    List<Objective> clonedObjectives =
        objectives.map((objective) => objective.clone()).toList();

    return ThemeExplora(
      title: '$title - #Cópia',
      description: description,
      objectives: clonedObjectives,
      creator: creator,
    );
  }
}
