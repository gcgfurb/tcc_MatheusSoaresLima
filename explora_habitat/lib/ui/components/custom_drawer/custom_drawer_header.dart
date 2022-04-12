import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class CustomDrawerHeader extends StatelessWidget {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: darkGreen,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userManagerStore.isLoggedIn
                        ? userManagerStore.user!.name
                        : 'Acesse sua conta agora!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    userManagerStore.isLoggedIn
                        ? userManagerStore.user!.email
                        : 'Clique aqui',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
