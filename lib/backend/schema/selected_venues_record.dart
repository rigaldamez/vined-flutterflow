import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'selected_venues_record.g.dart';

abstract class SelectedVenuesRecord
    implements Built<SelectedVenuesRecord, SelectedVenuesRecordBuilder> {
  static Serializer<SelectedVenuesRecord> get serializer =>
      _$selectedVenuesRecordSerializer;

  DocumentReference? get venueRef;

  DocumentReference? get tourRef;

  @BuiltValueField(wireName: 'added_by_uid')
  DocumentReference? get addedByUid;

  @BuiltValueField(wireName: 'is_lunch_venue')
  bool? get isLunchVenue;

  double? get tastingFee;

  DateTime? get addedDate;

  String? get bookingReference;

  DateTime? get reservationTime;

  @BuiltValueField(wireName: 'region_ID')
  DocumentReference? get regionID;

  @BuiltValueField(wireName: 'is_large_group_early_seating_only_venue')
  bool? get isLargeGroupEarlySeatingOnlyVenue;

  @BuiltValueField(wireName: 'is_lunch_venue_only')
  bool? get isLunchVenueOnly;

  @BuiltValueField(wireName: 'tasting_experience_description')
  String? get tastingExperienceDescription;

  @BuiltValueField(wireName: 'is_tasting_included')
  bool? get isTastingIncluded;

  BuiltList<int>? get openDays;

  int? get capacity;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SelectedVenuesRecordBuilder builder) => builder
    ..isLunchVenue = false
    ..tastingFee = 0.0
    ..bookingReference = ''
    ..isLargeGroupEarlySeatingOnlyVenue = false
    ..isLunchVenueOnly = false
    ..tastingExperienceDescription = ''
    ..isTastingIncluded = false
    ..openDays = ListBuilder()
    ..capacity = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('selected_venues');

  static Stream<SelectedVenuesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SelectedVenuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SelectedVenuesRecord._();
  factory SelectedVenuesRecord(
          [void Function(SelectedVenuesRecordBuilder) updates]) =
      _$SelectedVenuesRecord;

  static SelectedVenuesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
  final firestoreData = serializers.toFirestore(
    SelectedVenuesRecord.serializer,
    SelectedVenuesRecord(
      (s) => s
        ..venueRef = venueRef
        ..tourRef = tourRef
        ..addedByUid = addedByUid
        ..isLunchVenue = isLunchVenue
        ..tastingFee = tastingFee
        ..addedDate = addedDate
        ..bookingReference = bookingReference
        ..reservationTime = reservationTime
        ..regionID = regionID
        ..isLargeGroupEarlySeatingOnlyVenue = isLargeGroupEarlySeatingOnlyVenue
        ..isLunchVenueOnly = isLunchVenueOnly
        ..tastingExperienceDescription = tastingExperienceDescription
        ..isTastingIncluded = isTastingIncluded
        ..openDays = null
        ..capacity = capacity,
    ),
  );

  return firestoreData;
}
