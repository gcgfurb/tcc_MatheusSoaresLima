import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:mobx/mobx.dart';

part 'edit_theme_store.g.dart';

class EditThemeStore = _EditThemeStore with _$EditThemeStore;

abstract class _EditThemeStore with Store {
  @observable
  String title;

  @observable
  String oldTitle;

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 4;

  @computed
  String? get titleError =>
      titleValid ? null : 'Título muito curto';

  @observable
  String description;

  @observable
  String oldDescription;

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 4;

  @computed
  String? get descriptionError =>
      descriptionValid ? null : 'Descrição muito curta';

  @computed
  bool get themeValid => titleValid && descriptionValid;

  @action
  void updateTheme() {
    theme.title = title;
    oldTitle = theme.title;

    theme.description = description;
    oldDescription = theme.description;
  }

  @action
  void resetFields() {
    setTitle(oldTitle);
    setDescription(oldDescription);
  }

  ThemeExplora theme;

  _EditThemeStore(this.theme)
      : title = theme.title,
        oldTitle = theme.title,
        description = theme.description,
        oldDescription = theme.description;
}
