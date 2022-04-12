import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:mobx/mobx.dart';
import 'package:explora_habitat/services/models/activity.dart';

part 'activity_store.g.dart';

class ActivityStore = _ActivityStore with _$ActivityStore;

abstract class _ActivityStore with Store {
  _ActivityStore({required this.activity, this.editing = false});

  @observable
  Activity? activity;

  @action
  void setActivity(Activity activity) => activity = activity;

  @observable
  bool editing;

  @observable
  String? title;

  @action
  void setTitle(String value) => title = value;

  ObservableList<CustomField> customFields = ObservableList();

  @action
  void setCustomFieldTitle(String? value, int index) =>
      customFields[index].title = value;

  @action
  void setCustomFieldTye(String type, int index) =>
      customFields[index].type = FieldTypeExtension.getFromString(type);

  ObservableList<ActivityType> types = ObservableList();

  @action
  bool isSelected(String value) {
    final ActivityType activityType =
        ActivityTypeExtension.getFromString(value);
    return types.contains(activityType);
  }

  @action
  void addActivityType(String value, bool selected) {
    final ActivityType activityType =
        ActivityTypeExtension.getFromString(value);
    if (selected) {
      types.add(activityType);
    } else {
      types.remove(activityType);
    }
  }
}
