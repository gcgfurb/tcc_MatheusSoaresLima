import 'package:explora_habitat/services/models/objetivo.dart';

class Tema {
  String? id;
  String title;
  String description;
  List<Objective> objetivos = [];

  Tema({
    this.id,
    required this.title,
    required this.description,
    this.objetivos = const [],
  });
}
