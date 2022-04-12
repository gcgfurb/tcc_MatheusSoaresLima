import 'package:explora_habitat/services/models/tema.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'create_tema_store.g.dart';

class CreateThemeStore = _CreateThemeStore with _$CreateThemeStore;

abstract class _CreateThemeStore with Store {
  @observable
  String? title;

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title != null && title!.length >= 4;

  @computed
  String? get titleError =>
      title == null || titleValid ? null : 'Título muito curto';

  @observable
  String? description;

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description != null && description!.length >= 4;

  @computed
  String? get descriptionError =>
      description == null || descriptionValid ? null : 'Descrição muito curta';

  @computed
  bool get temaValid => titleValid && descriptionValid;

  @observable
  Tema? tema;

  @action
  void setTema() {
    tema = Tema(title: title!, description: description!);
  }
}
