// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

final R = 6372.8; // In kilometers

double haversine(double lat1, double lon1, double lat2, double lon2) {
  double dLat = _toRadians(lat2 - lat1);
  double dLon = _toRadians(lon2 - lon1);
  lat1 = _toRadians(lat1);
  lat2 = _toRadians(lat2);
  double a =
      pow(sin(dLat / 2), 2) + pow(sin(dLon / 2), 2) * cos(lat1) * cos(lat2);
  double c = 2 * asin(sqrt(a));
  return R * c;
}

double _toRadians(double degree) {
  return degree * pi / 180;
}

int geoSort(LatLng a, LatLng b, LatLng origin) {
  double distanceA =
      haversine(a.latitude, a.longitude, origin.latitude, origin.longitude);
  double distanceB =
      haversine(b.latitude, b.longitude, origin.latitude, origin.longitude);
  return (distanceA - distanceB).round();
}

Future<List<VenuesRecord>> sortVenuesByDistance(
  List<VenuesRecord>? venues,
  LatLng? location,
) async {
  // Add your function code here!
  List<VenuesRecord> emptyList = [];

  if (venues != null && location != null) {
    venues.sort((a, b) => geoSort(a.latLong!, b.latLong!, location));
    return venues;
  } else {
    return emptyList;
  }
}
