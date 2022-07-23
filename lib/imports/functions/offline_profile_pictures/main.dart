import 'package:akwaaba_user_app/imports/functions/environment/production_mode/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/urls/file_bucket.dart';

// enum OPPF {
//   url, inProduction
// }
/// Loads default image when offline
Map<String, Object> offlineProfilePictureFunction(String url) {
  bool inProd = productionModeEnvironmentVariablesFunction();
  if (inProd) {
    if (url.contains("member/logo/") || url.contains("member/profile/")) {
      url = url;
    } else {
      final parts = url.split('/');
      final fileName = parts[parts.length - 1];
      url = "$FILE_BUCKET_BASE_URL/files/members/profile-picture/$fileName";
    }
    return {"url": url, "inProduction": inProd};
  } else {
    String offlineUrl = "/images/offline_profile_picture.png";
    return {"url": offlineUrl, "inProduction": inProd};
  }
}

String placeholderProfilePictureFunction() {
  return "/images/placeholder_profile_picture.png";
}
