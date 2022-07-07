// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyThemeStore on _MyThemeStore, Store {
  late final _$themeAtom = Atom(name: '_MyThemeStore.theme', context: context);

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
      Atom(name: '_MyThemeStore.isExpanded', context: context);

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

  late final _$_MyThemeStoreActionController =
      ActionController(name: '_MyThemeStore', context: context);

  @override
  void toggleExpanded() {
    final _$actionInfo = _$_MyThemeStoreActionController.startAction(
        name: '_MyThemeStore.toggleExpanded');
    try {
      return super.toggleExpanded();
    } finally {
      _$_MyThemeStoreActionController.endAction(_$actionInfo);
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
