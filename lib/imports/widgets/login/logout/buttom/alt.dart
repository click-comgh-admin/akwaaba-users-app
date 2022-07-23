import 'package:akwaaba_user_app/imports/functions/login/main.dart';
import 'package:akwaaba_user_app/view_models/users/login/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AltLogoutButtomWidget extends StatelessWidget {
  const AltLogoutButtomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    autoLogout(context);
    UserLoginViewModel userLoginViewModelCtx =
        context.watch<UserLoginViewModel>();
    return GestureDetector(
      onTap: () async {
        await userLoginViewModelCtx.logout();
        userLoginViewModelCtx.nF();
        userLoginViewModelCtx.nF();
        userLoginViewModelCtx.nF();
      },
      child: ListTile(
        leading: const Text("Logout"),
        trailing: Icon(
          color: Theme.of(context).iconTheme.color,
          Icons.logout_sharp,
        ),
      ),
    );
  }
}
