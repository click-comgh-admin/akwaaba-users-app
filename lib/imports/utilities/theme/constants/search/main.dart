import 'package:akwaaba_user_app/imports/utilities/theme/dark/forms/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration searchConstantTheme(BuildContext context,
    {required bool bordered}) {
  return InputDecoration(
    contentPadding: EdgeInsets.zero,
    hintText: "Search Dashboard",
    prefixIcon: Icon(
      CupertinoIcons.search,
      color: Theme.of(context).iconTheme.color,
    ),
    filled: bordered,
    fillColor: bordered ? Theme.of(context).canvasColor.withOpacity(0.8) : null,
    focusColor:
        bordered ? Theme.of(context).canvasColor.withOpacity(0.8) : null,
    hoverColor: Colors.transparent,
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    focusedBorder: bordered
        ? inputDecorationBorder
        : const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
    enabledBorder: bordered
        ? inputDecorationBorder
        : const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
  );
}
