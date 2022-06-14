import 'package:explora_habitat/services/models/user.dart';
import 'package:explora_habitat/services/repositories/parse_repository/user_repository.dart';
import 'package:explora_habitat/services/stores/responses_theme_store.dart';
import 'package:explora_habitat/services/stores/synced_themes_store.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {
  @observable
  User? user;

  @action
  void setUser(User? value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<User?> getCurrentUser() async {
    var user = await UserRepository().currentUser();
    if (user != null) {
      setUser(User.fromParse(user));
    }
    return this.user;
  }

  Future<void> logout() async {
    try {
      await UserRepository().logout();
    } catch (e) {
      print('Erro ao realizar o logout: $e');
    } finally {
      _unRegisterStores();
      setUser(null);
    }
  }

  void _unRegisterStores() {
    GetIt.I.unregister(instance: GetIt.I<ThemeStore>());
    GetIt.I.unregister(instance: GetIt.I<SyncedThemesStore>());
    GetIt.I.unregister(instance: GetIt.I<ResponsesThemeStore>());
  }
}
