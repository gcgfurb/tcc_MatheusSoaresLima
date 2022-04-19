import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/stores/page_store.dart';
import 'package:explora_habitat/services/stores/theme_store.dart';
import 'package:explora_habitat/services/stores/user_manager_store.dart';
import 'package:explora_habitat/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(const MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'H71NRAQl1vvE1OGcE0qMv2mfEmWdDkKxVnqKjnXB',
    'https://parseapi.back4app.com/',
    clientKey: 'DfeQvBBYsaqYl5S7LwtVDtwwZ7vQifdLe8rUg1Us',
    autoSendSessionId: true,
    debug: true,
  );
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(ThemeStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExploraHabitat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: darkGreen,
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: darkGreen),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: darkGreen
          )),
      home: LoginScreen(),
    );
  }
}
