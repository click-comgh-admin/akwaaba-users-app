import 'package:akwaaba_user_app/imports/utilities/theme/dark/appbar/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/dark/buttons/elevated_button.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/dark/card/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/dark/color_scheme/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/dark/drawer/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/dark/forms/textfield.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/dark/icons/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/dark/snackbar/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/dark/text/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/light/appbar/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/light/buttons/elevated_button.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/light/card/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/light/color_scheme/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/light/drawer/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/light/forms/textfield.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/light/icons/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/light/snackbar/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/light/text/main.dart';
import 'package:flutter/material.dart';

const colorPrimary = Colors.orangeAccent;
const colorPrimaryAccent = Colors.orange;
Color colorCanvasLight = Colors.grey.shade100;
const colorPrimaryDark = Colors.deepOrange;
const colorPrimaryAccentDark = Colors.deepOrangeAccent;
Color colorCanvasDark = Colors.grey.shade900.withOpacity(0.9);

ThemeData lightTheme = ThemeData(
  primaryColor: colorPrimary,
  appBarTheme: appbarLightThemeData,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: colorPrimary,
  ),
  scaffoldBackgroundColor: colorCanvasLight,
  elevatedButtonTheme: elevatedButtonLightThemeData,
  textTheme: textLightThemeData,
  inputDecorationTheme: inputDecorationLightTheme,
  colorScheme: colorSchemeLightThemeData,
  iconTheme: iconLightThemeData,
  cardTheme: cardLightTheme,
  drawerTheme: drawerThemeDataLightTheme,
  snackBarTheme: snackBarLightTheme,
);

ThemeData darkTheme = ThemeData(
  primaryColor: colorPrimaryDark,
  appBarTheme: appbarDarkThemeData,
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  // scaffoldBackgroundColor: colorCanvasDark,
  textTheme: textDarkThemeData,
  elevatedButtonTheme: elevatedButtonDarkThemeData,
  inputDecorationTheme: inputDecorationDarkTheme,
  colorScheme: colorSchemeDarkThemeData,
  iconTheme: iconDarkThemeData,
  cardTheme: cardDarkTheme,
  drawerTheme: drawerThemeDataDarkTheme,
  snackBarTheme: snackBarDarkTheme,
);
