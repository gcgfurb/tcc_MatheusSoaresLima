// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResponsesThemeStore on _ResponsesThemeStore, Store {
  late final _$loadingAtom =
      Atom(name: '_ResponsesThemeStore.loading', context: context);

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

  late final _$syncThemesAsyncAction =
      AsyncAction('_ResponsesThemeStore.syncThemes', context: context);

  @override
  Future<void> syncThemes() {
    return _$syncThemesAsyncAction.run(() => super.syncThemes());
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
