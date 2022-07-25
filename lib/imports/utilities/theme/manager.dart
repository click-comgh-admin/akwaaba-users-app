import 'package:akwaaba_user_app/imports/database/settings/theme/main.dart';
import 'package:akwaaba_user_app/models/settings/theme/main.dart';
import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final ThemeSettingsDatabase _themeSettingsDatabase = ThemeSettingsDatabase();
  final int _memberId = 0;

  ThemeMode get themeMode {
    getTheme!.then((value) {
      if (value == null) {
        _themeMode = ThemeMode.light;
      } else {
        bool inDarkMode = value.inDarkMode;
        if (inDarkMode) {
          _themeMode = ThemeMode.dark;
        } else {
          _themeMode = ThemeMode.light;
        }
      }
      return _themeMode;
    });
    return _themeMode;
  }

  int get memberId => _memberId;

  set setMemberId(int memberId) {
    // print({"memberId-theme": memberId});
    memberId = memberId;
  }

  toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    theme = SettingsTheme(
      memberId: memberId,
      inDarkMode: isDark,
    );
    notifyListeners();
  }

  set theme(SettingsTheme theme) {
    _themeSettingsDatabase.setTheme(theme);
  }

  Future<SettingsTheme?>? get getTheme async =>
      await _themeSettingsDatabase.getTheme(memberId);
}
