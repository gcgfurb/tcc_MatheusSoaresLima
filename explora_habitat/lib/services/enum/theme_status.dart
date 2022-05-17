import 'package:hive/hive.dart';

part 'theme_status.g.dart';

@HiveType(typeId: 1)
enum ThemeStatus {
  @HiveField(0)
  pending,

  @HiveField(1)
  inProgress,

  @HiveField(2)
  completed,
}

extension ThemeStatusExtension on ThemeStatus {
  String getStringValue() {
    switch (this) {
      case ThemeStatus.pending:
        return 'pending';
      case ThemeStatus.inProgress:
        return 'inProgress';
      case ThemeStatus.completed:
        return 'completed';
    }
  }
}
