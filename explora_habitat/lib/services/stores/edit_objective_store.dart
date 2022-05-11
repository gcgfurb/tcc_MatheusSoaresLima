import 'package:explora_habitat/services/models/objective.dart';
import 'package:mobx/mobx.dart';

part 'edit_objective_store.g.dart';

class EditObjectiveStore = _EditObjectiveStore with _$EditObjectiveStore;

abstract class _EditObjectiveStore with Store {
  @observable
  String title;

  @observable
  String oldTitle;

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 4;

  @computed
  String? get titleError =>
      titleValid ? null : 'Título muito curto';

  @action
  void updateTheme() {
    objective.title = title;
    oldTitle = objective.title;
  }

  @action
  void resetFields() => setTitle(oldTitle);

  Objective objective;

  _EditObjectiveStore(this.objective)
      : title = objective.title,
        oldTitle = objective.title;
}
