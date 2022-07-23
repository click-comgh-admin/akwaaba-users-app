// import 'package:akwaaba_user_app/imports/functions/geolocator/difference/main.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> geolocatorCheckInRadius({
  required double startLatitude,
  required double startLongitude,
  required double endLatitude,
  required double endLongitude,
  required double radius,
}) async {
  double distanceBetweenInMeters = Geolocator.distanceBetween(
    startLatitude,
    startLongitude,
    endLatitude,
    endLongitude,
  );
  // double distance = distanceCalculator(
  //   lat1: startLatitude,
  //   lon1: startLongitude,
  //   lat2: endLatitude,
  //   lon2: endLongitude,
  // );
  // print({"lat1": startLatitude,
  //   "lon1": startLongitude,
  //   "lat2": endLatitude,
  //   "lon2": endLongitude,});

  double distanceBetweenInKiloMeters = distanceBetweenInMeters / 1000;

  // print({
  //   "distance": distance,
  //   "distanceBetweenInMeters": distanceBetweenInMeters,
  //   "distanceBetweenInKiloMeters": distanceBetweenInKiloMeters,
  //   "radius": radius
  // });

  bool inRadius = distanceBetweenInKiloMeters > radius ? false : true;
  return inRadius;
}
