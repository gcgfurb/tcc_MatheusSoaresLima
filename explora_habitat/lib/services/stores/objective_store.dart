import 'package:explora_habitat/services/models/objective.dart';
import 'package:mobx/mobx.dart';

part 'objective_store.g.dart';

class ObjectiveStore = _ObjectiveStore with _$ObjectiveStore;

abstract class _ObjectiveStore with Store {
  _ObjectiveStore(this.objective);

  @observable
  Objective objective;
}
