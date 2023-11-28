import 'package:maps_toolkit/maps_toolkit.dart';
import 'dart:math';

double _degreetoRadians(double degrees) => degrees / 180.0 * pi;

LatLng getSnapPointOnLine(LatLng p, LatLng start, LatLng end) {
  if (start == end) {
    return end;
  }

  final s0lat = _degreetoRadians(p.latitude);
  final s0lng = _degreetoRadians(p.longitude);
  final s1lat = _degreetoRadians(start.latitude);
  final s1lng = _degreetoRadians(start.longitude);
  final s2lat = _degreetoRadians(end.latitude);
  final s2lng = _degreetoRadians(end.longitude);

  final s2s1lat = s2lat - s1lat;
  final s2s1lng = s2lng - s1lng;

  final u = ((s0lat - s1lat) * s2s1lat + (s0lng - s1lng) * s2s1lng) /
      (s2s1lat * s2s1lat + s2s1lng * s2s1lng);

  if (u <= 0) {
    return start;
  }
  if (u >= 1) {
    return end;
  }
  final su = LatLng(start.latitude + u * (end.latitude - start.latitude),
      start.longitude + u * (end.longitude - start.longitude));

  return su;
}

num getDistancePointToLine(LatLng p, LatLng start, LatLng end) {
  return SphericalUtil.computeDistanceBetween(
      p, getSnapPointOnLine(p, start, end));
}
