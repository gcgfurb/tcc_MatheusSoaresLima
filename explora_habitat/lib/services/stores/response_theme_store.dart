import 'package:explora_habitat/services/enum/response_activity_status.dart';
import 'package:explora_habitat/services/enum/theme_status.dart';
import 'package:explora_habitat/services/models/theme_explora.dart';
import 'package:explora_habitat/services/stores/synced_themes_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'response_theme_store.g.dart';

class ResponseThemeStore = _ResponseThemeStore with _$ResponseThemeStore;

abstract class _ResponseThemeStore with Store {
  @observable
  ThemeExplora theme;

  @observable
  int key;

  @observable
  bool readOnly;

  @observable
  bool completed;

  @observable
  bool isExpanded = false;

  @action
  void toggleExpanded() => isExpanded = !isExpanded;

  @action
  Future<void> saveResponse() async {
    theme.status = ThemeStatus.inProgress;
    theme.isResponsesPending = theme.objectives.any((objective) =>
        objective.activities.any((activity) =>
            activity.responsesActivity.isEmpty ||
            activity.responsesActivity.any((response) =>
                response.status == ResponseActivityStatus.pending)));
    await GetIt.I<SyncedThemesStore>().update(key, theme);
  }

  _ResponseThemeStore({
    required this.theme,
    required this.key,
    this.readOnly = false,
    this.completed = false,
  });
}
