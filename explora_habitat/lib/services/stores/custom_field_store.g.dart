// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_field_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomFieldStore on _CustomFieldStore, Store {
  final _$customFieldAtom = Atom(name: '_CustomFieldStore.customField');

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

  final _$_CustomFieldStoreActionController =
      ActionController(name: '_CustomFieldStore');

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
  String toString() {
    return '''
customField: ${customField}
    ''';
  }
}
