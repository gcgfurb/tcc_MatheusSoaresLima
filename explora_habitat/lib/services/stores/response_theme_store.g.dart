// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResponseThemeStore on _ResponseThemeStore, Store {
  late final _$themeAtom =
      Atom(name: '_ResponseThemeStore.theme', context: context);

  @override
  ThemeExplora get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeExplora value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$keyAtom =
      Atom(name: '_ResponseThemeStore.key', context: context);

  @override
  int get key {
    _$keyAtom.reportRead();
    return super.key;
  }

  @override
  set key(int value) {
    _$keyAtom.reportWrite(value, super.key, () {
      super.key = value;
    });
  }

  late final _$readOnlyAtom =
      Atom(name: '_ResponseThemeStore.readOnly', context: context);

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
      Atom(name: '_ResponseThemeStore.completed', context: context);

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
      Atom(name: '_ResponseThemeStore.isExpanded', context: context);

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

  late final _$_ResponseThemeStoreActionController =
      ActionController(name: '_ResponseThemeStore', context: context);

  @override
  void toggleExpanded() {
    final _$actionInfo = _$_ResponseThemeStoreActionController.startAction(
        name: '_ResponseThemeStore.toggleExpanded');
    try {
      return super.toggleExpanded();
    } finally {
      _$_ResponseThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveResponse() {
    final _$actionInfo = _$_ResponseThemeStoreActionController.startAction(
        name: '_ResponseThemeStore.saveResponse');
    try {
      return super.saveResponse();
    } finally {
      _$_ResponseThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
theme: ${theme},
key: ${key},
readOnly: ${readOnly},
completed: ${completed},
isExpanded: ${isExpanded}
    ''';
  }
}
