import 'dart:io';

import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/repositories/parse_repository/response_repository.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'synced_themes_store.g.dart';

class SyncedThemesStore = _SyncedThemesStore with _$SyncedThemesStore;

abstract class _SyncedThemesStore with Store {
  late final Box<ThemeExplora> syncedThemeBox;

  void add(ThemeExplora theme) => syncedThemeBox.add(theme);

  void delete(int key) => syncedThemeBox.delete(key);

  Future<void> update(int key, ThemeExplora theme) async => await syncedThemeBox.put(key, theme);

  Future<void> initThemesBox(String userId) async {
    await Permission.storage.request().isGranted;
    final Directory result = await getApplicationSupportDirectory();
    Hive.init(result.path);
    syncedThemeBox = await Hive.openBox<ThemeExplora>('synced_themes.$userId');
  }

  @observable
  bool loading = false;

  @action
  Future<void> sync(int key) async {
    loading = true;
    var theme = syncedThemeBox.get(key);
    var activities =
        theme!.objectives.expand((objective) => objective.activities);

    for (Activity activity in activities) {
      await ResponseRepository()
          .save(activity.responsesActivity.first, activity.id!);
    }
    await update(key, theme);
    loading = false;
  }
}
