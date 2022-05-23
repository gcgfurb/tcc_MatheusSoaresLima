// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_objective_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateObjectiveStore on _CreateObjectiveStore, Store {
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_CreateObjectiveStore.titleValid'))
          .value;

  late final _$titleAtom =
      Atom(name: '_CreateObjectiveStore.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$_CreateObjectiveStoreActionController =
      ActionController(name: '_CreateObjectiveStore', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateObjectiveStoreActionController.startAction(
        name: '_CreateObjectiveStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObjectives(List<Objective> values) {
    final _$actionInfo = _$_CreateObjectiveStoreActionController.startAction(
        name: '_CreateObjectiveStore.setObjectives');
    try {
      return super.setObjectives(values);
    } finally {
      _$_CreateObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewItem() {
    final _$actionInfo = _$_CreateObjectiveStoreActionController.startAction(
        name: '_CreateObjectiveStore.addNewItem');
    try {
      return super.addNewItem();
    } finally {
      _$_CreateObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(int index) {
    final _$actionInfo = _$_CreateObjectiveStoreActionController.startAction(
        name: '_CreateObjectiveStore.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$_CreateObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
titleValid: ${titleValid}
    ''';
  }
}
