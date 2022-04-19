import 'package:explora_habitat/services/models/objective.dart';
import 'package:mobx/mobx.dart';

part 'create_objective_store.g.dart';

class CreateObjectiveStore = _CreateObjectiveStore with _$CreateObjectiveStore;

abstract class _CreateObjectiveStore with Store {
  @observable
  String? title;

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title != null && title!.replaceAll(' ', '').length >= 4;

  ObservableList<Objective> objectives = ObservableList();

  @action
  void addNewItem() {
    objectives.add(Objective(title: title!, activities: []));
    title = null;
  }

  @action
  void removeItem(int index) {
    objectives.removeAt(index);
  }
}
