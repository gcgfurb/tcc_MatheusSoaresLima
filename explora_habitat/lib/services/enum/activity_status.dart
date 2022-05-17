import 'package:hive/hive.dart';

part 'activity_status.g.dart';

@HiveType(typeId: 6)
enum ActivityStatus {
  @HiveField(0)
  pending,

  @HiveField(1)
  completed,
}

extension ActivityStatusExtension on ActivityStatus {
  String getValue() {
    switch (this) {
      case ActivityStatus.pending:
        return 'pending';
      case ActivityStatus.completed:
        return 'completed';
    }
  }
}
