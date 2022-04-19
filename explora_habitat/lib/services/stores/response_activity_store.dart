import 'package:explora_habitat/services/models/activity.dart';
import 'package:mobx/mobx.dart';

part 'response_activity_store.g.dart';

class ResponseActivityStore = _ResponseActivityStore
    with _$ResponseActivityStore;

abstract class _ResponseActivityStore with Store {

  Activity activity;

  ObservableList images = ObservableList();

  _ResponseActivityStore(this.activity);
}
