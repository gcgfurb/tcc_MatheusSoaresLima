import 'package:explora_habitat/services/models/theme.dart';
import 'package:mobx/mobx.dart';

part 'my_theme_store.g.dart';

class MyThemeStore = _MyThemeStore with _$MyThemeStore;

abstract class _MyThemeStore with Store {

  @observable
  ThemeExplora theme;

  _MyThemeStore(this.theme);
}
