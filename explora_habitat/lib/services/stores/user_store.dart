import 'package:explora_habitat/services/models/user.dart';
import 'package:explora_habitat/services/stores/responses_theme_store.dart';
import 'package:explora_habitat/services/stores/synced_themes_store.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  Future<void> enter(User user) async {
    _verifyRegistrations();
    GetIt.I.registerSingleton(ThemeStore());
    await GetIt.I<ThemeStore>().initThemesBox(user.id!);

    GetIt.I.registerSingleton(SyncedThemesStore());
    await GetIt.I<SyncedThemesStore>().initThemesBox(user.id!);

    GetIt.I.registerSingleton(ResponsesThemeStore());
    await GetIt.I<ResponsesThemeStore>().initThemesBox(user.id!);
  }

  void _verifyRegistrations() {
    if (GetIt.I.isRegistered(instance: ThemeStore())) {
      GetIt.I.unregister(instance: GetIt.I<ThemeStore>());
    }
    if (GetIt.I.isRegistered(instance: SyncedThemesStore())) {
      GetIt.I.unregister(instance: GetIt.I<SyncedThemesStore>());
    }
    if (GetIt.I.isRegistered(instance: ResponsesThemeStore())) {
      GetIt.I.unregister(instance: GetIt.I<ResponsesThemeStore>());
    }
  }
}
