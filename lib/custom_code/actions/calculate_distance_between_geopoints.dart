// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geodesy/geodesy.dart' show Geodesy;
import 'package:latlong2/latlong.dart' as mylatlong;

Future<double> calculateDistanceBetweenGeopoints(
  LatLng? l1,
  LatLng? l2,
) async {
  // Add your function code here!
  final Geodesy geodesy = Geodesy();

  //-34.80517157565507, 138.61393055962205 - Mr Bulgogi
  //-34.92839965219005, 138.59999021153396 - Victoria Square

  //final l1 = mylatlong.LatLng(-34.80517157565507, 138.61393055962205);
  //final l2 = mylatlong.LatLng(-34.92839965219005, 138.59999021153396);

  if (l1 != null && l2 != null) {
    final loc1 = mylatlong.LatLng(l1.latitude, l1.longitude);
    final loc2 = mylatlong.LatLng(l2.latitude, l2.longitude);

    final num distance = geodesy.distanceBetweenTwoGeoPoints(loc1, loc2);

    print('[distanceBetweenTwoGeoPoints] Distance: ' + distance.toString());

    return distance.toDouble();
  } else {
    return 0.0;
  }
}
