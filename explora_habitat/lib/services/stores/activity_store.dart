import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:mobx/mobx.dart';
import 'package:explora_habitat/services/models/activity.dart';

part 'activity_store.g.dart';

class ActivityStore = _ActivityStore with _$ActivityStore;

abstract class _ActivityStore with Store {
  _ActivityStore({required this.activity, this.editing = false}) {
    if (activity != null) {
      title = activity!.title;
      customFields = ObservableList.of(activity!.customFields);
    }
    types = ObservableList.of(ActivityType.values
        .map((type) => AcitivityTypeChip(
              activityType: type,
              isSelected:
                  activity != null ? activity!.types.contains(type) : false,
            ))
        .toList());
  }

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

  ObservableList<AcitivityTypeChip> types = ObservableList();

  @action
  void selectAcitivyType(int index) {
    final selectedType = AcitivityTypeChip(
      activityType: types[index].activityType,
      isSelected: !types[index].isSelected,
    );
    types[index] = selectedType;
  }

  Activity createActivity() {
    final fields = customFields.toList();
    final activityTypes = types
        .where((type) => type.isSelected)
        .map((type) => type.activityType)
        .toList();

    return Activity(
      title: title!,
      customFields: fields,
      types: activityTypes,
    );
  }
}

class AcitivityTypeChip {
  ActivityType activityType;
  bool isSelected;

  AcitivityTypeChip({
    required this.activityType,
    this.isSelected = false,
  });
}
