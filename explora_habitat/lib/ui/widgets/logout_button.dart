import 'package:explora_habitat/services/stores/user_manager_store.dart';
import 'package:explora_habitat/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: const Icon(Icons.logout),
        onPressed: () {
          GetIt.I<UserManagerStore>().logout();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => LoginScreen(),
            ),
          );
        },
      ),
    );
  }
}
