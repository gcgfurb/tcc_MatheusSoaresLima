import 'package:explora_habitat/services/enum/activity_status.dart';
import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/repositories/parse_repository/activity_repository.dart';
import 'package:explora_habitat/services/repositories/parse_repository/parse_errors.dart';
import 'package:explora_habitat/services/repositories/parse_repository/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ObjectiveRepository {
  Future<void> save(Objective objective, String themeId) async {
    final objectiveObject = ParseObject(keyObjectiveTable);

    objectiveObject.set<String>(keyObjectiveTitle, objective.title);
    objectiveObject.set<bool>(keyObjectiveKeepOrder, objective.keepOrder);
    objectiveObject.set(
        'theme', (ParseObject(keyThemeTable)..objectId = themeId).toPointer());

    var response = await objectiveObject.save();
    if (response.success) {
      objective.id = response.result.objectId;
      objective.activities.first.status = ActivityStatus.pending;
      for (var activity in objective.activities) {
        await ActivityRepository().save(activity, objective.id!);
      }
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
