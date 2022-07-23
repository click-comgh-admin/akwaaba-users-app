import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/view_models/users/login/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

autoLogin(BuildContext context) {
  UserLoginViewModel loginViewModelCtx = context.watch<UserLoginViewModel>();
  loginViewModelCtx.isLoggedIn.then((isLoggedIn) {
    if (isLoggedIn) AutoRouter.of(context).replace(const HomeRouteWeb());
  });
}

autoLogout(BuildContext context) {
  UserLoginViewModel loginViewModelCtx = context.watch<UserLoginViewModel>();
  loginViewModelCtx.isLoggedIn.then((isLoggedIn) {
    if (!isLoggedIn) AutoRouter.of(context).replace(const LoginRouteWeb());
  });
}
