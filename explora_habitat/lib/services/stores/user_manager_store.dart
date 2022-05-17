import 'package:explora_habitat/services/models/user.dart';
import 'package:explora_habitat/services/repositories/parse_repository/user_repository.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {
  _UserManagerStore() {
    _getCurrentUser();
  }

  @observable
  User? user;

  @action
  void setUser(User? value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _getCurrentUser() async {
    final user = await UserRepository().currentUser();
    if (user != null) {
      final userMapped = User.fromParse(user);
      setUser(userMapped);
    }
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
  }
}
