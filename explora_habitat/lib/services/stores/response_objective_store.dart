import 'package:explora_habitat/services/models/activity.dart';
import 'package:mobx/mobx.dart';

import '../models/objective.dart';

part 'response_objective_store.g.dart';

class ResponseObjectiveStore = _ResponseObjectiveStore
    with _$ResponseObjectiveStore;

abstract class _ResponseObjectiveStore with Store {
  @observable
  Objective objective;

  _ResponseObjectiveStore({required this.objective});

  @observable
  int currentStep = 0;

  @action
  void setCurrentStep(int value) => currentStep = value;

  @observable
  bool isExpanded = false;

  @action
  void toggleExpanded() => isExpanded = !isExpanded;

  @computed
  bool get isActivityCompleted {
    print(objective.activities[currentStep].activityStatus);
    return objective.activities[currentStep].activityStatus ==
        ActivityStatus.completed;
  }


  @computed
  bool get canInitAcitivity => !(objective
              .activities[currentStep].activityStatus ==
          ActivityStatus.completed ||
      (currentStep > 0 &&
          objective.keepOrder &&
          objective.activities[currentStep - 1].activityStatus !=
              ActivityStatus.completed));
}
