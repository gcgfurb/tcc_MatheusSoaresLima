import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/enum/theme_status.dart';
import 'package:explora_habitat/services/repositories/parse_repository/objective_repository.dart';
import 'package:explora_habitat/services/repositories/parse_repository/parse_errors.dart';
import 'package:explora_habitat/services/repositories/parse_repository/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ThemeRepository {
  Future<void> save(ThemeExplora theme) async {
    final parseUser = await ParseUser.currentUser() as ParseUser;

    final themeObject = ParseObject(keyThemeTable);

    final parseAcl = ParseACL(owner: parseUser);
    parseAcl.setPublicReadAccess(allowed: true);
    parseAcl.setPublicWriteAccess(allowed: false);
    themeObject.setACL(parseAcl);

    themeObject.set<String>(keyThemeTitle, theme.title);
    themeObject.set<String>(keyThemeDescription, theme.description);
    themeObject.set<ParseUser>(keyThemeCreator, parseUser);
    themeObject.set<String>(keyThemeStatus, theme.status.getStringValue());

    var response = await themeObject.save();
    if (response.success) {
      theme.id = response.result.objectId;
      for (var objective in theme.objectives) {
        await ObjectiveRepository().save(objective, theme.id!);
      }
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
