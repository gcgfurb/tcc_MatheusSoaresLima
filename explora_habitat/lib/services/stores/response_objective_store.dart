import 'package:explora_habitat/services/enum/activity_status.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:mobx/mobx.dart';

import '../models/objective.dart';

part 'response_objective_store.g.dart';

class ResponseObjectiveStore = _ResponseObjectiveStore
    with _$ResponseObjectiveStore;

abstract class _ResponseObjectiveStore with Store {
  @observable
  Objective objective;

  _ResponseObjectiveStore({
    required this.objective,
    this.readOnly = false,
    this.completed = false,
  });

  @observable
  int currentStep = 0;

  @observable
  bool readOnly;

  @observable
  bool completed;

  @action
  void setCurrentStep(int value) => currentStep = value;

  @observable
  bool isExpanded = false;

  @action
  void toggleExpanded() => isExpanded = !isExpanded;

  @computed
  bool get isActivityCompleted {
    return objective.activities[currentStep].status == ActivityStatus.completed;
  }

  @computed
  bool get canInitAcitivity => !(currentStep > 0 &&
      objective.keepOrder &&
      objective.activities[currentStep - 1].status != ActivityStatus.completed);
}
