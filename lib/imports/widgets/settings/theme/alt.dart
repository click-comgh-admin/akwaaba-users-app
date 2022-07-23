import 'package:akwaaba_user_app/imports/utilities/theme/manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AltThemeSettingsWidget extends StatelessWidget {
  const AltThemeSettingsWidget({Key? key}) : super(key: key);
  final IconData _iconLight = Icons.wb_sunny;
  final IconData _iconDark = Icons.nights_stay;

  @override
  Widget build(BuildContext context) {
    ThemeManager themeManagerCtx = context.watch<ThemeManager>();

    bool themeBool = themeManagerCtx.themeMode == ThemeMode.dark;

    return GestureDetector(
      onTap: () {
        themeManagerCtx.toggleTheme(!themeBool);
      },
      child: ListTile(
        leading: const Text("Toggle Theme"),
        trailing: Icon(
          color: Theme.of(context).iconTheme.color,
          themeBool ? _iconDark : _iconLight,
        ),
      ),
    );
  }
}
