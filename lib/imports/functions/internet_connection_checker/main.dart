import 'package:akwaaba_user_app/imports/functions/internet_connection_checker/base/main.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<InternetConnectionStatus> checkInternetConnectionFunction() async {
  return await baseEnumValCheckInternetConnectionExecuteFunction(
    InternetConnectionChecker(),
  );
}

Future<bool> checkInternetConnectionFunction2() async {
  try {
    return await baseBoolValCheckInternetConnectionExecuteFunction(
      InternetConnectionChecker(),
    );
  } catch (e) {
    return false;
  }
}
