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
    GetIt.I.registerSingleton(ThemeStore());
    await GetIt.I<ThemeStore>().initThemesBox(user.id!);

    GetIt.I.registerSingleton(SyncedThemesStore());
    await GetIt.I<SyncedThemesStore>().initThemesBox(user.id!);

    GetIt.I.registerSingleton(ResponsesThemeStore());
    await GetIt.I<ResponsesThemeStore>().initThemesBox(user.id!);
  }
}
