import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:mobx/mobx.dart';

part 'my_theme_store.g.dart';

class MyThemeStore = _MyThemeStore with _$MyThemeStore;

abstract class _MyThemeStore with Store {

  @observable
  ThemeExplora theme;

  @observable
  bool isExpanded = false;

  @action
  void toggleExpanded() => isExpanded = !isExpanded;

  _MyThemeStore(this.theme);
}
