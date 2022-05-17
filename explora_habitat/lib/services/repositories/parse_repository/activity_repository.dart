import 'dart:convert';

import 'package:explora_habitat/services/enum/activity_type.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/enum/activity_status.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/repositories/parse_repository/parse_errors.dart';
import 'package:explora_habitat/services/repositories/parse_repository/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ActivityRepository {
  Future<void> save(Activity activity, String objectiveId) async {
    final activityObject = ParseObject(keyActivityTable);

    activityObject.set<String>(keyActivityTitle, activity.title);
    activityObject.set<String>(
        keyActivityStatus, activity.status.getValue());
    activityObject.set<String>(
        keyActivityCustomFields, _getFieldJsonList(activity.customFields));
    activityObject.set<String>(
        keyActivityTypes, _getTypesJsonList(activity.types));

    activityObject.set('objective',
        (ParseObject(keyObjectiveTable)..objectId = objectiveId).toPointer());

    var response = await activityObject.save();
    if (response.success) {
      activity.id = response.result.objectId;
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  String _getFieldJsonList(List<CustomField> customFields) {
    return jsonEncode(customFields.map((field) => field..required = false..toJson()).toList());
  }

  String _getTypesJsonList(List<ActivityType> types) {
    return jsonEncode(types.map((type) => type.getValue()).toList());
  }
}
