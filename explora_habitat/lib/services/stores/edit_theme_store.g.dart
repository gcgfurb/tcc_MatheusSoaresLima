// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditThemeStore on _EditThemeStore, Store {
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_EditThemeStore.titleValid'))
          .value;
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: '_EditThemeStore.titleError'))
          .value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_EditThemeStore.descriptionValid'))
      .value;
  Computed<String?>? _$descriptionErrorComputed;

  @override
  String? get descriptionError => (_$descriptionErrorComputed ??=
          Computed<String?>(() => super.descriptionError,
              name: '_EditThemeStore.descriptionError'))
      .value;
  Computed<bool>? _$themeValidComputed;

  @override
  bool get themeValid =>
      (_$themeValidComputed ??= Computed<bool>(() => super.themeValid,
              name: '_EditThemeStore.themeValid'))
          .value;

  final _$titleAtom = Atom(name: '_EditThemeStore.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$oldTitleAtom = Atom(name: '_EditThemeStore.oldTitle');

  @override
  String get oldTitle {
    _$oldTitleAtom.reportRead();
    return super.oldTitle;
  }

  @override
  set oldTitle(String value) {
    _$oldTitleAtom.reportWrite(value, super.oldTitle, () {
      super.oldTitle = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_EditThemeStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$oldDescriptionAtom = Atom(name: '_EditThemeStore.oldDescription');

  @override
  String get oldDescription {
    _$oldDescriptionAtom.reportRead();
    return super.oldDescription;
  }

  @override
  set oldDescription(String value) {
    _$oldDescriptionAtom.reportWrite(value, super.oldDescription, () {
      super.oldDescription = value;
    });
  }

  final _$_EditThemeStoreActionController =
      ActionController(name: '_EditThemeStore');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_EditThemeStoreActionController.startAction(
        name: '_EditThemeStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_EditThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_EditThemeStoreActionController.startAction(
        name: '_EditThemeStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_EditThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTheme() {
    final _$actionInfo = _$_EditThemeStoreActionController.startAction(
        name: '_EditThemeStore.updateTheme');
    try {
      return super.updateTheme();
    } finally {
      _$_EditThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFields() {
    final _$actionInfo = _$_EditThemeStoreActionController.startAction(
        name: '_EditThemeStore.resetFields');
    try {
      return super.resetFields();
    } finally {
      _$_EditThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
oldTitle: ${oldTitle},
description: ${description},
oldDescription: ${oldDescription},
titleValid: ${titleValid},
titleError: ${titleError},
descriptionValid: ${descriptionValid},
descriptionError: ${descriptionError},
themeValid: ${themeValid}
    ''';
  }
}
