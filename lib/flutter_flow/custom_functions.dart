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

DateTime getCurrentDateTimePlusAweek(
  DateTime selectedDate,
  int leadTime,
  bool tourLeadTimeExempted,
) {
  var today = DateTime.now();

  if (tourLeadTimeExempted) {
    return DateTime(today.year, today.month, today.day + 1, 9);
  } else {
    return DateTime(today.year, today.month, today.day + leadTime, 9);
  }
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

bool isVenueOpen(
  List<int> openDays,
  ToursRecord tourRecord,
) {
  // Add your function code here!
  return openDays.contains(tourRecord.tourDate.weekday) ? true : false;

  /*for (var i = 0; i < openDays.length; i++) {
    if (openDays[i] == tourRecord.tourDate.weekday) {
      return "Open";
    }
  }*/

  //return "Closed";
}

bool isVenueClosedOrExceedsCapacity(
  List<int> openDays,
  ToursRecord tourRecord,
  int venueCapacity,
) {
  // Add your function code here!
  return !openDays.contains(tourRecord.tourDate.weekday) ||
          tourRecord.passengers > venueCapacity
      ? true
      : false;

  /*for (var i = 0; i < openDays.length; i++) {
    if (openDays[i] == tourRecord.tourDate.weekday) {
      return "Open";
    }
  }*/

  //return "Closed";
}

bool doesTourExceedsVenueCapacity(
  ToursRecord tourRecord,
  int venueCapacity,
) {
  // Add your function code here!

  return tourRecord.passengers > venueCapacity ? true : false;
}

bool meetsVenueCapacity(
  ToursRecord tourRecord,
  int venueCapacity,
) {
  // Add your function code here!
  return tourRecord.passengers <= venueCapacity ? true : false;
}

String upperCaseString(String str) {
  // Add your function code here!
  return str.toUpperCase();
}

String getDayMonthFromDate(DateTime date) {
  // Get month from Date
  return new DateFormat("d, MMMM").format(date);
}

String concatenateStrings(
  String string1,
  String string2,
) {
  // Concatenate two strings
  if (string1.isNotEmpty && string2.isNotEmpty) {
    return '$string1 $string2';
  }
  return string1.isNotEmpty ? string1 : string2;
}

String getTimeFromDate(DateTime date) {
  // get time from date

  if (date.year == 1970) {
    return "TBC";
  } else {
    return DateFormat.jm().format(date);
  }

  //return if date == null ? "TBC" : DateFormat.jm().format(date);

  //return DateFormat.jm().format(date);
}

String getLatestDateDayMonthValue(
  DateTime originalTourDate,
  DateTime editedTourDate,
) {
  // check if editedTourDate is not empty and is greater than originalTourDate
  if (editedTourDate == null) {
    throw ArgumentError(
        "You should enter a valid DateTime for editedTourDate, not null or empty");
  }
  if (originalTourDate == null) {
    throw ArgumentError(
        "You should enter a valid DateTime for originalTourDate, not null or empty");
  }
  if (editedTourDate.isAfter(originalTourDate)) {
    return DateFormat("d, MMMM").format(editedTourDate);
  } else {
    return DateFormat("d, MMMM").format(originalTourDate);
  }
}

bool isArrayEmpty(List<DocumentReference> arrayList) {
  // Check if arrayList is empty then return true else false
  if (arrayList == null)
    return false;
  else
    return arrayList.length == 0 ? true : false;
}

bool isTourStopsCountLessThanLimitAllowed(
  List<DocumentReference> venuesList,
  AppConfigRecord venueLimit,
) {
  // Check if venuesList count is less than 4, if true return true else false
  return venuesList.length < venueLimit.itineraryVenueLimit ? true : false;
}

String boolString(bool boolVal) {
  // Add your function code here!
  if (boolVal) {
    return 'true';
  } else {
    return 'false';
  }
}

bool isTourInDraftState(String stateString) {
  // Add your function code here!

  return stateString == "draft" ? true : false;
}

DateTime epochTime() {
  // Add your function code here!
  return DateTime(1970, 1, 1, 00, 00, 00);
}

String getPerPersonFee(
  double transportFee,
  List<SelectedVenuesRecord> selectedVenues,
  double platformFee,
) {
  //final currencyFormatter = NumberFormat.currency();
  double totalPerPerson = transportFee;

  for (var i = 0; i < selectedVenues.length; i++) {
    totalPerPerson += selectedVenues[i].tastingFee + platformFee;
    print(totalPerPerson);
  }

  return NumberFormat.simpleCurrency().format(totalPerPerson);

  //return totalPerPerson.toString();
}

DateTime getBookingReservationTime(
  DateTime tourDate,
  DateTime reservationTimestamp,
) {
  return DateTime(tourDate.year, tourDate.month, tourDate.day,
      reservationTimestamp.hour, reservationTimestamp.minute);
}

DateTime getTodayTimestampZeroMinutes() {
  return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
      DateTime.now().hour, 0);
}

int countNumberOfGuests(List<DocumentReference> guestsList) {
  // Add your function code here!
  return guestsList.length;
}
