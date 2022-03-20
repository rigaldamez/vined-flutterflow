import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tours_record.g.dart';

abstract class ToursRecord implements Built<ToursRecord, ToursRecordBuilder> {
  static Serializer<ToursRecord> get serializer => _$toursRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'tour_name')
  String get tourName;

  @nullable
  @BuiltValueField(wireName: 'region_ID')
  DocumentReference get regionID;

  @nullable
  DocumentReference get uid;

  @nullable
  int get passengers;

  @nullable
  @BuiltValueField(wireName: 'tour_date')
  DateTime get tourDate;

  @nullable
  @BuiltValueField(wireName: 'pickup_address')
  String get pickupAddress;

  @nullable
  @BuiltValueField(wireName: 'pickup_latlng')
  LatLng get pickupLatlng;

  @nullable
  @BuiltValueField(wireName: 'price_pp')
  double get pricePp;

  @nullable
  String get region;

  @nullable
  BuiltList<DocumentReference> get venues;

  @nullable
  int get venuesCount;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ToursRecordBuilder builder) => builder
    ..tourName = ''
    ..passengers = 0
    ..pickupAddress = ''
    ..pricePp = 0.0
    ..region = ''
    ..venues = ListBuilder()
    ..venuesCount = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tours');

  static Stream<ToursRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ToursRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ToursRecord._();
  factory ToursRecord([void Function(ToursRecordBuilder) updates]) =
      _$ToursRecord;

  static ToursRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createToursRecordData({
  DateTime createdTime,
  String tourName,
  DocumentReference regionID,
  DocumentReference uid,
  int passengers,
  DateTime tourDate,
  String pickupAddress,
  LatLng pickupLatlng,
  double pricePp,
  String region,
  int venuesCount,
}) =>
    serializers.toFirestore(
        ToursRecord.serializer,
        ToursRecord((t) => t
          ..createdTime = createdTime
          ..tourName = tourName
          ..regionID = regionID
          ..uid = uid
          ..passengers = passengers
          ..tourDate = tourDate
          ..pickupAddress = pickupAddress
          ..pickupLatlng = pickupLatlng
          ..pricePp = pricePp
          ..region = region
          ..venues = null
          ..venuesCount = venuesCount));
