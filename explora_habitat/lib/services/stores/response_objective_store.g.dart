// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_objective_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResponseObjectiveStore on _ResponseObjectiveStore, Store {
  Computed<bool>? _$canInitAcitivityComputed;

  @override
  bool get canInitAcitivity => (_$canInitAcitivityComputed ??= Computed<bool>(
          () => super.canInitAcitivity,
          name: '_ResponseObjectiveStore.canInitAcitivity'))
      .value;

  final _$objectiveAtom = Atom(name: '_ResponseObjectiveStore.objective');

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

  final _$currentStepAtom = Atom(name: '_ResponseObjectiveStore.currentStep');

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

  final _$isExpandedAtom = Atom(name: '_ResponseObjectiveStore.isExpanded');

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

  final _$_ResponseObjectiveStoreActionController =
      ActionController(name: '_ResponseObjectiveStore');

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
isExpanded: ${isExpanded},
canInitAcitivity: ${canInitAcitivity}
    ''';
  }
}
