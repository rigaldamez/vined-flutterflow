import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tours_record.g.dart';

abstract class ToursRecord implements Built<ToursRecord, ToursRecordBuilder> {
  static Serializer<ToursRecord> get serializer => _$toursRecordSerializer;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'tour_name')
  String? get tourName;

  @BuiltValueField(wireName: 'region_ID')
  DocumentReference? get regionID;

  DocumentReference? get uid;

  int? get passengers;

  @BuiltValueField(wireName: 'tour_date')
  DateTime? get tourDate;

  @BuiltValueField(wireName: 'pickup_address')
  String? get pickupAddress;

  @BuiltValueField(wireName: 'pickup_latlng')
  LatLng? get pickupLatlng;

  @BuiltValueField(wireName: 'price_pp')
  double? get pricePp;

  String? get region;

  BuiltList<DocumentReference>? get venues;

  @BuiltValueField(wireName: 'guests_uid')
  BuiltList<DocumentReference>? get guestsUid;

  @BuiltValueField(wireName: 'pickup_unit_number')
  String? get pickupUnitNumber;

  @BuiltValueField(wireName: 'tour_state')
  String? get tourState;

  double? get platformTastingFee;

  @BuiltValueField(wireName: 'driver_reff')
  DocumentReference? get driverReff;

  @BuiltValueField(wireName: 'driver_uid')
  String? get driverUid;

  @BuiltValueField(wireName: 'country_state')
  String? get countryState;

  @BuiltValueField(wireName: 'transport_fee_pp')
  double? get transportFeePp;

  @BuiltValueField(wireName: 'total_tasting_fee_pp')
  int? get totalTastingFeePp;

  @BuiltValueField(wireName: 'large_group_venue_early_seating_count')
  int? get largeGroupVenueEarlySeatingCount;

  @BuiltValueField(wireName: 'sub_total')
  int? get subTotal;

  @BuiltValueField(wireName: 'discount_amount')
  int? get discountAmount;

  @BuiltValueField(wireName: 'total_paid')
  int? get totalPaid;

  @BuiltValueField(wireName: 'total_balance')
  int? get totalBalance;

  @BuiltValueField(wireName: 'promo_code')
  String? get promoCode;

  @BuiltValueField(wireName: 'promo_discount_percent')
  double? get promoDiscountPercent;

  @BuiltValueField(wireName: 'promo_code_submitted')
  String? get promoCodeSubmitted;

  @BuiltValueField(wireName: 'lunch_venue_fee')
  double? get lunchVenueFee;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ToursRecordBuilder builder) => builder
    ..tourName = ''
    ..passengers = 0
    ..pickupAddress = ''
    ..pricePp = 0.0
    ..region = ''
    ..venues = ListBuilder()
    ..guestsUid = ListBuilder()
    ..pickupUnitNumber = ''
    ..tourState = ''
    ..platformTastingFee = 0.0
    ..driverUid = ''
    ..countryState = ''
    ..transportFeePp = 0.0
    ..totalTastingFeePp = 0
    ..largeGroupVenueEarlySeatingCount = 0
    ..subTotal = 0
    ..discountAmount = 0
    ..totalPaid = 0
    ..totalBalance = 0
    ..promoCode = ''
    ..promoDiscountPercent = 0.0
    ..promoCodeSubmitted = ''
    ..lunchVenueFee = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tours');

  static Stream<ToursRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ToursRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ToursRecord._();
  factory ToursRecord([void Function(ToursRecordBuilder) updates]) =
      _$ToursRecord;

  static ToursRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createToursRecordData({
  DateTime? createdTime,
  String? tourName,
  DocumentReference? regionID,
  DocumentReference? uid,
  int? passengers,
  DateTime? tourDate,
  String? pickupAddress,
  LatLng? pickupLatlng,
  double? pricePp,
  String? region,
  String? pickupUnitNumber,
  String? tourState,
  double? platformTastingFee,
  DocumentReference? driverReff,
  String? driverUid,
  String? countryState,
  double? transportFeePp,
  int? totalTastingFeePp,
  int? largeGroupVenueEarlySeatingCount,
  int? subTotal,
  int? discountAmount,
  int? totalPaid,
  int? totalBalance,
  String? promoCode,
  double? promoDiscountPercent,
  String? promoCodeSubmitted,
  double? lunchVenueFee,
}) {
  final firestoreData = serializers.toFirestore(
    ToursRecord.serializer,
    ToursRecord(
      (t) => t
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
        ..guestsUid = null
        ..pickupUnitNumber = pickupUnitNumber
        ..tourState = tourState
        ..platformTastingFee = platformTastingFee
        ..driverReff = driverReff
        ..driverUid = driverUid
        ..countryState = countryState
        ..transportFeePp = transportFeePp
        ..totalTastingFeePp = totalTastingFeePp
        ..largeGroupVenueEarlySeatingCount = largeGroupVenueEarlySeatingCount
        ..subTotal = subTotal
        ..discountAmount = discountAmount
        ..totalPaid = totalPaid
        ..totalBalance = totalBalance
        ..promoCode = promoCode
        ..promoDiscountPercent = promoDiscountPercent
        ..promoCodeSubmitted = promoCodeSubmitted
        ..lunchVenueFee = lunchVenueFee,
    ),
  );

  return firestoreData;
}
