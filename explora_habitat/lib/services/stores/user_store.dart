import 'package:explora_habitat/services/models/user.dart';
import 'package:explora_habitat/services/stores/synced_theme_store.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  Future<void> enter(User user) async {
    GetIt.I.registerSingleton(ThemeStore());
    await GetIt.I<ThemeStore>().initThemesBox(user.id!);

    GetIt.I.registerSingleton(SyncedThemeStore());
    await GetIt.I<SyncedThemeStore>().initThemesBox(user.id!);

  }
}
