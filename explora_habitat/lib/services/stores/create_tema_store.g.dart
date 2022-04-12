// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_tema_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateThemeStore on _CreateThemeStore, Store {
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_CreateThemeStore.titleValid'))
          .value;
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: '_CreateThemeStore.titleError'))
          .value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_CreateThemeStore.descriptionValid'))
      .value;
  Computed<String?>? _$descriptionErrorComputed;

  @override
  String? get descriptionError => (_$descriptionErrorComputed ??=
          Computed<String?>(() => super.descriptionError,
              name: '_CreateThemeStore.descriptionError'))
      .value;
  Computed<bool>? _$temaValidComputed;

  @override
  bool get temaValid =>
      (_$temaValidComputed ??= Computed<bool>(() => super.temaValid,
              name: '_CreateThemeStore.temaValid'))
          .value;

  final _$titleAtom = Atom(name: '_CreateThemeStore.title');

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_CreateThemeStore.description');

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$temaAtom = Atom(name: '_CreateThemeStore.tema');

  @override
  Tema? get tema {
    _$temaAtom.reportRead();
    return super.tema;
  }

  @override
  set tema(Tema? value) {
    _$temaAtom.reportWrite(value, super.tema, () {
      super.tema = value;
    });
  }

  final _$_CreateThemeStoreActionController =
      ActionController(name: '_CreateThemeStore');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateThemeStoreActionController.startAction(
        name: '_CreateThemeStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreateThemeStoreActionController.startAction(
        name: '_CreateThemeStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTema() {
    final _$actionInfo = _$_CreateThemeStoreActionController.startAction(
        name: '_CreateThemeStore.setTema');
    try {
      return super.setTema();
    } finally {
      _$_CreateThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
tema: ${tema},
titleValid: ${titleValid},
titleError: ${titleError},
descriptionValid: ${descriptionValid},
descriptionError: ${descriptionError},
temaValid: ${temaValid}
    ''';
  }
}
