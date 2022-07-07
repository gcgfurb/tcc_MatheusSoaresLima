import 'package:explora_habitat/services/models/user.dart';
import 'package:explora_habitat/services/repositories/parse_repository/parse_errors.dart';
import 'package:explora_habitat/services/repositories/parse_repository/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserRepository {
  Future<ParseUser> signUp(User user) async {
    final parseUser = ParseUser(
      user.email,
      user.password,
      user.email,
    );

    parseUser.set<String>(keyUserName, user.name);

    final response = await parseUser.signUp();

    if (response.success) {
      return response.result;
    } else {
      return Future.error(
          ParseErrors.getDescription(response.error?.code ?? -1));
    }
  }

  Future<ParseUser> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, email);

    final response = await parseUser.login();

    if (response.success) {
      return response.result;
    } else {
      return Future.error(
          ParseErrors.getDescription(response.error?.code ?? -1));
    }
  }

  Future<ParseUser?> lastUser() async {
    return await ParseUser.currentUser();
  }

  Future<ParseUser?> currentUser() async {
    final ParseUser? parseUser = await ParseUser.currentUser();

    if (parseUser != null && parseUser.sessionToken != null) {
      final ParseResponse? response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken!);
      if (response?.success != null && response?.result != null) {
        return response?.result;
      } else {
        await parseUser.logout();
      }
    }
    return null;
  }

  Future<void> logout() async {
    final ParseUser parseUser = await ParseUser.currentUser() as ParseUser;
    if (parseUser.sessionToken != null) {
      await parseUser.logout();
    }
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail) ?? parseUser.username!,
      createdAt: parseUser.createdAt,
      updatedAt: parseUser.updatedAt,
    );
  }

  Future<User> findById(String objectId) async {
    QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseUser.forQuery())
          ..whereEqualTo("objectId", objectId);

    ParseResponse response = await parseQuery.query();

    if (response.success) {
      var parseObject = response.results!.first;
      return mapParseToUser(parseObject);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
