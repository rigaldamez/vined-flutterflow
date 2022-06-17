import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'selected_venues_record.g.dart';

abstract class SelectedVenuesRecord
    implements Built<SelectedVenuesRecord, SelectedVenuesRecordBuilder> {
  static Serializer<SelectedVenuesRecord> get serializer =>
      _$selectedVenuesRecordSerializer;

  @nullable
  DocumentReference get venueRef;

  @nullable
  DocumentReference get tourRef;

  @nullable
  @BuiltValueField(wireName: 'added_by_uid')
  DocumentReference get addedByUid;

  @nullable
  @BuiltValueField(wireName: 'is_lunch_venue')
  bool get isLunchVenue;

  @nullable
  double get tastingFee;

  @nullable
  DateTime get addedDate;

  @nullable
  String get bookingReference;

  @nullable
  DateTime get reservationTime;

  @nullable
  @BuiltValueField(wireName: 'region_ID')
  DocumentReference get regionID;

  @nullable
  @BuiltValueField(wireName: 'is_large_group_early_seating_only_venue')
  bool get isLargeGroupEarlySeatingOnlyVenue;

  @nullable
  @BuiltValueField(wireName: 'is_lunch_venue_only')
  bool get isLunchVenueOnly;

  @nullable
  @BuiltValueField(wireName: 'tasting_experience_description')
  String get tastingExperienceDescription;

  @nullable
  @BuiltValueField(wireName: 'is_tasting_included')
  bool get isTastingIncluded;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SelectedVenuesRecordBuilder builder) => builder
    ..isLunchVenue = false
    ..tastingFee = 0.0
    ..bookingReference = ''
    ..isLargeGroupEarlySeatingOnlyVenue = false
    ..isLunchVenueOnly = false
    ..tastingExperienceDescription = ''
    ..isTastingIncluded = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('selected_venues');

  static Stream<SelectedVenuesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SelectedVenuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  SelectedVenuesRecord._();
  factory SelectedVenuesRecord(
          [void Function(SelectedVenuesRecordBuilder) updates]) =
      _$SelectedVenuesRecord;

  static SelectedVenuesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSelectedVenuesRecordData({
  DocumentReference venueRef,
  DocumentReference tourRef,
  DocumentReference addedByUid,
  bool isLunchVenue,
  double tastingFee,
  DateTime addedDate,
  String bookingReference,
  DateTime reservationTime,
  DocumentReference regionID,
  bool isLargeGroupEarlySeatingOnlyVenue,
  bool isLunchVenueOnly,
  String tastingExperienceDescription,
  bool isTastingIncluded,
}) =>
    serializers.toFirestore(
        SelectedVenuesRecord.serializer,
        SelectedVenuesRecord((s) => s
          ..venueRef = venueRef
          ..tourRef = tourRef
          ..addedByUid = addedByUid
          ..isLunchVenue = isLunchVenue
          ..tastingFee = tastingFee
          ..addedDate = addedDate
          ..bookingReference = bookingReference
          ..reservationTime = reservationTime
          ..regionID = regionID
          ..isLargeGroupEarlySeatingOnlyVenue =
              isLargeGroupEarlySeatingOnlyVenue
          ..isLunchVenueOnly = isLunchVenueOnly
          ..tastingExperienceDescription = tastingExperienceDescription
          ..isTastingIncluded = isTastingIncluded));
