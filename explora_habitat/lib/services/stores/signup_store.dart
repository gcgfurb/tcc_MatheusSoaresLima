import 'package:explora_habitat/services/models/user.dart';
import 'package:explora_habitat/services/repositories/parse_repository/user_repository.dart';
import 'package:explora_habitat/helpers/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'user_manager_store.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.trim().length > 6;

  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email!.isEmailValid();

  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @observable
  String? pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1!.length >= 6;

  String? get pass1Error {
    if (pass1 == null || pass1Valid) {
      return null;
    } else if (pass1!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha inválida';
    }
  }

  @observable
  String? pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;

  String? get pass2Error {
    if (pass2 == null || pass2Valid) {
      return null;
    } else {
      return 'Senhas não coincidem';
    }
  }

  @computed
  bool get isFormValid => nameValid && emailValid && pass1Valid && pass2Valid;

  @computed
  VoidCallback? get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  bool loggedIn = false;

  @action
  Future<void> _signUp() async {
    loading = true;
    error = null;

    final user = User(
      name: name!,
      email: email!,
      password: pass1!,
    );

    try {
      final createdUser = await UserRepository().signUp(user);
      final userMapped = User.fromParse(createdUser);
      loggedIn = true;
      GetIt.I<UserManagerStore>().setUser(userMapped);
    } catch (e) {
      error = e.toString();
    }

    loading = false;
  }
}