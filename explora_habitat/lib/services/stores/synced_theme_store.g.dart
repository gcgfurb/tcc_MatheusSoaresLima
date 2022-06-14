// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synced_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SyncedThemeStore on _SyncedThemeStore, Store {
  late final _$themeAtom =
      Atom(name: '_SyncedThemeStore.theme', context: context);

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

  late final _$isExpandedAtom =
      Atom(name: '_SyncedThemeStore.isExpanded', context: context);

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

  late final _$_SyncedThemeStoreActionController =
      ActionController(name: '_SyncedThemeStore', context: context);

  @override
  void toggleExpanded() {
    final _$actionInfo = _$_SyncedThemeStoreActionController.startAction(
        name: '_SyncedThemeStore.toggleExpanded');
    try {
      return super.toggleExpanded();
    } finally {
      _$_SyncedThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
theme: ${theme},
isExpanded: ${isExpanded}
    ''';
  }
}