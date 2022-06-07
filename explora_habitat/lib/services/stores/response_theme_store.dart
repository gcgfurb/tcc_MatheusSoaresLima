import 'package:explora_habitat/services/enum/theme_status.dart';
import 'package:explora_habitat/services/models/response_activity.dart';
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
  bool isExpanded = false;

  @action
  void toggleExpanded() => isExpanded = !isExpanded;

  @computed
  List<ResponseActivity> get responses => List.of(
        theme.objectives.expand(
          (objective) => objective.activities.map(
            (activity) => activity.responsesActivity.first,
          ),
        ),
      );

  @action
  void saveResponse() {
    theme.status = ThemeStatus.inProgress;
    GetIt.I<SyncedThemesStore>().update(key, theme);
  }

  _ResponseThemeStore({
    required this.theme,
    required this.key,
  });
}
