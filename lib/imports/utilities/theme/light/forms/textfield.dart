import 'package:flutter/material.dart';

OutlineInputBorder _border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(
    10.0,
  ),
  borderSide: const BorderSide(
    color: Colors.grey,
  ),
);
InputDecorationTheme inputDecorationLightTheme = InputDecorationTheme(
  border: _border,
  focusedBorder: _border,
  filled: true,
  fillColor: Colors.transparent,
  // fillColor: Colors.grey.withOpacity(0.1),
);
