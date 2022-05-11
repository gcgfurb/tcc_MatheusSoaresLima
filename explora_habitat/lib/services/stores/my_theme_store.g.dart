// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyThemeStore on _MyThemeStore, Store {
  final _$themeAtom = Atom(name: '_MyThemeStore.theme');

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

  @override
  String toString() {
    return '''
theme: ${theme}
    ''';
  }
}
