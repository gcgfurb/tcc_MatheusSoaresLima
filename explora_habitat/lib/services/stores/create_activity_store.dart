import 'package:explora_habitat/services/models/activity.dart';
import 'package:mobx/mobx.dart';

part 'create_activity_store.g.dart';

class CreateActivityStore = _CreateActivityStore with _$CreateActivityStore;

abstract class _CreateActivityStore with Store {

  @observable
  bool isExpanded = false;

  @action
  void toggleExpanded() => isExpanded = !isExpanded;

  ObservableList<Activity> activities = ObservableList();
}