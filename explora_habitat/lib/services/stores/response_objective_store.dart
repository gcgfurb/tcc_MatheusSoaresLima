import 'package:mobx/mobx.dart';

import '../models/objective.dart';

part 'response_objective_store.g.dart';

class ResponseObjectiveStore = _ResponseObjectiveStore with _$ResponseObjectiveStore;

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

}