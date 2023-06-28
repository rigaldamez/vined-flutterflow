import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime getCurrentDateTimePlusAweek(
  DateTime? selectedDate,
  int? leadTime,
  bool? tourLeadTimeExempted,
) {
  var today = DateTime.now();

  if (tourLeadTimeExempted!) {
    return DateTime(today.year, today.month, today.day + 1, 9);
  } else {
    return DateTime(today.year, today.month, today.day + leadTime!, 9);
  }
}

bool isStringNotEmpty(String? aString) {
  return aString == null ? false : true;

  /*if (aString == "") {
    return false;
  } else {
    return true;
  }*/
}

LatLng createGeoPoint(
  double? latitude,
  double? longitude,
) {
  // Add your function code here!
  return LatLng(latitude!, longitude!);
}

bool isVenueAlreadyAdded(
  List<SelectedVenuesRecord>? data,
  DocumentReference? venue,
) {
  // Add your function code here!

  for (var i = 0; i < data!.length; i++) {
    if (data[i].venueRef == venue) {
      return true;
    }
  }

  return false;
}

bool isVenueOpen(
  List<int>? openDays,
  ToursRecord? tourRecord,
) {
  // Add your function code here!
  return openDays!.contains(tourRecord!.tourDate!.weekday) ? true : false;

  /*for (var i = 0; i < openDays.length; i++) {
    if (openDays[i] == tourRecord.tourDate.weekday) {
      return "Open";
    }
  }*/

  //return "Closed";
}

bool isVenueClosedOrExceedsCapacity(
  List<int>? openDays,
  ToursRecord? tourRecord,
  int? venueCapacity,
) {
  // Add your function code here!
  return !openDays!.contains(tourRecord!.tourDate!.weekday) ||
          tourRecord.passengers! > venueCapacity!
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
  ToursRecord? tourRecord,
  int? venueCapacity,
) {
  //return tourRecord != null && venueCapacity != null && tourRecord.passengers! > venueCapacity ? true : false;

  return tourRecord!.passengers! > venueCapacity! ? true : false;
}

bool meetsVenueCapacity(
  ToursRecord? tourRecord,
  int? venueCapacity,
) {
  // Add your function code here!
  return tourRecord!.passengers! <= venueCapacity! ? true : false;
}

String upperCaseString(String? lowercareString) {
  // Add your function code here!
  return lowercareString!.toUpperCase();
}

String getDayMonthFromDate(DateTime? date) {
  // Get month from Date
  return DateFormat("d, MMM").format(date!);
}

String concatenateStrings(
  String? string1,
  String? string2,
) {
  // Concatenate two strings
  if (string1!.isNotEmpty && string2!.isNotEmpty) {
    return '$string1 $string2';
  }
  return string1.isNotEmpty ? string1 : string2!;
}

String getTimeFromDate(DateTime? date) {
  // get time from date

  if (date!.year == 1970) {
    return "TBC";
  } else {
    return DateFormat.jm().format(date);
  }

  //return if date == null ? "TBC" : DateFormat.jm().format(date);

  //return DateFormat.jm().format(date);
}

String getLatestDateDayMonthValue(
  DateTime? originalTourDate,
  DateTime? editedTourDate,
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

bool isArrayEmpty(List<DocumentReference>? arrayList) {
  // Check if arrayList is empty then return true else false
  if (arrayList == null)
    return false;
  else
    //return arrayList.length == 0 ? true : false;

    return arrayList.isEmpty ? true : false;
}

bool isTourStopsCountLessThanLimitAllowed(
  List<DocumentReference>? venuesList,
  AppConfigRecord? venueLimit,
) {
  // Check if venuesList count is less than 4, if true return true else false
  return venuesList!.length < venueLimit!.itineraryVenueLimit! ? true : false;
}

String boolString(bool? boolVal) {
  // Add your function code here!
  if (boolVal!) {
    return 'true';
  } else {
    return 'false';
  }
}

bool isTourInDraftState(String? stateString) {
  // Add your function code here!

  return stateString == "draft" ? true : false;
}

DateTime epochTime() {
  // Add your function code here!
  return DateTime(1970, 1, 1, 00, 00, 00);
}

String getPerPersonFee(
  double? transportFee,
  List<SelectedVenuesRecord>? selectedVenues,
  double? platformFee,
) {
  //final currencyFormatter = NumberFormat.currency();
  double? totalPerPerson = transportFee;

  for (var i = 0; i < selectedVenues!.length; i++) {
    if (totalPerPerson != null) {
      totalPerPerson += selectedVenues[i].tastingFee! + platformFee!;
      print(totalPerPerson);
    }
  }

  return NumberFormat.simpleCurrency().format(totalPerPerson);

  //return totalPerPerson.toString();
}

int getPerPersonFeeAsInt(
  double? transportFee,
  List<SelectedVenuesRecord>? selectedVenues,
  double? platformFee,
) {
  //final currencyFormatter = NumberFormat.currency();
  /*if (transportFee == null) {
    throw ArgumentError(
        "You should enter a valid transportFee for transportFee, not null or empty");
  }

  if (selectedVenues == null) {
    throw ArgumentError(
        "You should enter a valid selectedVenues for selectedVenues, not null or empty");
  }

  if (platformFee == null) {
    throw ArgumentError(
        "You should enter a valid platformFee for platformFee, not null or empty");
  }*/

  double? totalPerPerson = transportFee;

  for (var i = 0; i < selectedVenues!.length; i++) {
    if (totalPerPerson != null) {
      totalPerPerson += selectedVenues[i].tastingFee! + platformFee!;
      print(totalPerPerson);
    }
  }

  return totalPerPerson!.toInt();

  //return totalPerPerson.toString();
}

int getPerPersonFeeAsIntRemoveVenue(
  double? platformFee,
  double? currentPPFee,
  double? selectedVenueTastingFee,
) {
  return (currentPPFee! - selectedVenueTastingFee! - platformFee!).toInt();
}

int getPerPersonFeeAsInt2(
  double? transportFee,
  List<SelectedVenuesRecord>? selectedVenues,
  double? platformFee,
  SelectedVenuesRecord? lastSelectedVenue,
) {
  double? totalPerPerson = transportFee;
  final List<SelectedVenuesRecord> venues = selectedVenues!;

  if (lastSelectedVenue != null) {
    venues.add(lastSelectedVenue);
  }

  for (var i = 0; i < venues.length; i++) {
    if (totalPerPerson != null) {
      totalPerPerson += venues[i].tastingFee! + platformFee!;
      print(totalPerPerson);
    }
  }

  return totalPerPerson!.toInt();
}

DateTime getBookingReservationTime(
  DateTime? tourDate,
  DateTime? reservationTimestamp,
) {
  return DateTime(tourDate!.year, tourDate.month, tourDate.day,
      reservationTimestamp!.hour, reservationTimestamp.minute);
}

DateTime getTodayTimestampZeroMinutes() {
  return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
      DateTime.now().hour, 0);
}

int countNumberOfGuests(List<DocumentReference>? guestsList) {
  // Add your function code here!
  return guestsList!.length;
}

bool isLunchVenue(
  DocumentReference? selectedVenueReff,
  DocumentReference? localStateSelectedVenueReff,
) {
  // Add your function code here!
  return selectedVenueReff == localStateSelectedVenueReff ? true : false;
}

bool isStringEmpty(String? aString) {
  // Add your function code here!
  return aString!.isEmpty;
}

int calculateTotalTastingFeePP(
  List<SelectedVenuesRecord>? selectedVenues,
  double? selectedVenueFee,
) {
  // Add your function code here!
  int totalTastingFeePP = 0;

  for (var i = 0; i < selectedVenues!.length; i++) {
    totalTastingFeePP += selectedVenues[i].tastingFee!.toInt();
    print(totalTastingFeePP);
  }

  return totalTastingFeePP + selectedVenueFee!.toInt();
}

int deductFromTotalTastingFeePP(
  int? currentTastingFee,
  SelectedVenuesRecord? subtractValue,
) {
  // Add your function code here!
  if (currentTastingFee == null) {
    throw ArgumentError(
        "You should enter a valid currentTastingFee for editedTourDate, not null or empty");
  }

  if (subtractValue == null) {
    throw ArgumentError(
        "You should enter a valid currentTastingFee for editedTourDate, not null or empty");
  }

  return currentTastingFee -
      subtractValue.tastingFee!.toInt(); //subtractValue.toInt();
}

int addtoTotalTastingFeePP(
  int? currentTastingFee,
  double? addValue,
) {
  // Add your function code here!
  return currentTastingFee! + addValue!.toInt();
}

String setImagePath(
  String? tastingExperienceRecordImgPath,
  String? venueImgPath,
) {
  // Add your function code here!
  return tastingExperienceRecordImgPath!.isEmpty
      ? venueImgPath!
      : tastingExperienceRecordImgPath;
}

bool isIntegerOneSmallOrEqualThanIntegerTwo(
  int? intergerOne,
  int? intergerTwo,
) {
  // Add your function code here!
  return intergerOne! <= intergerTwo! ? true : false;
}

bool isIntegerOneSmallerThanIntegerTwoOrArguement3IsTrue(
  int? intergerOne,
  int? intergerTwo,
  bool? arguement3,
) {
  // Add your function code here!
  return intergerOne! < intergerTwo! || !arguement3! ? true : false;
}

String displayTastingExperienceDescription(String? tastingDescription) {
  // Add your function code here!
  return tastingDescription == "" ? "Not applicable" : tastingDescription!;
}

int getTourSubTotal(
  int? noOfPassengers,
  double? costPP,
) {
  // Add your function code here!
  if (noOfPassengers == null) {
    throw ArgumentError(
        "You should enter a valid noOfPassengers for noOfPassengers, not null or empty");
  }

  if (costPP == null) {
    throw ArgumentError(
        "You should enter a valid costPP for costPP, not null or empty");
  }

  //int costpp = (costPP / 100).round();
  return noOfPassengers * costPP.toInt();
}

bool isBoolTrue(bool? value) {
  // Add your function code here!
  if (value.toString() != "") {
    return value!;
  }
  return false;
}

String tourRefAsString(DocumentReference? tourReff) {
  // Add your function code here!
  return tourReff!.id.toString();
}

String getHourFromTimestamp(DateTime? selectedTimestamp) {
  // Add your function code here!
  if (selectedTimestamp.toString() != "") {
    return DateFormat.jm().format(selectedTimestamp!);
  } else {
    return "set time";
  }
}

int numberOfVenuesInTour(List<VenuesRecord>? selectedVenues) {
  // Add your function code here!

  if (selectedVenues != null) {
    return selectedVenues.length;
  } else {
    return 0;
  }
}

double updatePassengersCalculatePricePP(
  double? transportPricePP,
  double? tastingFeePP,
  double? platformFee,
  int? noOfVenuesInTour,
) {
  if (noOfVenuesInTour != null && noOfVenuesInTour > 0) {
    return transportPricePP! +
        tastingFeePP! +
        (platformFee! * noOfVenuesInTour);
  } else {
    return transportPricePP!;
  }
}

bool isSelectedVenuesListEmpty(List<SelectedVenuesRecord>? selectedVenues) {
  // Add your function code here!
  if (selectedVenues == null) {
    return true;
  } else {
    return selectedVenues.isEmpty ? true : false;
  }
}

double getTotalTourAmountPaid(List<PaymentRecord>? paymentArray) {
  // Add your function code here!

  double totalAmountPaid = 0;

  for (var i = 0; i < paymentArray!.length; i++) {
    totalAmountPaid += paymentArray[i].amountPaid!;
    print(totalAmountPaid);
  }

  return totalAmountPaid;
}

bool isTourCorrectToSubmit(
  DateTime? tourDate,
  int? numberOfPassengers,
  List<SelectedVenuesRecord>? venuesList,
) {
  // Check group capacity and open days

  bool boolVal = false;

  for (var i = 0; i < venuesList!.length; i++) {
    if (venuesList[i].openDays!.contains(tourDate!.weekday) &&
        numberOfPassengers! <= venuesList[i].capacity!) {
      boolVal = true;
    } else {
      boolVal = false;
    } //end if
  } //end for

  return boolVal;
}

bool isTourVenuesListEmpty(List<DocumentReference>? tourVenuesRefList) {
  // Add your function code here!
  if (tourVenuesRefList == null) {
    return true;
  } else {
    return tourVenuesRefList.isEmpty ? true : false;
  }
}

bool? isPromoCodeValid(
  PromoCodesRecord? promoCodeDoc,
  DocumentReference? userID,
) {
  bool validity = false;

  if (promoCodeDoc != null) {
    //checking for a null document
    if (DateTime.now().compareTo(promoCodeDoc.expiryDate!) < 0) {
      //checking that promo code hasn't 'date' expired
      if (!promoCodeDoc.usedByList!.contains(userID)) {
        //checking that user hasn't used promo code yet
        validity = true;
      }
    }
  }

  return validity;
}

double? calculateDiscountAmount(
  String? discountType,
  double? discountAmount,
  double? totalTourPrice,
) {
  switch (discountType!) {
    case "percent":
      {
        return (totalTourPrice! * (discountAmount! / 100)).toDouble();
      }

    case "fixed":
      {
        return discountAmount; //(totalTourPrice! - discountAmount!).toDouble();
      }

    default:
      {
        return 0;
      }
  }
}

double? calculateTotalDiscountAmount(
  String? discountType,
  double? discountAmount,
  double? totalTourPricePP,
  int numberOfGuests,
) {
  switch (discountType!) {
    case "percent":
      {
        return (totalTourPricePP! * (discountAmount! / 100)).toDouble();
      }

    case "fixed":
      {
        return discountAmount! * numberOfGuests;
      }

    default:
      {
        return 0;
      }
  }
}

double? updateTotalBalanceWithDiscountAmount(
  double? subTotal,
  double? discountAmount,
) {
  if (subTotal != null) {
    return (subTotal - discountAmount!).toDouble();
  } else {
    return 0.0;
  }
}

List<VenuesRecord>? sortVenuesByViewDateTrending(
    List<VenuesRecord> venuesUnsorted) {
  List<VenuesRecord> sortedList = venuesUnsorted;

  sortedList.sort((v1, v2) {
    if (v1.lastVenueViewDate == null && v2.lastVenueViewDate == null) {
      return 0;
    } else if (v1.lastVenueViewDate == null) {
      return 1;
    } else if (v2.lastVenueViewDate == null) {
      return -1;
    } else {
      return v2.lastVenueViewDate!.compareTo(v1.lastVenueViewDate!);
    }
  });

  return sortedList;

  //Returns a value like a Comparator when comparing this to other. That is, it returns a negative integer if 'this' is ordered before 'other', a positive integer if 'this' is ordered after 'other', and zero if this and other are ordered together.

  //viewCountSort: sortedList.sort((a, b) => b.viewsCount.compareTo(a.viewsCount));
}

double? updateTotalPPCostWithDiscountAmount(
  double? pricePP,
  double? discountAmount,
) {
  if (pricePP != null) {
    return (pricePP - discountAmount!).toDouble();
  } else {
    return 0.0;
  }
}

double? convertAmountToCents(double? amount) {
  if (amount != null) {
    return amount * 100;
  }
}

double? displayDiscountedPP(
  double? pricePP,
  double? pricePPDiscounted,
) {
  if (pricePPDiscounted == null || pricePPDiscounted == 0) {
    return pricePP;
  } else {
    return pricePPDiscounted;
  }
}

double? updateTotalBalanceAfterPayment(
  List<PaymentRecord>? paymentsList,
  double? lastPayment,
  double? currentTotalBalance,
) {
  double total = currentTotalBalance != null ? currentTotalBalance : 0.0;

  /*if (paymentsList != null) {
    for (var i = 0; i < paymentsList.length; i++) {
      total -= paymentsList[i].amountPaid!;
    } //end for

  }*/

  if (lastPayment != null) {
    total -= lastPayment;
  }

  return total;
}

List<VenuesRecord> shuffleCollection(List<VenuesRecord> originalList) {
  List<VenuesRecord> shuffledList = originalList;

  shuffledList.shuffle();

  return shuffledList;
}

List<VenuesRecord>? sortVenuesByViewsCount(List<VenuesRecord> venuesUnsorted) {
  List<VenuesRecord> sortedList = venuesUnsorted;

  sortedList.sort((a, b) => b.viewsCount.compareTo(a.viewsCount));

  return sortedList;
}

String? displayVenueDistance(double? distanceDouble) {
  if (distanceDouble != null) {
    return (distanceDouble / 1000).toStringAsFixed(2);
  } else {
    return "";
  }
}

String? getLngLatCoordinatesMapbox(
  LatLng? l1,
  LatLng? l2,
) {
  if (l1 != null && l2 != null) {
    String latt1 = l1.latitude.toString();
    String longg1 = l1.longitude.toString();

    String latt2 = l2.latitude.toString();
    String longg2 = l2.longitude.toString();

    return '$longg1,$latt1;$longg2,$latt2';
  }
}
