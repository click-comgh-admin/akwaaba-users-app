import 'package:akwaaba_user_app/imports/database/base/main.dart';
import 'package:akwaaba_user_app/models/settings/theme/main.dart';

class ThemeSettingsDatabase extends HiveDb<SettingsTheme> {
  @override
  String boxName = "db-settings-theme";

  Future<SettingsTheme?>? getTheme(int memberId) async {
    return await get(id: memberId);
  }

  Future<bool> setTheme(SettingsTheme theme) async {
    final memberId = theme.memberId,
      theme2 = await getTheme(memberId);
    if (theme2 == null) {
      return await _addTheme(theme);
    } else {
      return await _updateTheme(memberId, theme);
    }
  }

  Future<bool> _addTheme(SettingsTheme theme) async {
    // print({"theme_addTheme": theme});
    await add(boxData: theme);
    return true;
  }

  Future<bool> _updateTheme(int memberId, SettingsTheme theme) async {
    // print({"theme_updateTheme": theme});
    await update(id: memberId, boxData: theme);
    return true;
  }

  Future<bool> removeTheme(int memberId) async {
    await deleteFrom(id: memberId);
    return true;
  }
}

