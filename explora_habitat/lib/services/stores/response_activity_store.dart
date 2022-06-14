import 'dart:typed_data';

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
  _ResponseActivityStore(this.activity,
      {this.readOnly = false, ResponseActivity? response}) {
    if (activity.responsesActivity.isNotEmpty) {
      var clonedResponse = response ?? activity.responsesActivity.first.clone();
      id = clonedResponse.id;
      images = ObservableList.of(clonedResponse.images);
      videos = ObservableList.of(clonedResponse.videos);
      drawings = ObservableList.of(clonedResponse.drawings);
      audios = ObservableList.of(clonedResponse.audios);
      customFields = ObservableList.of(clonedResponse.customFields);
    } else {
      var clonedActivity = activity.cloneWithResponse();
      customFields = ObservableList.of(clonedActivity.customFields);
    }
  }

  @observable
  Activity activity;

  @observable
  String? id;

  @observable
  bool readOnly;

  @observable
  bool loading = false;

  ObservableList images = ObservableList();
  ObservableList videos = ObservableList();
  ObservableList drawings = ObservableList();
  ObservableList audios = ObservableList();
  ObservableList<CustomField> customFields = ObservableList();

  @action
  Future<void> saveResponse() async {
    loading = true;

    ResponseActivity responseActivity = ResponseActivity();
    responseActivity.id = id;
    responseActivity.images = images;
    responseActivity.videos = videos;
    responseActivity.audios = audios;
    responseActivity.drawings = audios;
    responseActivity.customFields = customFields;

    var position = await GeolocatorManager().getCurrentPosition();

    responseActivity.latitude = position.latitude;
    responseActivity.longitude = position.longitude;

    activity.responsesActivity = [responseActivity];
    activity.status = ActivityStatus.completed;

    loading = true;
  }
}
