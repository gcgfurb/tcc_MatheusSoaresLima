// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_LoginStore.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: '_LoginStore.passwordValid'))
          .value;
  Computed<VoidCallback?>? _$loginPressedComputed;

  @override
  VoidCallback? get loginPressed => (_$loginPressedComputed ??=
          Computed<VoidCallback?>(() => super.loginPressed,
              name: '_LoginStore.loginPressed'))
      .value;

  late final _$emailAtom = Atom(name: '_LoginStore.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginStore.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LoginStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_LoginStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loggedInAtom =
      Atom(name: '_LoginStore.loggedIn', context: context);

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  late final _$_loginAsyncAction =
      AsyncAction('_LoginStore._login', context: context);

  @override
  Future<void> _login() {
    return _$_loginAsyncAction.run(() => super._login());
  }

  late final _$_LoginStoreActionController =
      ActionController(name: '_LoginStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassoword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassoword');
    try {
      return super.setPassoword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
loading: ${loading},
error: ${error},
loggedIn: ${loggedIn},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
loginPressed: ${loginPressed}
    ''';
  }
}
