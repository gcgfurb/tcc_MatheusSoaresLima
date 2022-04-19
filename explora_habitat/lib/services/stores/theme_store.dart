import 'package:explora_habitat/services/models/theme.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {

  ObservableList<ThemeExplora> themes = ObservableList();

}