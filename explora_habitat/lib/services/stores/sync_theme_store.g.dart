// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SyncThemeStore on _SyncThemeStore, Store {
  Computed<bool>? _$codeValidComputed;

  @override
  bool get codeValid =>
      (_$codeValidComputed ??= Computed<bool>(() => super.codeValid,
              name: '_SyncThemeStore.codeValid'))
          .value;
  Computed<VoidCallback?>? _$syncThemeComputed;

  @override
  VoidCallback? get syncTheme =>
      (_$syncThemeComputed ??= Computed<VoidCallback?>(() => super.syncTheme,
              name: '_SyncThemeStore.syncTheme'))
          .value;

  late final _$loadingAtom =
      Atom(name: '_SyncThemeStore.loading', context: context);

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

  late final _$codeAtom = Atom(name: '_SyncThemeStore.code', context: context);

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_SyncThemeStore.error', context: context);

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

  late final _$syncErrorAtom =
      Atom(name: '_SyncThemeStore.syncError', context: context);

  @override
  String? get syncError {
    _$syncErrorAtom.reportRead();
    return super.syncError;
  }

  @override
  set syncError(String? value) {
    _$syncErrorAtom.reportWrite(value, super.syncError, () {
      super.syncError = value;
    });
  }

  late final _$_syncAsyncAction =
      AsyncAction('_SyncThemeStore._sync', context: context);

  @override
  Future<void> _sync() {
    return _$_syncAsyncAction.run(() => super._sync());
  }

  late final _$_SyncThemeStoreActionController =
      ActionController(name: '_SyncThemeStore', context: context);

  @override
  void setCode(String value) {
    final _$actionInfo = _$_SyncThemeStoreActionController.startAction(
        name: '_SyncThemeStore.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_SyncThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
code: ${code},
error: ${error},
syncError: ${syncError},
codeValid: ${codeValid},
syncTheme: ${syncTheme}
    ''';
  }
}
