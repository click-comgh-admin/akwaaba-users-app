import 'package:akwaaba_user_app/imports/functions/environment/production_mode/main.dart';

String apiBaseUrlFunctions(String endpoint, {bool? production}) {
  bool inProd = production ?? productionModeEnvironmentVariablesFunction();
  if (inProd) {
    return "https://api.akwaabaapp.com/$endpoint";
  } else {
    return "http://127.0.0.1:9001/api/$endpoint";
  }
}
