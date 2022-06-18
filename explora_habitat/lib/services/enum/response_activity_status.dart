import 'package:hive/hive.dart';

part 'response_activity_status.g.dart';

@HiveType(typeId: 11)
enum ResponseActivityStatus {
  @HiveField(0)
  pending('pending'),

  @HiveField(1)
  completed('completed');

  const ResponseActivityStatus(this.value);
  final String value;
}
