import 'package:explora_habitat/services/models/activity.dart';
import 'package:mobx/mobx.dart';

import '../models/objective.dart';

part 'create_activity_store.g.dart';

class CreateActivityStore = _CreateActivityStore with _$CreateActivityStore;

abstract class _CreateActivityStore with Store {
  _CreateActivityStore(List<Activity> activities, this.objective)
      : activities = ObservableList.of(activities);

  @observable
  bool isExpanded = false;

  @observable
  bool keepOrder = false;

  @observable
  Objective objective;

  @action
  void toggleExpanded() => isExpanded = !isExpanded;

  @action
  toggleKeepOrder() => keepOrder = !keepOrder;

  ObservableList<Activity> activities = ObservableList();

  @action
  void reOrder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final updatedActivities = [...activities];
    final Activity item = updatedActivities.removeAt(oldIndex);
    updatedActivities.insert(newIndex, item);
    activities = ObservableList.of(updatedActivities);
  }
}
