import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  return aString == null ? false : true;

  /*if (aString == "") {
    return false;
  } else {
    return true;
  }*/
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
  //return tourRecord != null && venueCapacity != null && tourRecord.passengers! > venueCapacity ? true : false;

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

int getPerPersonFeeAsInt(
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

  return totalPerPerson.toInt();

  //return totalPerPerson.toString();
}

int getPerPersonFeeAsInt2(
  double transportFee,
  List<SelectedVenuesRecord> selectedVenues,
  double platformFee,
  SelectedVenuesRecord lastSelectedVenue,
) {
  //final currencyFormatter = NumberFormat.currency();
  double totalPerPerson = transportFee;

  final List<SelectedVenuesRecord> venues = selectedVenues;

  venues.add(lastSelectedVenue);

  for (var i = 0; i < venues.length; i++) {
    totalPerPerson += venues[i].tastingFee + platformFee;
    print(totalPerPerson);
  }

  return totalPerPerson.toInt();

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

bool isLunchVenue(
  DocumentReference selectedVenueReff,
  DocumentReference localStateSelectedVenueReff,
) {
  // Add your function code here!
  return selectedVenueReff == localStateSelectedVenueReff ? true : false;
}

bool isStringEmpty(String aString) {
  // Add your function code here!
  return aString.isEmpty;
}

int calculateTotalTastingFeePP(
  List<SelectedVenuesRecord> selectedVenues,
  double selectedVenueFee,
) {
  // Add your function code here!
  int totalTastingFeePP = 0;

  for (var i = 0; i < selectedVenues.length; i++) {
    totalTastingFeePP += selectedVenues[i].tastingFee.toInt();
    print(totalTastingFeePP);
  }

  return totalTastingFeePP + selectedVenueFee.toInt();
}

int deductFromTotalTastingFeePP(
  int currentTastingFee,
  SelectedVenuesRecord subtractValue,
) {
  // Add your function code here!
  return currentTastingFee -
      subtractValue.tastingFee.toInt(); //subtractValue.toInt();
}

int addtoTotalTastingFeePP(
  int currentTastingFee,
  double addValue,
) {
  // Add your function code here!
  return currentTastingFee + addValue.toInt();
}

String setImagePath(
  String tastingExperienceRecordImgPath,
  String venueImgPath,
) {
  // Add your function code here!
  return tastingExperienceRecordImgPath.isEmpty
      ? venueImgPath
      : tastingExperienceRecordImgPath;
}

bool isIntegerOneSmallOrEqualThanIntegerTwo(
  int intergerOne,
  int intergerTwo,
) {
  // Add your function code here!
  return intergerOne <= intergerTwo ? true : false;
}

bool isIntegerOneSmallerThanIntegerTwoOrArguement3IsTrue(
  int intergerOne,
  int intergerTwo,
  bool arguement3,
) {
  // Add your function code here!
  return intergerOne < intergerTwo || !arguement3 ? true : false;
}

String displayTastingExperienceDescription(String tastingDescription) {
  // Add your function code here!
  return tastingDescription == "" ? "Not applicable" : tastingDescription;
}

int getTourSubTotal(
  int noOfPassengers,
  double costPP,
) {
  // Add your function code here!
  //int costpp = (costPP / 100).round();
  return noOfPassengers * costPP.toInt();
}

bool isBoolTrue(bool value) {
  // Add your function code here!
  if (value.toString() != "") {
    return value == true ? true : false;
  }
  return false;
}
