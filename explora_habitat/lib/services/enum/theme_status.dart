import 'package:hive/hive.dart';

part 'theme_status.g.dart';

@HiveType(typeId: 1)
enum ThemeStatus {
  @HiveField(0)
  pending('pending'),

  @HiveField(1)
  inProgress('inProgress'),

  @HiveField(2)
  completed('completed');

  const ThemeStatus(this.value);
  final String value;
}

extension ThemeStatusExtension on ThemeStatus {

  static ThemeStatus getFromString(String type) {
    switch (type) {
      case 'pending':
        return ThemeStatus.pending;
      case 'inProgress':
        return ThemeStatus.inProgress;
      case 'completed':
        return ThemeStatus.completed;
      default:
        throw Exception('Tipo não mapeado');
    }
  }
}
