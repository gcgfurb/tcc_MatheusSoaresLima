// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_objective_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditObjectiveStore on _EditObjectiveStore, Store {
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_EditObjectiveStore.titleValid'))
          .value;
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: '_EditObjectiveStore.titleError'))
          .value;

  late final _$titleAtom =
      Atom(name: '_EditObjectiveStore.title', context: context);

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
      Atom(name: '_EditObjectiveStore.oldTitle', context: context);

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

  late final _$_EditObjectiveStoreActionController =
      ActionController(name: '_EditObjectiveStore', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_EditObjectiveStoreActionController.startAction(
        name: '_EditObjectiveStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_EditObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTheme() {
    final _$actionInfo = _$_EditObjectiveStoreActionController.startAction(
        name: '_EditObjectiveStore.updateTheme');
    try {
      return super.updateTheme();
    } finally {
      _$_EditObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFields() {
    final _$actionInfo = _$_EditObjectiveStoreActionController.startAction(
        name: '_EditObjectiveStore.resetFields');
    try {
      return super.resetFields();
    } finally {
      _$_EditObjectiveStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
oldTitle: ${oldTitle},
titleValid: ${titleValid},
titleError: ${titleError}
    ''';
  }
}
