import 'package:akwaaba_user_app/imports/database/base/main.dart';

class CurrentFirebaseTokenDatabase extends HiveDb<String> {
  @override
  String boxName = "db-firebase-current-token";
  int tokenId = 1;

  Future<String?>? getToken() async {
    List<String> tokens = await values;
    // print({"tokens": tokens});
    if (tokens.isNotEmpty) {
      String? returnToken;
      for (var token in tokens) {
        if (token.isNotEmpty) {
          returnToken = token;
        }
      }
      return returnToken;
    }
    return null;
  }

  Future<bool> setToken(String token) async {
    // print({"Future<bool> setToken": token});
    final token2 = await getToken();
    if (token2 == null) {
      return await _addToken(token);
    } else {
      return await _updateToken(token);
    }
  }

  Future<bool> _addToken(String token) async {
    // print({"token_addToken": token});
    await add(boxData: token);
    return true;
  }

  Future<bool> _updateToken(String token) async {
    // print({"token_updateToken": token});
    await update(id: tokenId, boxData: token);
    return true;
  }

  Future<bool> removeToken() async {
    await empty();
    return true;
  }
}
