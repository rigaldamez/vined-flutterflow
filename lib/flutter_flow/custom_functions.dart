import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String fortmatCurrency(
  double price,
  String currencySymbol,
) {
  //return '$currencySymbol$price.00';
  double num1 = double.parse((price).toStringAsFixed(2));
  //return
  return '$currencySymbol$num1 pp';
}

DateTime getCurrentDateTimePlusAweek(DateTime selectedDate) {
  var today = DateTime.now();
  return DateTime(today.year, today.month, today.day + 7, 9);
}

bool isStringNotEmpty(String aString) {
  if (aString == "") {
    return false;
  } else {
    return true;
  }
}

LatLng createGeoPoint(
  double latitude,
  double longitude,
) {
  // Add your function code here!
  return LatLng(latitude, longitude);
}

bool isVenueAlreadyAdded(
  List<SelectedVenuesRecord> data,
  DocumentReference venue,
) {
  // Add your function code here!

  for (var i = 0; i < data.length; i++) {
    if (data[i].venueRef == venue) {
      return true;
    }
  }

  return false;
}

String isVenueOpen(
  List<int> openDays,
  ToursRecord tourRecord,
) {
  // Add your function code here!

  for (var i = 0; i < openDays.length; i++) {
    if (openDays[i] == tourRecord.tourDate.weekday) {
      return "Open";
    }
  }

  return "Closed";
}

bool meetsVenueCapacity(
  ToursRecord tourRecord,
  int venueCapacity,
) {
  // Add your function code here!
  if (tourRecord.passengers <= venueCapacity) {
    return true;
  } else {
    return false;
  }
}

String upperCaseString(String str) {
  // Add your function code here!
  return str.toUpperCase();
}
