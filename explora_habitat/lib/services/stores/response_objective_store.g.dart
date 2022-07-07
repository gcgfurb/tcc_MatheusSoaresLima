// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_objective_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResponseObjectiveStore on _ResponseObjectiveStore, Store {
  Computed<bool>? _$isActivityCompletedComputed;

  @override
  bool get isActivityCompleted => (_$isActivityCompletedComputed ??=
          Computed<bool>(() => super.isActivityCompleted,
              name: '_ResponseObjectiveStore.isActivityCompleted'))
      .value;
  Computed<bool>? _$canInitAcitivityComputed;

  @override
  bool get canInitAcitivity => (_$canInitAcitivityComputed ??= Computed<bool>(
          () => super.canInitAcitivity,
          name: '_ResponseObjectiveStore.canInitAcitivity'))
      .value;

  late final _$objectiveAtom =
      Atom(name: '_ResponseObjectiveStore.objective', context: context);

  @override
  Objective get objective {
    _$objectiveAtom.reportRead();
    return super.objective;
  }

  @override
  set objective(Objective value) {
    _$objectiveAtom.reportWrite(value, super.objective, () {
      super.objective = value;
    });
  }

  late final _$currentStepAtom =
      Atom(name: '_ResponseObjectiveStore.currentStep', context: context);

  @override
  int get currentStep {
    _$currentStepAtom.reportRead();
    return super.currentStep;
  }

  @override
  set currentStep(int value) {
    _$currentStepAtom.reportWrite(value, super.currentStep, () {
      super.currentStep = value;
    });
  }

  late final _$readOnlyAtom =
      Atom(name: '_ResponseObjectiveStore.readOnly', context: context);

  @override
  bool get readOnly {
    _$readOnlyAtom.reportRead();
    return super.readOnly;
  }

  @override
  set readOnly(bool value) {
    _$readOnlyAtom.reportWrite(value, super.readOnly, () {
      super.readOnly = value;
    });
  }

  late final _$completedAtom =
      Atom(name: '_ResponseObjectiveStore.completed', context: context);

  @override
  bool get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(bool value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  late final _$isExpandedAtom =
      Atom(name: '_ResponseObjectiveStore.isExpanded', context: context);

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  late final _$_ResponseObjectiveStoreActionController =
      ActionController(name: '_ResponseObjectiveStore', context: context);

  @override
  void setCurrentStep(int value) {
    final _$actionInfo = _$_ResponseObjectiveStoreActionController.startAction(
        name: '_ResponseObjectiveStore.setCurrentStep');
    try {
      return super.setCurrentStep(value);
    } finally {
      _$_ResponseObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleExpanded() {
    final _$actionInfo = _$_ResponseObjectiveStoreActionController.startAction(
        name: '_ResponseObjectiveStore.toggleExpanded');
    try {
      return super.toggleExpanded();
    } finally {
      _$_ResponseObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
objective: ${objective},
currentStep: ${currentStep},
readOnly: ${readOnly},
completed: ${completed},
isExpanded: ${isExpanded},
isActivityCompleted: ${isActivityCompleted},
canInitAcitivity: ${canInitAcitivity}
    ''';
  }
}
