import 'package:explora_habitat/services/models/objective.dart';
import 'package:mobx/mobx.dart';

part 'objective_store.g.dart';

class ObjectiveStore = _ObjectiveStore with _$ObjectiveStore;

abstract class _ObjectiveStore with Store {
  @observable
  Objective objective;

  @observable
  String title;

  @observable
  String oldTitle;

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 4;

  @computed
  String? get titleError => titleValid ? null : 'Título muito curto';

  _ObjectiveStore(this.objective)
      : title = objective.title,
        oldTitle = objective.title;

  @action
  void updateTheme() {
    objective.title = title;
    oldTitle = objective.title;
  }

  @action
  void resetFields() => setTitle(oldTitle);
}
