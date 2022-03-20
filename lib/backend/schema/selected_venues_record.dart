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
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SelectedVenuesRecordBuilder builder) => builder
    ..isLunchVenue = false
    ..tastingFee = 0.0;

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
}) =>
    serializers.toFirestore(
        SelectedVenuesRecord.serializer,
        SelectedVenuesRecord((s) => s
          ..venueRef = venueRef
          ..tourRef = tourRef
          ..addedByUid = addedByUid
          ..isLunchVenue = isLunchVenue
          ..tastingFee = tastingFee
          ..addedDate = addedDate));
