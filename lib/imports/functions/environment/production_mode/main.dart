import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

productionModeEnvironmentVariablesFunction() {
  String inProd = dotenv.get('IN_PRODUCTION');
  if (kDebugMode) {
    print({"inProd": inProd});
  }
  // bool inProduction= inProd as bool;
  if (inProd == "true") {
    return true;
  } else {
    return false;
  }
}
