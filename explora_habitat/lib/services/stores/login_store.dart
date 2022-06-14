import 'package:explora_habitat/services/models/user.dart';
import 'package:explora_habitat/services/repositories/parse_repository/user_repository.dart';
import 'package:explora_habitat/services/stores/responses_theme_store.dart';
import 'package:explora_habitat/services/stores/synced_themes_store.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:explora_habitat/services/stores/user_manager_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:explora_habitat/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get emailError =>
      email == null || emailValid ? null : 'E-mail inválido';

  @observable
  String? password;

  @computed
  bool get passwordValid => password != null && password!.length >= 4;

  String? get passwordError =>
      password == null || passwordValid ? null : 'Senha inválida';

  @action
  void setPassoword(String value) => password = value;

  @computed
  VoidCallback? get loginPressed =>
      emailValid && passwordValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  bool loggedIn = false;

  @action
  Future<void> _login() async {
    loading = true;
    error = null;

    try {
      final user = await UserRepository().loginWithEmail(email!, password!);

      final userMapped = User.fromParse(user);
      GetIt.I<UserManagerStore>().setUser(userMapped);

      _verifyRegistrations();

      GetIt.I.registerSingleton(ThemeStore());
      await GetIt.I<ThemeStore>().initThemesBox(userMapped.id!);

      GetIt.I.registerSingleton(SyncedThemesStore());
      await GetIt.I<SyncedThemesStore>().initThemesBox(userMapped.id!);

      GetIt.I.registerSingleton(ResponsesThemeStore());
      await GetIt.I<ResponsesThemeStore>().initThemesBox(userMapped.id!);

      loggedIn = true;
    } catch (e) {
      error = e.toString();
    }
    loading = false;
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
