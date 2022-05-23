import 'dart:io';

import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

part 'synced_theme_store.g.dart';

class SyncedThemeStore = _SyncedThemeStore with _$SyncedThemeStore;

abstract class _SyncedThemeStore with Store {

  late final Box<ThemeExplora> syncedThemeBox;

  void add(ThemeExplora theme) => syncedThemeBox.add(theme);

  Future<void> initThemesBox(String userId) async {
    await Permission.storage.request().isGranted;
    final Directory result = await getApplicationSupportDirectory();
    Hive.init(result.path);
    syncedThemeBox = await Hive.openBox<ThemeExplora>('sync_themes.$userId');
  }

}