import 'package:explora_habitat/constants/constants_colors.dart';
import 'package:explora_habitat/services/enum/activity_status.dart';
import 'package:explora_habitat/services/enum/activity_type.dart';
import 'package:explora_habitat/services/enum/field_type.dart';
import 'package:explora_habitat/services/enum/response_activity_status.dart';
import 'package:explora_habitat/services/enum/theme_status.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/models/objective.dart';
import 'package:explora_habitat/services/models/response_activity.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/models/user.dart';
import 'package:explora_habitat/services/stores/page_store.dart';
import 'package:explora_habitat/services/stores/user_manager_store.dart';
import 'package:explora_habitat/ui/screens/login/login_screen.dart';
import 'package:explora_habitat/ui/screens/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

const String appId = 'H71NRAQl1vvE1OGcE0qMv2mfEmWdDkKxVnqKjnXB';
const String serverUrl = 'https://parseapi.back4app.com/';
const String clientKey = 'DfeQvBBYsaqYl5S7LwtVDtwwZ7vQifdLe8rUg1Us';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  await initializeHive();
  setupLocators();
  runApp(const MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    appId,
    serverUrl,
    clientKey: clientKey,
    autoSendSessionId: true,
    debug: true,
  );
}

Future<void> initializeHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ActivityAdapter());
  Hive.registerAdapter(CustomFieldAdapter());
  Hive.registerAdapter(ObjectiveAdapter());
  Hive.registerAdapter(ResponseActivityAdapter());
  Hive.registerAdapter(ThemeExploraAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ActivityStatusAdapter());
  Hive.registerAdapter(ResponseActivityStatusAdapter());
  Hive.registerAdapter(ActivityTypeAdapter());
  Hive.registerAdapter(FieldTypeAdapter());
  Hive.registerAdapter(ThemeStatusAdapter());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetIt.I<UserManagerStore>().getLastUser(),
      builder: (_, value) => MaterialApp(
        title: 'ExploraHabitat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: darkGreen,
            textSelectionTheme:
                const TextSelectionThemeData(cursorColor: darkGreen),
            appBarTheme: const AppBarTheme(elevation: 0, color: darkGreen)),
        home: value.hasData ? UserScreen() : LoginScreen(),
      ),
    );
  }
}
