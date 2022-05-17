import 'dart:io';

import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/repositories/parse_repository/theme_repository.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  ObservableList<ThemeExplora> themes = ObservableList();

  late final Box<ThemeExplora> myThemesBox;

  Future<void> initThemesBox(String userId) async {
    await Permission.storage.request().isGranted;
    final Directory result = await getApplicationSupportDirectory();
    Hive.init(result.path);
    myThemesBox = await Hive.openBox<ThemeExplora>('themes.$userId');
  }

  void setThemes(List<ThemeExplora> values) =>
      themes = ObservableList.of(values);

  void add(ThemeExplora theme) => myThemesBox.add(theme);

  void update(int index, ThemeExplora theme) => myThemesBox.put(index, theme);

  void delete(int index) {
    var theme = myThemesBox.get(index);
    if (theme!.id == null) {
      myThemesBox.delete(index);
    } else {
      throw Exception('Não é possível excluir um tema já sincronizado!');
    }
  }

  void copy(int index) {
    var theme = myThemesBox.get(index);
    var clonedTheme = theme!.clone();
    add(clonedTheme);
  }

  Future<void> sync(int index) async {
    var theme = myThemesBox.get(index);
    await ThemeRepository().save(theme!);
    update(index, theme);
  }
}
