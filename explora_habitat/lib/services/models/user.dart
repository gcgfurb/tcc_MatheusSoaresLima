import 'package:explora_habitat/services/repositories/parse_repository/table_keys.dart';
import 'package:hive/hive.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

part 'user.g.dart';


@HiveType(typeId: 2)
class User extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String password;

  @HiveField(4)
  DateTime? createdAt;

  @HiveField(5)
  DateTime? updatedAt;

  User({
    this.id,
    required this.name,
    required this.email,
    this.password = '',
    this.createdAt,
    this.updatedAt,
  });

  User.fromParse(ParseUser parseUser)
      : id = parseUser.objectId,
        name = parseUser.get(keyUserName),
        email = parseUser.get(keyUserEmail),
        password = '',
        createdAt = parseUser.createdAt,
        updatedAt = parseUser.updatedAt;
}
