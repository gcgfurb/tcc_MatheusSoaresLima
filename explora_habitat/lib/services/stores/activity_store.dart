import 'package:explora_habitat/services/enum/activity_type.dart';
import 'package:explora_habitat/services/enum/field_type.dart';
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

  @computed
  bool get titleValid => title != null && title!.length >= 4;

  String? get titleError =>
      title == null || titleValid ? null : 'Título muito curto';

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

  @computed
  bool get activityContentValid =>
      customFields.isNotEmpty ||
      types.where((type) => type.isSelected).isNotEmpty;

  @computed
  bool get activityValid => titleValid && activityContentValid;

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
