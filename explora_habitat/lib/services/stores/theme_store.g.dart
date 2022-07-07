// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

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

  late final _$finishingAtom =
      Atom(name: '_ThemeStore.finishing', context: context);

  @override
  bool get finishing {
    _$finishingAtom.reportRead();
    return super.finishing;
  }

  @override
  set finishing(bool value) {
    _$finishingAtom.reportWrite(value, super.finishing, () {
      super.finishing = value;
    });
  }

  late final _$errorAtom = Atom(name: '_ThemeStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$syncAsyncAction =
      AsyncAction('_ThemeStore.sync', context: context);

  @override
  Future<void> sync(int key) {
    return _$syncAsyncAction.run(() => super.sync(key));
  }

  late final _$finishAsyncAction =
      AsyncAction('_ThemeStore.finish', context: context);

  @override
  Future<void> finish(int index) {
    return _$finishAsyncAction.run(() => super.finish(index));
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
syncing: ${syncing},
finishing: ${finishing},
error: ${error}
    ''';
  }
}
