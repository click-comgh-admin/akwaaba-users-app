import 'dart:math';

distanceCalculator({
  required double lat1,
  required double lat2,
  required double lon1,
  required double lon2,
}) {
  const R = 6371e3; // earth's radius in metres ie (6,371 kilometres)

  final lat1Radian = lat1 * pi / 180; // φ, λ in radians
  final lat2Radian = lat2 * pi / 180;
  final latDiffRadian = (lat2 - lat1) * pi / 180;
  final lonDiffRadian = (lon2 - lon1) * pi / 180;

  final a = sin(latDiffRadian / 2) * sin(latDiffRadian / 2) +
      cos(lat1Radian) *
          cos(lat2Radian) *
          sin(lonDiffRadian / 2) *
          sin(lonDiffRadian / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return R * c; // in metres
}
