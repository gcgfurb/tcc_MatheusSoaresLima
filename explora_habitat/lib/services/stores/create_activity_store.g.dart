// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_activity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateActivityStore on _CreateActivityStore, Store {
  late final _$isExpandedAtom =
      Atom(name: '_CreateActivityStore.isExpanded', context: context);

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

  late final _$keepOrderAtom =
      Atom(name: '_CreateActivityStore.keepOrder', context: context);

  @override
  bool get keepOrder {
    _$keepOrderAtom.reportRead();
    return super.keepOrder;
  }

  @override
  set keepOrder(bool value) {
    _$keepOrderAtom.reportWrite(value, super.keepOrder, () {
      super.keepOrder = value;
    });
  }

  late final _$objectiveAtom =
      Atom(name: '_CreateActivityStore.objective', context: context);

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

  late final _$_CreateActivityStoreActionController =
      ActionController(name: '_CreateActivityStore', context: context);

  @override
  void toggleExpanded() {
    final _$actionInfo = _$_CreateActivityStoreActionController.startAction(
        name: '_CreateActivityStore.toggleExpanded');
    try {
      return super.toggleExpanded();
    } finally {
      _$_CreateActivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleKeepOrder() {
    final _$actionInfo = _$_CreateActivityStoreActionController.startAction(
        name: '_CreateActivityStore.toggleKeepOrder');
    try {
      return super.toggleKeepOrder();
    } finally {
      _$_CreateActivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reOrder(int oldIndex, int newIndex) {
    final _$actionInfo = _$_CreateActivityStoreActionController.startAction(
        name: '_CreateActivityStore.reOrder');
    try {
      return super.reOrder(oldIndex, newIndex);
    } finally {
      _$_CreateActivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isExpanded: ${isExpanded},
keepOrder: ${keepOrder},
objective: ${objective}
    ''';
  }
}
