import 'package:explora_habitat/helpers/geolocator_manager.dart';
import 'package:explora_habitat/services/enum/activity_status.dart';
import 'package:explora_habitat/services/models/activity.dart';
import 'package:explora_habitat/services/models/custom_field.dart';
import 'package:explora_habitat/services/models/response_activity.dart';
import 'package:mobx/mobx.dart';

part 'response_activity_store.g.dart';

class ResponseActivityStore = _ResponseActivityStore
    with _$ResponseActivityStore;

abstract class _ResponseActivityStore with Store {

  @observable
  Activity activity;

  @observable
  bool loading = false;

  ObservableList images = ObservableList();
  ObservableList videos = ObservableList();
  ObservableList drawings = ObservableList();
  ObservableList audios = ObservableList();
  ObservableList<CustomField> customFields = ObservableList();

  _ResponseActivityStore(this.activity);

  @action
  Future<void> saveResponse() async {

    loading = true;

    ResponseActivity responseActivity = ResponseActivity();
    responseActivity.images = images;
    responseActivity.videos = videos;
    responseActivity.audios = audios;
    responseActivity.drawings = audios;
    responseActivity.customFields = customFields;

    var position = await GeolocatorManager().getCurrentPosition();

    responseActivity.latitude = position.latitude;
    responseActivity.longitude = position.latitude;

    activity.responseActivity = responseActivity;
    activity.status = ActivityStatus.completed;

    loading = true;
  }
}
