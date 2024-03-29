import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:explora_habitat/services/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
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
  bool get themeValid => titleValid && descriptionValid;

  @observable
  ThemeExplora? theme;

  @action
  void setObjectives(List<Objective> objectives) {
    theme!.objectives = objectives;
  }

  @action
  void setTheme() {
    theme = ThemeExplora(
      title: title!,
      description: description!,
      objectives: [],
    );
  }

  @observable
  int? index;

  @action
  void editTheme(ThemeExplora themeEdit, int currentPosition) {
    theme = themeEdit;
    index = currentPosition;
  }

  @observable
  String? themeContentError;

  @action
  bool isThemeValid() {
    if (theme!.objectives.isEmpty) {
      themeContentError = 'Inclua ao menos um objetivo ao tema!';
      return false;
    } else if (theme!.objectives
        .any((objective) => objective.activities.isEmpty)) {
      themeContentError =
      'Inclua ao menos uma atividade aos objetivos do tema!';
      return false;
    }
    return true;
  }

  @action
  void saveTheme() {
    themeContentError = null;

    if (isThemeValid()) {
      final ThemeStore themeStore = GetIt.I<ThemeStore>();

      if (index != null) {
        themeStore.update(index!, theme!);
      } else {
        theme!.creator = GetIt
            .I<UserManagerStore>()
            .user;
        themeStore.add(theme!);
      }
    }
  }
}
