import 'dart:io';

import 'package:explora_habitat/services/enum/theme_status.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/repositories/parse_repository/user_repository.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../repositories/parse_repository/theme_repository.dart';

part 'responses_theme_store.g.dart';

class ResponsesThemeStore = _ResponsesThemeStore with _$ResponsesThemeStore;

abstract class _ResponsesThemeStore with Store {
  @observable
  bool loading = false;

  late final Box<ThemeExplora> completedThemesBox;

  Future<void> initThemesBox(String userId) async {
    await Permission.storage.request().isGranted;
    final Directory result = await getApplicationSupportDirectory();
    Hive.init(result.path);
    completedThemesBox =
        await Hive.openBox<ThemeExplora>('complete_themes.$userId');
  }

  @action
  Future<void> syncThemes() async {
    loading = true;
    await completedThemesBox.clear();
    var currentUser = await UserRepository().currentUser();
    var themes = await ThemeRepository()
        .findAllByCreatorAndStatusCompleted(currentUser!);
    completedThemesBox.addAll(themes);
    loading = false;
  }
}
