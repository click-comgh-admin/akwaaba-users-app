import 'package:akwaaba_user_app/imports/utilities/constants/form/main.dart';
import 'package:akwaaba_user_app/imports/widgets/login/form/main.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginViewsWeb extends StatefulWidget {
  const LoginViewsWeb({Key? key}) : super(key: key);

  @override
  State<LoginViewsWeb> createState() => _LoginViewsWebState();
}

class _LoginViewsWebState extends State<LoginViewsWeb> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width:
              ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? 384 : 550,
          child: Padding(
            padding: paddingFormConstantsUtilities,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome Back",
                  textScaleFactor: 2.5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sizeboxHeight10FormConstantsUtilities,
                Text("Welcome back! Please enter your details"),
                sizeboxHeight10FormConstantsUtilities,
                sizeboxHeight10FormConstantsUtilities,
                sizeboxHeight10FormConstantsUtilities,
                FormLoginWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
