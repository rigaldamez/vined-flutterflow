// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:url_launcher/url_launcher.dart';

Future launchMap(
  LatLng? origin,
  LatLng? destination,
) async {
  // Add your function code here!
  if (origin != null && destination != null) {
    //final String originString = origin.toString();
    //final String destinationString = destination.toString();

    final String originLatString = origin.latitude.toString();
    final String originLonString = origin.longitude.toString();

    final String destinationLatString = destination.latitude.toString();
    final String destinationLonString = destination.longitude.toString();

    final Uri url = Uri.parse(
        'https://www.google.com/maps/dir/?api=1&origin=$originLatString,$originLonString&destination=$destinationLatString,$destinationLonString&travelmode=driving');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
