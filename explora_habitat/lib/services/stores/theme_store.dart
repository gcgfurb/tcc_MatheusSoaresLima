import 'dart:io';

import 'package:explora_habitat/services/enum/theme_status.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/repositories/parse_repository/theme_repository.dart';
import 'package:explora_habitat/services/repositories/parse_repository/user_repository.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  bool loading = false;

  @observable
  bool syncing = false;


  late final Box<ThemeExplora> myThemesBox;

  Future<void> initThemesBox(String userId) async {
    await Permission.storage.request().isGranted;
    final Directory result = await getApplicationSupportDirectory();
    Hive.init(result.path);
    myThemesBox = await Hive.openBox<ThemeExplora>('themes_explora.$userId');
  }

  Future<void> add(ThemeExplora theme) async => await myThemesBox.add(theme);

  Future<void> update(int index, ThemeExplora theme) async =>
      await myThemesBox.put(index, theme);

  Future<void> delete(int index) async => await myThemesBox.delete(index);

  Future<void> copy(int index) async {
    var theme = myThemesBox.get(index);
    var clonedTheme = theme!.clone();
    clonedTheme.title = "${clonedTheme.title} - Cópia";
    await add(clonedTheme);
  }

  @action
  Future<void> sync(int key) async {
    syncing = true;
    var theme = myThemesBox.get(key);
    await ThemeRepository().save(theme!);
    await update(key, theme);
    syncing = false;
  }

  Future<void> finish(int index) async {
    var theme = myThemesBox.get(index);
    theme!.status = ThemeStatus.completed;
    await ThemeRepository().updateStatus(theme.id!, theme.status);
    await update(index, theme);
  }

  @action
  Future<void> syncThemes() async {
    loading = true;
    await myThemesBox.clear();
    var currentUser = await UserRepository().currentUser();
    var themes = await ThemeRepository().findAllByCreator(currentUser!);
    myThemesBox.addAll(themes);
    loading = false;
  }
}
