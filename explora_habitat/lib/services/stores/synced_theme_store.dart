import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:mobx/mobx.dart';

part 'synced_theme_store.g.dart';

class SyncedThemeStore = _SyncedThemeStore with _$SyncedThemeStore;

abstract class _SyncedThemeStore with Store {

  @observable
  ThemeExplora theme;

  @observable
  bool isExpanded = false;

  @action
  void toggleExpanded() => isExpanded = !isExpanded;

  _SyncedThemeStore(this.theme);

}