import 'package:mobx/mobx.dart';

import '../models/custom_field.dart';

part 'custom_field_store.g.dart';

class CustomFieldStore = _CustomFieldStore with _$CustomFieldStore;

abstract class _CustomFieldStore with Store {
  _CustomFieldStore(this.customField) {
    customField ??= CustomField(title: '', type: FieldType.text);
  }

  @observable
  CustomField? customField;

  @action
  void setFieldType(FieldType value) => customField!.type = value;

  @action
  void setTitle(String value) => customField!.title = value;
}
