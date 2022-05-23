import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/constants/constants_style.dart';
import 'package:explora_habitat/services/models/user.dart';
import 'package:explora_habitat/services/stores/user_manager_store.dart';
import 'package:explora_habitat/services/stores/user_store.dart';
import 'package:explora_habitat/ui/screens/base/base_screen.dart';
import 'package:explora_habitat/ui/screens/login/login_screen.dart';
import 'package:explora_habitat/ui/widgets/access_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserStore userStore = UserStore();
  final User currentUser = GetIt.I<UserManagerStore>().user!;

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
                'Bem vindo de volta!',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.greenAccent.withAlpha(120),
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.lightGreen,
                              child: Icon(
                                Icons.person_rounded,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              currentUser.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              currentUser.email,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Observer(
                          builder: (_) => AccessButton(
                            title: 'Continuar',
                            onPressed: () => userStore.enter(currentUser).then(
                                  (value) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => BaseScreen(),
                                    ),
                                  ),
                                ),
                            loading: false,
                          ),
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
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginScreen(),
                        ),
                      ),
                      child: const Text(
                        'Entrar com outra conta',
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
