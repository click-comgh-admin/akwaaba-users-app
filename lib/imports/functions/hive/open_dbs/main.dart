import 'package:akwaaba_user_app/imports/database/models/users/connections/main.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/imports/database/settings/theme/main.dart';
import 'package:akwaaba_user_app/models/settings/theme/main.dart';
import 'package:akwaaba_user_app/models/users/connections/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:hive/hive.dart';

openHiveDbsFunction() async {
  await Hive.openBox<SettingsTheme>(ThemeSettingsDatabase().boxName); // 1
  await Hive.openBox<UserLoginModel>(LoginUserModelDatabase().boxName); // 2
  await Hive.openBox<UserConnectionsModel>(
      ConnectionsUserModelDatabase().boxName); // 3
}
