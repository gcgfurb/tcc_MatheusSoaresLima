import 'package:explora_habitat/services/enum/theme_status.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/repositories/parse_repository/objective_repository.dart';
import 'package:explora_habitat/services/repositories/parse_repository/parse_errors.dart';
import 'package:explora_habitat/services/repositories/parse_repository/table_keys.dart';
import 'package:explora_habitat/services/repositories/parse_repository/user_repository.dart';
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
    themeObject.set<String>(keyThemeStatus, theme.status.value);

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

  Future<ThemeExplora> findById(String objectId) async {
    QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(keyThemeTable))
          ..whereEqualTo("objectId", objectId);

    ParseResponse response = await parseQuery.query();

    if (response.success) {
      if (response.results != null) {
        var parseObject = response.results!.first;
        ThemeExplora theme = mapParseToTheme(parseObject);
        theme.objectives =
            await ObjectiveRepository().findAllByTheme(parseObject);
        ParseUser creator = parseObject.get<ParseUser>(keyThemeCreator)!;
        theme.creator = await UserRepository().findById(creator.objectId!);

        return theme;
      } else {
        return Future.error('Nenhum tema com código $objectId encontrado!');
      }
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<List<ThemeExplora>> findAllByCreator(ParseUser parseUser) async {
    QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(keyThemeTable))
          ..whereEqualTo("creator", parseUser.toPointer());

    ParseResponse response = await parseQuery.query();

    if (response.success) {
      if (response.results != null) {
        List<ThemeExplora> themes = [];
        for (var parseObject in response.results!) {
          ThemeExplora theme = mapParseToTheme(parseObject);
          theme.objectives =
              await ObjectiveRepository().findAllByTheme(parseObject);
          ParseUser creator = parseObject.get<ParseUser>(keyThemeCreator)!;
          theme.creator = await UserRepository().findById(creator.objectId!);

          themes.add(theme);
        }
        return themes;
      } else {
        return Future.error('Nenhum tema sincronizado encontrado!');
      }
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  ThemeExplora mapParseToTheme(ParseObject parseObject) {
    return ThemeExplora(
      id: parseObject.objectId!,
      title: parseObject.get<String>(keyThemeTitle)!,
      description: parseObject.get<String>(keyThemeDescription)!,
      status: ThemeStatusExtension.getFromString(
          parseObject.get<String>(keyThemeStatus)!),
      objectives: [],
    );
  }

  Future<List<ThemeExplora>> findAllByCreatorAndStatusCompleted(
      ParseUser parseUser) async {
    QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(keyThemeTable))
          ..whereEqualTo("creator", parseUser.toPointer())
          ..whereEqualTo("status", ThemeStatus.completed.value);

    ParseResponse response = await parseQuery.query();

    if (response.success) {
      if (response.results != null) {
        List<ThemeExplora> themes = [];
        for (var parseObject in response.results!) {
          ThemeExplora theme = mapParseToTheme(parseObject);
          theme.objectives =
              await ObjectiveRepository().findAllByTheme(parseObject, complete: true);
          ParseUser creator = parseObject.get<ParseUser>(keyThemeCreator)!;
          theme.creator = await UserRepository().findById(creator.objectId!);

          themes.add(theme);
        }
        return themes;
      } else {
        return Future.error('Nenhum tema sincronizado encontrado!');
      }
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
