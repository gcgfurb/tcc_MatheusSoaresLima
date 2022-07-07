// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ObjectiveStore on _ObjectiveStore, Store {
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_ObjectiveStore.titleValid'))
          .value;
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: '_ObjectiveStore.titleError'))
          .value;

  late final _$objectiveAtom =
      Atom(name: '_ObjectiveStore.objective', context: context);

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

  late final _$titleAtom =
      Atom(name: '_ObjectiveStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$oldTitleAtom =
      Atom(name: '_ObjectiveStore.oldTitle', context: context);

  @override
  String get oldTitle {
    _$oldTitleAtom.reportRead();
    return super.oldTitle;
  }

  @override
  set oldTitle(String value) {
    _$oldTitleAtom.reportWrite(value, super.oldTitle, () {
      super.oldTitle = value;
    });
  }

  late final _$_ObjectiveStoreActionController =
      ActionController(name: '_ObjectiveStore', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_ObjectiveStoreActionController.startAction(
        name: '_ObjectiveStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTheme() {
    final _$actionInfo = _$_ObjectiveStoreActionController.startAction(
        name: '_ObjectiveStore.updateTheme');
    try {
      return super.updateTheme();
    } finally {
      _$_ObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFields() {
    final _$actionInfo = _$_ObjectiveStoreActionController.startAction(
        name: '_ObjectiveStore.resetFields');
    try {
      return super.resetFields();
    } finally {
      _$_ObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
objective: ${objective},
title: ${title},
oldTitle: ${oldTitle},
titleValid: ${titleValid},
titleError: ${titleError}
    ''';
  }
}
