import 'package:akwaaba_user_app/imports/database/base/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';

class LoginUserModelDatabase extends HiveDb<UserLoginModel> {
  @override
  String boxName = "db-models-user-login";

  Future<UserLoginModel?>? getLogin() async {
    List<UserLoginModel> logins = await values;
    if (logins.isNotEmpty) {
      return logins.first;
    }
    return null;
  }

  Future<bool> setLogin(UserLoginModel login) async {
    final memberId = login.memberId!, login2 = await getLogin();
    if (login2 == null) {
      return await _addLogin(login);
    } else {
      return await _updateLogin(memberId, login);
    }
  }

  Future<bool> _addLogin(UserLoginModel login) async {
    // print({"login_addLogin": login});
    await add(boxData: login);
    return true;
  }

  Future<bool> _updateLogin(int memberId, UserLoginModel login) async {
    // print({"login_updateLogin": login});
    await update(id: memberId, boxData: login);
    return true;
  }

  Future<bool> removeLogin(int memberId) async {
    int? index = await getIndexFromMemberId(id: memberId);
    // print({"index": index});
    await deleteFrom(id: index);
    return true;
  }
}
