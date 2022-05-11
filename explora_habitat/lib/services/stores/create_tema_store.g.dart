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
  Computed<bool>? _$themeValidComputed;

  @override
  bool get themeValid =>
      (_$themeValidComputed ??= Computed<bool>(() => super.themeValid,
              name: '_CreateThemeStore.themeValid'))
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

  final _$themeAtom = Atom(name: '_CreateThemeStore.theme');

  @override
  ThemeExplora? get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeExplora? value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  final _$indexAtom = Atom(name: '_CreateThemeStore.index');

  @override
  int? get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int? value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$themeContentErrorAtom =
      Atom(name: '_CreateThemeStore.themeContentError');

  @override
  String? get themeContentError {
    _$themeContentErrorAtom.reportRead();
    return super.themeContentError;
  }

  @override
  set themeContentError(String? value) {
    _$themeContentErrorAtom.reportWrite(value, super.themeContentError, () {
      super.themeContentError = value;
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
  void setObjectives(List<Objective> objectives) {
    final _$actionInfo = _$_CreateThemeStoreActionController.startAction(
        name: '_CreateThemeStore.setObjectives');
    try {
      return super.setObjectives(objectives);
    } finally {
      _$_CreateThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTheme() {
    final _$actionInfo = _$_CreateThemeStoreActionController.startAction(
        name: '_CreateThemeStore.setTheme');
    try {
      return super.setTheme();
    } finally {
      _$_CreateThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTheme(ThemeExplora themeEdit, int currentPosition) {
    final _$actionInfo = _$_CreateThemeStoreActionController.startAction(
        name: '_CreateThemeStore.editTheme');
    try {
      return super.editTheme(themeEdit, currentPosition);
    } finally {
      _$_CreateThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isThemeValid() {
    final _$actionInfo = _$_CreateThemeStoreActionController.startAction(
        name: '_CreateThemeStore.isThemeValid');
    try {
      return super.isThemeValid();
    } finally {
      _$_CreateThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void saveTheme() {
    final _$actionInfo = _$_CreateThemeStoreActionController.startAction(
        name: '_CreateThemeStore.saveTheme');
    try {
      return super.saveTheme();
    } finally {
      _$_CreateThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
theme: ${theme},
index: ${index},
themeContentError: ${themeContentError},
titleValid: ${titleValid},
titleError: ${titleError},
descriptionValid: ${descriptionValid},
descriptionError: ${descriptionError},
themeValid: ${themeValid}
    ''';
  }
}
