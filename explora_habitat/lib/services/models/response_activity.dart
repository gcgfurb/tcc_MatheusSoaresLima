import 'package:explora_habitat/services/models/custom_field.dart';

class ResponseActivity {
  List audios = [];
  List images = [];
  List videos = [];
  List drawings = [];

  double? latitude;
  double? longitude;

  List<CustomField> customFields = [];
}