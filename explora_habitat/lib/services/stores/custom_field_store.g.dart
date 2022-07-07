// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_field_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomFieldStore on _CustomFieldStore, Store {
  late final _$customFieldAtom =
      Atom(name: '_CustomFieldStore.customField', context: context);

  @override
  CustomField? get customField {
    _$customFieldAtom.reportRead();
    return super.customField;
  }

  @override
  set customField(CustomField? value) {
    _$customFieldAtom.reportWrite(value, super.customField, () {
      super.customField = value;
    });
  }

  late final _$requiredAtom =
      Atom(name: '_CustomFieldStore.required', context: context);

  @override
  bool get required {
    _$requiredAtom.reportRead();
    return super.required;
  }

  @override
  set required(bool value) {
    _$requiredAtom.reportWrite(value, super.required, () {
      super.required = value;
    });
  }

  late final _$_CustomFieldStoreActionController =
      ActionController(name: '_CustomFieldStore', context: context);

  @override
  void setFieldType(FieldType value) {
    final _$actionInfo = _$_CustomFieldStoreActionController.startAction(
        name: '_CustomFieldStore.setFieldType');
    try {
      return super.setFieldType(value);
    } finally {
      _$_CustomFieldStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CustomFieldStoreActionController.startAction(
        name: '_CustomFieldStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CustomFieldStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleRequired() {
    final _$actionInfo = _$_CustomFieldStoreActionController.startAction(
        name: '_CustomFieldStore.toggleRequired');
    try {
      return super.toggleRequired();
    } finally {
      _$_CustomFieldStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customField: ${customField},
required: ${required}
    ''';
  }
}
