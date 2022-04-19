// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ObjectiveStore on _ObjectiveStore, Store {
  final _$objectiveAtom = Atom(name: '_ObjectiveStore.objective');

  @override
  Objective get objective {
    _$objectiveAtom.reportRead();
    return super.objective;
  }

  @override
  set objective(Objective value) {
    _$objectiveAtom.reportWrite(value, super.objective, () {
      super.objective = value;
    });
  }

  @override
  String toString() {
    return '''
objective: ${objective}
    ''';
  }
}
