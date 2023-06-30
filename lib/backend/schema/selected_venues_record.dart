import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedVenuesRecord extends FirestoreRecord {
  SelectedVenuesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "venueRef" field.
  DocumentReference? _venueRef;
  DocumentReference? get venueRef => _venueRef;
  bool hasVenueRef() => _venueRef != null;

  // "tourRef" field.
  DocumentReference? _tourRef;
  DocumentReference? get tourRef => _tourRef;
  bool hasTourRef() => _tourRef != null;

  // "added_by_uid" field.
  DocumentReference? _addedByUid;
  DocumentReference? get addedByUid => _addedByUid;
  bool hasAddedByUid() => _addedByUid != null;

  // "is_lunch_venue" field.
  bool? _isLunchVenue;
  bool get isLunchVenue => _isLunchVenue ?? false;
  bool hasIsLunchVenue() => _isLunchVenue != null;

  // "tastingFee" field.
  double? _tastingFee;
  double get tastingFee => _tastingFee ?? 0.0;
  bool hasTastingFee() => _tastingFee != null;

  // "addedDate" field.
  DateTime? _addedDate;
  DateTime? get addedDate => _addedDate;
  bool hasAddedDate() => _addedDate != null;

  // "bookingReference" field.
  String? _bookingReference;
  String get bookingReference => _bookingReference ?? '';
  bool hasBookingReference() => _bookingReference != null;

  // "reservationTime" field.
  DateTime? _reservationTime;
  DateTime? get reservationTime => _reservationTime;
  bool hasReservationTime() => _reservationTime != null;

  // "region_ID" field.
  DocumentReference? _regionID;
  DocumentReference? get regionID => _regionID;
  bool hasRegionID() => _regionID != null;

  // "is_large_group_early_seating_only_venue" field.
  bool? _isLargeGroupEarlySeatingOnlyVenue;
  bool get isLargeGroupEarlySeatingOnlyVenue =>
      _isLargeGroupEarlySeatingOnlyVenue ?? false;
  bool hasIsLargeGroupEarlySeatingOnlyVenue() =>
      _isLargeGroupEarlySeatingOnlyVenue != null;

  // "is_lunch_venue_only" field.
  bool? _isLunchVenueOnly;
  bool get isLunchVenueOnly => _isLunchVenueOnly ?? false;
  bool hasIsLunchVenueOnly() => _isLunchVenueOnly != null;

  // "tasting_experience_description" field.
  String? _tastingExperienceDescription;
  String get tastingExperienceDescription =>
      _tastingExperienceDescription ?? '';
  bool hasTastingExperienceDescription() =>
      _tastingExperienceDescription != null;

  // "is_tasting_included" field.
  bool? _isTastingIncluded;
  bool get isTastingIncluded => _isTastingIncluded ?? false;
  bool hasIsTastingIncluded() => _isTastingIncluded != null;

  // "openDays" field.
  List<int>? _openDays;
  List<int> get openDays => _openDays ?? const [];
  bool hasOpenDays() => _openDays != null;

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  void _initializeFields() {
    _venueRef = snapshotData['venueRef'] as DocumentReference?;
    _tourRef = snapshotData['tourRef'] as DocumentReference?;
    _addedByUid = snapshotData['added_by_uid'] as DocumentReference?;
    _isLunchVenue = snapshotData['is_lunch_venue'] as bool?;
    _tastingFee = castToType<double>(snapshotData['tastingFee']);
    _addedDate = snapshotData['addedDate'] as DateTime?;
    _bookingReference = snapshotData['bookingReference'] as String?;
    _reservationTime = snapshotData['reservationTime'] as DateTime?;
    _regionID = snapshotData['region_ID'] as DocumentReference?;
    _isLargeGroupEarlySeatingOnlyVenue =
        snapshotData['is_large_group_early_seating_only_venue'] as bool?;
    _isLunchVenueOnly = snapshotData['is_lunch_venue_only'] as bool?;
    _tastingExperienceDescription =
        snapshotData['tasting_experience_description'] as String?;
    _isTastingIncluded = snapshotData['is_tasting_included'] as bool?;
    _openDays = getDataList(snapshotData['openDays']);
    _capacity = castToType<int>(snapshotData['capacity']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('selected_venues');

  static Stream<SelectedVenuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SelectedVenuesRecord.fromSnapshot(s));

  static Future<SelectedVenuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SelectedVenuesRecord.fromSnapshot(s));

  static SelectedVenuesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SelectedVenuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SelectedVenuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SelectedVenuesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SelectedVenuesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SelectedVenuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSelectedVenuesRecordData({
  DocumentReference? venueRef,
  DocumentReference? tourRef,
  DocumentReference? addedByUid,
  bool? isLunchVenue,
  double? tastingFee,
  DateTime? addedDate,
  String? bookingReference,
  DateTime? reservationTime,
  DocumentReference? regionID,
  bool? isLargeGroupEarlySeatingOnlyVenue,
  bool? isLunchVenueOnly,
  String? tastingExperienceDescription,
  bool? isTastingIncluded,
  int? capacity,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'venueRef': venueRef,
      'tourRef': tourRef,
      'added_by_uid': addedByUid,
      'is_lunch_venue': isLunchVenue,
      'tastingFee': tastingFee,
      'addedDate': addedDate,
      'bookingReference': bookingReference,
      'reservationTime': reservationTime,
      'region_ID': regionID,
      'is_large_group_early_seating_only_venue':
          isLargeGroupEarlySeatingOnlyVenue,
      'is_lunch_venue_only': isLunchVenueOnly,
      'tasting_experience_description': tastingExperienceDescription,
      'is_tasting_included': isTastingIncluded,
      'capacity': capacity,
    }.withoutNulls,
  );

  return firestoreData;
}

class SelectedVenuesRecordDocumentEquality
    implements Equality<SelectedVenuesRecord> {
  const SelectedVenuesRecordDocumentEquality();

  @override
  bool equals(SelectedVenuesRecord? e1, SelectedVenuesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.venueRef == e2?.venueRef &&
        e1?.tourRef == e2?.tourRef &&
        e1?.addedByUid == e2?.addedByUid &&
        e1?.isLunchVenue == e2?.isLunchVenue &&
        e1?.tastingFee == e2?.tastingFee &&
        e1?.addedDate == e2?.addedDate &&
        e1?.bookingReference == e2?.bookingReference &&
        e1?.reservationTime == e2?.reservationTime &&
        e1?.regionID == e2?.regionID &&
        e1?.isLargeGroupEarlySeatingOnlyVenue ==
            e2?.isLargeGroupEarlySeatingOnlyVenue &&
        e1?.isLunchVenueOnly == e2?.isLunchVenueOnly &&
        e1?.tastingExperienceDescription == e2?.tastingExperienceDescription &&
        e1?.isTastingIncluded == e2?.isTastingIncluded &&
        listEquality.equals(e1?.openDays, e2?.openDays) &&
        e1?.capacity == e2?.capacity;
  }

  @override
  int hash(SelectedVenuesRecord? e) => const ListEquality().hash([
        e?.venueRef,
        e?.tourRef,
        e?.addedByUid,
        e?.isLunchVenue,
        e?.tastingFee,
        e?.addedDate,
        e?.bookingReference,
        e?.reservationTime,
        e?.regionID,
        e?.isLargeGroupEarlySeatingOnlyVenue,
        e?.isLunchVenueOnly,
        e?.tastingExperienceDescription,
        e?.isTastingIncluded,
        e?.openDays,
        e?.capacity
      ]);

  @override
  bool isValidKey(Object? o) => o is SelectedVenuesRecord;
}
