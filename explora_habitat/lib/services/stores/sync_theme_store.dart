import 'package:explora_habitat/services/repositories/parse_repository/theme_repository.dart';
import 'package:explora_habitat/services/stores/synced_themes_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'sync_theme_store.g.dart';

class SyncThemeStore = _SyncThemeStore with _$SyncThemeStore;

abstract class _SyncThemeStore with Store {
  @observable
  bool loading = false;

  @observable
  String? code;

  @computed
  bool get codeValid => code != null && code!.replaceAll(' ', '').isNotEmpty;

  @action
  void setCode(String value) => code = value;

  @observable
  String? error;

  @observable
  String? syncError;

  @computed
  VoidCallback? get syncTheme => codeValid ? _sync : null;

  @action
  Future<void> _sync() async {
    loading = true;
    syncError = null;
    error = null;

    var codeValid = code!.replaceAll(' ', '');
    var syncedThemeStore = GetIt.I<SyncedThemesStore>();

    bool isOnBox = syncedThemeStore.syncedThemeBox.isNotEmpty &&
        syncedThemeStore.syncedThemeBox.values
            .any((theme) => theme.id == codeValid);
    if (!isOnBox) {
      try {
        var themeSynced = await ThemeRepository().findById(codeValid);
        syncedThemeStore.add(themeSynced);
      } catch (e) {
        syncError = e.toString();
      }
    } else {
      error = 'Tema já está sincronizado';
    }
    loading = false;
  }
}
