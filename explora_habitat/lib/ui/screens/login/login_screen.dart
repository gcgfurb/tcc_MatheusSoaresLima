import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/stores/login_store.dart';
import 'package:explora_habitat/ui/screens/base/base_screen.dart';
import 'package:explora_habitat/ui/screens/signup/signup_screen.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:explora_habitat/ui/widgets/access_button.dart';
import 'package:explora_habitat/ui/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore loginStore = LoginStore();

  @override
  void initState() {
    super.initState();
    when(
      (_) => loginStore.loggedIn,
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BaseScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Bem vindo',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const Text(
                'Entre para acessar sua conta',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32),
                alignment: Alignment.center,
                child: Card(
                  elevation: 8,
                  shape: kRoundedRectangleBorder,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Observer(
                          builder: (_) => ErrorIndicator(
                            message: loginStore.error,
                          ),
                        ),
                        Observer(
                          builder: (_) => CustomFormField(
                            enabled: !loginStore.loading,
                            labelText: 'E-mail',
                            errorText: loginStore.emailError,
                            inputType: TextInputType.emailAddress,
                            onChanged: loginStore.setEmail,
                          ),
                        ),
                        Observer(
                          builder: (_) => CustomFormField(
                            enabled: !loginStore.loading,
                            labelText: 'Senha',
                            errorText: loginStore.passwordError,
                            inputType: TextInputType.text,
                            onChanged: loginStore.setPassoword,
                            obscure: true,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Observer(
                          builder: (_) => AccessButton(
                              title: 'Entrar',
                              onPressed: loginStore.loginPressed,
                              loading: loginStore.loading),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 0),
                          child: const Text(
                            'Ou',
                            textAlign: TextAlign.center,
                            style: kLabelStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset(
                                'images/google-icon.png',
                              ),
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircleAvatar(
                              child: Image.asset(
                                'images/facebook-icon.png',
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      'Não tem uma conta? ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SignUpScreen(),
                        ),
                      ),
                      child: const Text(
                        'Cadastre-se',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: green,
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
