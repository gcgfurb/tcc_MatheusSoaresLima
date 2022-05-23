import 'dart:convert';

import 'package:explora_habitat/services/enum/activity_type.dart';
import 'package:explora_habitat/services/enum/field_type.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/repositories/parse_repository/parse_errors.dart';
import 'package:explora_habitat/services/repositories/parse_repository/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ActivityRepository {
  Future<void> save(Activity activity, String objectiveId) async {
    final activityObject = ParseObject(keyActivityTable);

    activityObject.set<String>(keyActivityTitle, activity.title);
    activityObject.set<String>(keyActivityStatus, activity.status.value);
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
    return jsonEncode(customFields.map((field) => field.toJson()).toList());
  }

  String _getTypesJsonList(List<ActivityType> types) {
    return jsonEncode(types.map((type) => type.value).toList());
  }

  Future<List<Activity>> findAllByObjective(ParseObject objectiveObject) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyActivityTable))
          ..whereEqualTo('objective', objectiveObject.toPointer());

    ParseResponse response = await queryBuilder.query();

    if (response.success) {
      return response.results!
          .map((result) => mapParseToActivity(result))
          .toList();
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Activity mapParseToActivity(ParseObject parseObject) {
    return Activity(
      id: parseObject.objectId!,
      title: parseObject.get<String>(keyActivityTitle)!,
      types: convertTypes(parseObject.get<String>(keyActivityTypes)),
      customFields:
          convertCustomField(parseObject.get<String>(keyActivityCustomFields)),
    );
  }

  List<CustomField> convertCustomField(String? fields) {
    if (fields == null) {
      return [];
    }
    return List.from(jsonDecode(fields).map(
      (json) => CustomField(
        title: json['title'],
        type: FieldType.values
            .firstWhere((element) => element.value == json['type']),
        value: json['value'],
        required: json['required'],
      ),
    ));
  }

  List<ActivityType> convertTypes(String? types) {
    if (types == null) {
      return [];
    }
    return List.from(jsonDecode(types).map((type) =>
        ActivityType.values.firstWhere((element) => element.value == type)));
  }
}
