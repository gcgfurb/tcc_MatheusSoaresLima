import 'package:hive/hive.dart';

part 'activity_status.g.dart';

@HiveType(typeId: 6)
enum ActivityStatus {
  @HiveField(0)
  pending('pending'),

  @HiveField(1)
  completed('completed');

  const ActivityStatus(this.value);
  final String value;
}
