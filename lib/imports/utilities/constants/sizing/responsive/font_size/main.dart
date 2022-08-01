import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

double? body2FontSizeResponsiveSizingContantsUtilities(BuildContext context) {
  double? fontSize =
      ResponsiveValue(context, defaultValue: 15.0, valueWhen: const [
    Condition.smallerThan(name: DESKTOP, value: 16.0),
  ]).value;
  // print({"fontSize": fontSize});
  return fontSize;
}
