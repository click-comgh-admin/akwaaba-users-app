import 'package:akwaaba_user_app/imports/utilities/theme/manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSettingsWidget extends StatefulWidget {
  final bool isSwitch;
  const ThemeSettingsWidget({
    Key? key,
    this.isSwitch = false,
  }) : super(key: key);

  @override
  State<ThemeSettingsWidget> createState() => _ThemeSettingsWidgetState();
}

class _ThemeSettingsWidgetState extends State<ThemeSettingsWidget> {
  final IconData _iconLight = Icons.wb_sunny;
  final IconData _iconDark = Icons.nights_stay;
  @override
  Widget build(BuildContext context) {
    ThemeManager themeManagerCtx = context.watch<ThemeManager>();
    if (widget.isSwitch) {
      return _switch(themeManagerCtx);
    } else {
      return _button(themeManagerCtx);
    }
  }

  Switch _switch(ThemeManager themeManagerCtx) {
    return Switch(
      value: themeManagerCtx.themeMode == ThemeMode.dark,
      onChanged: (newValue) {
        themeManagerCtx.toggleTheme(newValue);
      },
    );
  }

  IconButton _button(ThemeManager themeManagerCtx) {
    bool themeBool = themeManagerCtx.themeMode == ThemeMode.dark;

    return IconButton(
      onPressed: () {
        themeManagerCtx.toggleTheme(!themeBool);
      },
      icon: Icon(
        color: themeBool
            ? ThemeData.light().cardColor
            : ThemeData.dark().cardColor,
        themeBool ? _iconDark : _iconLight,
      ),
    );
  }
}
