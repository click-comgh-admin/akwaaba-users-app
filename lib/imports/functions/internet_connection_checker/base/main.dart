import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> baseBoolValCheckInternetConnectionExecuteFunction(
  InternetConnectionChecker internetConnectionChecker,
) async {
  return await internetConnectionChecker.hasConnection;
}

Future<InternetConnectionStatus>
    baseEnumValCheckInternetConnectionExecuteFunction(
  InternetConnectionChecker internetConnectionChecker,
) async {
  return await internetConnectionChecker.connectionStatus;
}
