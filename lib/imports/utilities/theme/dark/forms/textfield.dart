import 'package:flutter/material.dart';

OutlineInputBorder inputDecorationBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(
    10.0,
  ),
  borderSide: const BorderSide(
    color: Colors.grey,
  ),
);
InputDecorationTheme inputDecorationDarkTheme = InputDecorationTheme(
  border: inputDecorationBorder,
  focusedBorder: inputDecorationBorder,
  filled: true,
  fillColor: Colors.transparent,
  // fillColor: Colors.grey.withOpacity(0.1),
);
