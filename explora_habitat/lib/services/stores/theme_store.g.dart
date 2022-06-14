// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStore, Store {
  late final _$loadingAtom =
      Atom(name: '_ThemeStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$syncingAtom =
      Atom(name: '_ThemeStore.syncing', context: context);

  @override
  bool get syncing {
    _$syncingAtom.reportRead();
    return super.syncing;
  }

  @override
  set syncing(bool value) {
    _$syncingAtom.reportWrite(value, super.syncing, () {
      super.syncing = value;
    });
  }

  late final _$syncAsyncAction =
      AsyncAction('_ThemeStore.sync', context: context);

  @override
  Future<void> sync(int index) {
    return _$syncAsyncAction.run(() => super.sync(index));
  }

  late final _$syncThemesAsyncAction =
      AsyncAction('_ThemeStore.syncThemes', context: context);

  @override
  Future<void> syncThemes() {
    return _$syncThemesAsyncAction.run(() => super.syncThemes());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
syncing: ${syncing}
    ''';
  }
}
