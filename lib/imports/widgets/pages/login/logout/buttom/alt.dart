import 'package:akwaaba_user_app/imports/functions/login/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
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
        leading: Text(
          "Logout",
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                  context,
                ),
              ),
        ),
        trailing: Icon(
          color: Theme.of(context).iconTheme.color,
          Icons.logout_sharp,
        ),
      ),
    );
  }
}
