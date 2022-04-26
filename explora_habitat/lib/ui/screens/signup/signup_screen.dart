import 'package:explora_habitat/services/stores/signup_store.dart';
import 'package:explora_habitat/ui/screens/base/base_screen.dart';
import 'package:explora_habitat/ui/widgets/custom_form_field.dart';
import 'package:explora_habitat/ui/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignupStore signupStore = SignupStore();

  @override
  void initState() {
    super.initState();
    when(
      (_) => signupStore.loggedIn,
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
        title: const Text('Cadastro'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Observer(
                            builder: (_) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: ErrorIndicator(
                                message: signupStore.error,
                              ),
                            ),
                          ),
                          Observer(
                            builder: (_) => CustomFormField(
                              enabled: !signupStore.loading,
                              labelText: 'Nome',
                              errorText: signupStore.nameError,
                              inputType: TextInputType.text,
                              onChanged: signupStore.setName,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Observer(
                            builder: (_) => CustomFormField(
                              enabled: !signupStore.loading,
                              labelText: 'E-mail',
                              errorText: signupStore.emailError,
                              inputType: TextInputType.emailAddress,
                              onChanged: signupStore.setEmail,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Observer(
                            builder: (_) => CustomFormField(
                              enabled: !signupStore.loading,
                              obscure: true,
                              labelText: 'Senha',
                              errorText: signupStore.pass1Error,
                              inputType: TextInputType.text,
                              onChanged: signupStore.setPass1,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Observer(
                            builder: (_) => CustomFormField(
                              enabled: !signupStore.loading,
                              obscure: true,
                              labelText: 'Confirmar Senha',
                              errorText: signupStore.pass2Error,
                              inputType: TextInputType.text,
                              onChanged: signupStore.setPass2,
                            ),
                          ),
                          Observer(
                            builder: (_) => Container(
                              height: 40,
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 12),
                              child: MaterialButton(
                                disabledColor: Colors.orange.withAlpha(120),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                color: Colors.orange,
                                child: signupStore.loading
                                    ? const CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : const Text('Cadastrar'),
                                textColor: Colors.white,
                                elevation: 0,
                                onPressed: signupStore.signUpPressed,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Ja tem uma conta? ',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.green,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
