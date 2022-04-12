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
    parseUser.set<int>(keyUserType, user.type.index);

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

  Future<ParseUser?> currentUser() async {
    final ParseUser? parseUser = await ParseUser.currentUser() as ParseUser;

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
}
