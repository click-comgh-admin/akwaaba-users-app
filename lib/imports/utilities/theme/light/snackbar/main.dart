import 'package:akwaaba_user_app/imports/utilities/theme/dark/card/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/dark/text/main.dart';
import 'package:flutter/material.dart';

SnackBarThemeData? snackBarLightTheme = SnackBarThemeData(
  backgroundColor: cardDarkTheme.color,
  actionTextColor: textDarkThemeData.bodyText2!.copyWith(color: Colors.white).color,
  contentTextStyle: textDarkThemeData.bodyText2!.copyWith(color: Colors.white),
);
