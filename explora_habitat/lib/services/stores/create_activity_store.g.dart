// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_activity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateActivityStore on _CreateActivityStore, Store {
  final _$isExpandedAtom = Atom(name: '_CreateActivityStore.isExpanded');

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

  final _$_CreateActivityStoreActionController =
      ActionController(name: '_CreateActivityStore');

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
  String toString() {
    return '''
isExpanded: ${isExpanded}
    ''';
  }
}