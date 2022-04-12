import 'package:explora_habitat/services/repositories/parse_repository/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

enum UserType {
  clubista,
  mediador,
}

class User {
  String? id;
  String name;
  String email;
  String password;
  UserType type;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    required this.name,
    required this.email,
    this.password = '',
    this.type = UserType.clubista,
    this.createdAt,
    this.updatedAt,
  });

  User.fromParse(ParseUser parseUser)
      : id = parseUser.objectId,
        name = parseUser.get(keyUserName),
        email = parseUser.get(keyUserEmail),
        type = UserType.values[parseUser.get(keyUserType)],
        password = '',
        createdAt = parseUser.createdAt,
        updatedAt = parseUser.updatedAt;
}
