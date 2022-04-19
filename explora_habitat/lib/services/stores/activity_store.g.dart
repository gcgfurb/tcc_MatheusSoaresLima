// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ActivityStore on _ActivityStore, Store {
  final _$activityAtom = Atom(name: '_ActivityStore.activity');

  @override
  Activity? get activity {
    _$activityAtom.reportRead();
    return super.activity;
  }

  @override
  set activity(Activity? value) {
    _$activityAtom.reportWrite(value, super.activity, () {
      super.activity = value;
    });
  }

  final _$editingAtom = Atom(name: '_ActivityStore.editing');

  @override
  bool get editing {
    _$editingAtom.reportRead();
    return super.editing;
  }

  @override
  set editing(bool value) {
    _$editingAtom.reportWrite(value, super.editing, () {
      super.editing = value;
    });
  }

  final _$titleAtom = Atom(name: '_ActivityStore.title');

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

  final _$_ActivityStoreActionController =
      ActionController(name: '_ActivityStore');

  @override
  void setActivity(Activity activity) {
    final _$actionInfo = _$_ActivityStoreActionController.startAction(
        name: '_ActivityStore.setActivity');
    try {
      return super.setActivity(activity);
    } finally {
      _$_ActivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_ActivityStoreActionController.startAction(
        name: '_ActivityStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ActivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomFieldTitle(String? value, int index) {
    final _$actionInfo = _$_ActivityStoreActionController.startAction(
        name: '_ActivityStore.setCustomFieldTitle');
    try {
      return super.setCustomFieldTitle(value, index);
    } finally {
      _$_ActivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomFieldTye(String type, int index) {
    final _$actionInfo = _$_ActivityStoreActionController.startAction(
        name: '_ActivityStore.setCustomFieldTye');
    try {
      return super.setCustomFieldTye(type, index);
    } finally {
      _$_ActivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectAcitivyType(int index) {
    final _$actionInfo = _$_ActivityStoreActionController.startAction(
        name: '_ActivityStore.selectAcitivyType');
    try {
      return super.selectAcitivyType(index);
    } finally {
      _$_ActivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activity: ${activity},
editing: ${editing},
title: ${title}
    ''';
  }
}
