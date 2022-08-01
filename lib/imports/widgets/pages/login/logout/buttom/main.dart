import 'package:akwaaba_user_app/imports/functions/login/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/manager.dart';
import 'package:akwaaba_user_app/view_models/users/login/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutButtonLoginWidget extends StatelessWidget {
  const LogoutButtonLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    autoLogout(context);
    UserLoginViewModel userLoginViewModelCtx =
        context.watch<UserLoginViewModel>();
    ThemeManager themeManagerCtx = context.watch<ThemeManager>();
    bool themeBool = themeManagerCtx.themeMode == ThemeMode.dark;
    return IconButton(
      onPressed: () async {
        await userLoginViewModelCtx.logout();
        userLoginViewModelCtx.nF();
      },
      icon: Icon(
        color: themeBool
            ? ThemeData.light().cardColor
            : ThemeData.dark().cardColor,
        Icons.logout_sharp,
      ),
    );
  }
}
