// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_activity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResponseActivityStore on _ResponseActivityStore, Store {
  final _$activityAtom = Atom(name: '_ResponseActivityStore.activity');

  @override
  Activity get activity {
    _$activityAtom.reportRead();
    return super.activity;
  }

  @override
  set activity(Activity value) {
    _$activityAtom.reportWrite(value, super.activity, () {
      super.activity = value;
    });
  }

  final _$loadingAtom = Atom(name: '_ResponseActivityStore.loading');

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

  final _$saveResponseAsyncAction =
      AsyncAction('_ResponseActivityStore.saveResponse');

  @override
  Future<void> saveResponse() {
    return _$saveResponseAsyncAction.run(() => super.saveResponse());
  }

  @override
  String toString() {
    return '''
activity: ${activity},
loading: ${loading}
    ''';
  }
}
