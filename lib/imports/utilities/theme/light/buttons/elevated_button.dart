import 'package:akwaaba_user_app/imports/utilities/theme/constants.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonLightThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    minimumSize: MaterialStateProperty.all<Size>(
      const Size(1000, 20),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(colorPrimary),
  ),
);
