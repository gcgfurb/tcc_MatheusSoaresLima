import 'package:explora_habitat/services/models/theme.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  ObservableList<ThemeExplora> themes = ObservableList();

  @action
  void delete(int index) {
    var theme = themes[index];

    if (theme.id == null) {
      themes.removeAt(index);
    } else {
      throw Exception('Não é possível excluir um tema já sincronizado!');
    }
  }


  @action
  void copy(int index) {
    var theme = themes[index];
    var clonedTheme = theme.clone();
    themes.add(clonedTheme);
  }

  @action
  void sync(int index) {

  }
}
