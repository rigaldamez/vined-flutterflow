import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToursRecord extends FirestoreRecord {
  ToursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "tour_name" field.
  String? _tourName;
  String get tourName => _tourName ?? '';
  bool hasTourName() => _tourName != null;

  // "region_ID" field.
  DocumentReference? _regionID;
  DocumentReference? get regionID => _regionID;
  bool hasRegionID() => _regionID != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  // "passengers" field.
  int? _passengers;
  int get passengers => _passengers ?? 0;
  bool hasPassengers() => _passengers != null;

  // "tour_date" field.
  DateTime? _tourDate;
  DateTime? get tourDate => _tourDate;
  bool hasTourDate() => _tourDate != null;

  // "pickup_address" field.
  String? _pickupAddress;
  String get pickupAddress => _pickupAddress ?? '';
  bool hasPickupAddress() => _pickupAddress != null;

  // "pickup_latlng" field.
  LatLng? _pickupLatlng;
  LatLng? get pickupLatlng => _pickupLatlng;
  bool hasPickupLatlng() => _pickupLatlng != null;

  // "price_pp" field.
  double? _pricePp;
  double get pricePp => _pricePp ?? 0.0;
  bool hasPricePp() => _pricePp != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "venues" field.
  List<DocumentReference>? _venues;
  List<DocumentReference> get venues => _venues ?? const [];
  bool hasVenues() => _venues != null;

  // "guests_uid" field.
  List<DocumentReference>? _guestsUid;
  List<DocumentReference> get guestsUid => _guestsUid ?? const [];
  bool hasGuestsUid() => _guestsUid != null;

  // "pickup_unit_number" field.
  String? _pickupUnitNumber;
  String get pickupUnitNumber => _pickupUnitNumber ?? '';
  bool hasPickupUnitNumber() => _pickupUnitNumber != null;

  // "tour_state" field.
  String? _tourState;
  String get tourState => _tourState ?? '';
  bool hasTourState() => _tourState != null;

  // "platformTastingFee" field.
  double? _platformTastingFee;
  double get platformTastingFee => _platformTastingFee ?? 0.0;
  bool hasPlatformTastingFee() => _platformTastingFee != null;

  // "driver_reff" field.
  DocumentReference? _driverReff;
  DocumentReference? get driverReff => _driverReff;
  bool hasDriverReff() => _driverReff != null;

  // "driver_uid" field.
  String? _driverUid;
  String get driverUid => _driverUid ?? '';
  bool hasDriverUid() => _driverUid != null;

  // "country_state" field.
  String? _countryState;
  String get countryState => _countryState ?? '';
  bool hasCountryState() => _countryState != null;

  // "transport_fee_pp" field.
  double? _transportFeePp;
  double get transportFeePp => _transportFeePp ?? 0.0;
  bool hasTransportFeePp() => _transportFeePp != null;

  // "total_tasting_fee_pp" field.
  int? _totalTastingFeePp;
  int get totalTastingFeePp => _totalTastingFeePp ?? 0;
  bool hasTotalTastingFeePp() => _totalTastingFeePp != null;

  // "large_group_venue_early_seating_count" field.
  int? _largeGroupVenueEarlySeatingCount;
  int get largeGroupVenueEarlySeatingCount =>
      _largeGroupVenueEarlySeatingCount ?? 0;
  bool hasLargeGroupVenueEarlySeatingCount() =>
      _largeGroupVenueEarlySeatingCount != null;

  // "sub_total" field.
  int? _subTotal;
  int get subTotal => _subTotal ?? 0;
  bool hasSubTotal() => _subTotal != null;

  // "total_paid" field.
  int? _totalPaid;
  int get totalPaid => _totalPaid ?? 0;
  bool hasTotalPaid() => _totalPaid != null;

  // "lunch_venue_fee" field.
  double? _lunchVenueFee;
  double get lunchVenueFee => _lunchVenueFee ?? 0.0;
  bool hasLunchVenueFee() => _lunchVenueFee != null;

  // "discount_amount" field.
  double? _discountAmount;
  double get discountAmount => _discountAmount ?? 0.0;
  bool hasDiscountAmount() => _discountAmount != null;

  // "total_balance" field.
  double? _totalBalance;
  double get totalBalance => _totalBalance ?? 0.0;
  bool hasTotalBalance() => _totalBalance != null;

  // "discount_amount_pp" field.
  double? _discountAmountPp;
  double get discountAmountPp => _discountAmountPp ?? 0.0;
  bool hasDiscountAmountPp() => _discountAmountPp != null;

  // "price_pp_discounted" field.
  double? _pricePpDiscounted;
  double get pricePpDiscounted => _pricePpDiscounted ?? 0.0;
  bool hasPricePpDiscounted() => _pricePpDiscounted != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _tourName = snapshotData['tour_name'] as String?;
    _regionID = snapshotData['region_ID'] as DocumentReference?;
    _uid = snapshotData['uid'] as DocumentReference?;
    _passengers = castToType<int>(snapshotData['passengers']);
    _tourDate = snapshotData['tour_date'] as DateTime?;
    _pickupAddress = snapshotData['pickup_address'] as String?;
    _pickupLatlng = snapshotData['pickup_latlng'] as LatLng?;
    _pricePp = castToType<double>(snapshotData['price_pp']);
    _region = snapshotData['region'] as String?;
    _venues = getDataList(snapshotData['venues']);
    _guestsUid = getDataList(snapshotData['guests_uid']);
    _pickupUnitNumber = snapshotData['pickup_unit_number'] as String?;
    _tourState = snapshotData['tour_state'] as String?;
    _platformTastingFee =
        castToType<double>(snapshotData['platformTastingFee']);
    _driverReff = snapshotData['driver_reff'] as DocumentReference?;
    _driverUid = snapshotData['driver_uid'] as String?;
    _countryState = snapshotData['country_state'] as String?;
    _transportFeePp = castToType<double>(snapshotData['transport_fee_pp']);
    _totalTastingFeePp = castToType<int>(snapshotData['total_tasting_fee_pp']);
    _largeGroupVenueEarlySeatingCount =
        castToType<int>(snapshotData['large_group_venue_early_seating_count']);
    _subTotal = castToType<int>(snapshotData['sub_total']);
    _totalPaid = castToType<int>(snapshotData['total_paid']);
    _lunchVenueFee = castToType<double>(snapshotData['lunch_venue_fee']);
    _discountAmount = castToType<double>(snapshotData['discount_amount']);
    _totalBalance = castToType<double>(snapshotData['total_balance']);
    _discountAmountPp = castToType<double>(snapshotData['discount_amount_pp']);
    _pricePpDiscounted =
        castToType<double>(snapshotData['price_pp_discounted']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tours');

  static Stream<ToursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToursRecord.fromSnapshot(s));

  static Future<ToursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToursRecord.fromSnapshot(s));

  static ToursRecord fromSnapshot(DocumentSnapshot snapshot) => ToursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  int? totalPaid,
  double? lunchVenueFee,
  double? discountAmount,
  double? totalBalance,
  double? discountAmountPp,
  double? pricePpDiscounted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'tour_name': tourName,
      'region_ID': regionID,
      'uid': uid,
      'passengers': passengers,
      'tour_date': tourDate,
      'pickup_address': pickupAddress,
      'pickup_latlng': pickupLatlng,
      'price_pp': pricePp,
      'region': region,
      'pickup_unit_number': pickupUnitNumber,
      'tour_state': tourState,
      'platformTastingFee': platformTastingFee,
      'driver_reff': driverReff,
      'driver_uid': driverUid,
      'country_state': countryState,
      'transport_fee_pp': transportFeePp,
      'total_tasting_fee_pp': totalTastingFeePp,
      'large_group_venue_early_seating_count': largeGroupVenueEarlySeatingCount,
      'sub_total': subTotal,
      'total_paid': totalPaid,
      'lunch_venue_fee': lunchVenueFee,
      'discount_amount': discountAmount,
      'total_balance': totalBalance,
      'discount_amount_pp': discountAmountPp,
      'price_pp_discounted': pricePpDiscounted,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToursRecordDocumentEquality implements Equality<ToursRecord> {
  const ToursRecordDocumentEquality();

  @override
  bool equals(ToursRecord? e1, ToursRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.tourName == e2?.tourName &&
        e1?.regionID == e2?.regionID &&
        e1?.uid == e2?.uid &&
        e1?.passengers == e2?.passengers &&
        e1?.tourDate == e2?.tourDate &&
        e1?.pickupAddress == e2?.pickupAddress &&
        e1?.pickupLatlng == e2?.pickupLatlng &&
        e1?.pricePp == e2?.pricePp &&
        e1?.region == e2?.region &&
        listEquality.equals(e1?.venues, e2?.venues) &&
        listEquality.equals(e1?.guestsUid, e2?.guestsUid) &&
        e1?.pickupUnitNumber == e2?.pickupUnitNumber &&
        e1?.tourState == e2?.tourState &&
        e1?.platformTastingFee == e2?.platformTastingFee &&
        e1?.driverReff == e2?.driverReff &&
        e1?.driverUid == e2?.driverUid &&
        e1?.countryState == e2?.countryState &&
        e1?.transportFeePp == e2?.transportFeePp &&
        e1?.totalTastingFeePp == e2?.totalTastingFeePp &&
        e1?.largeGroupVenueEarlySeatingCount ==
            e2?.largeGroupVenueEarlySeatingCount &&
        e1?.subTotal == e2?.subTotal &&
        e1?.totalPaid == e2?.totalPaid &&
        e1?.lunchVenueFee == e2?.lunchVenueFee &&
        e1?.discountAmount == e2?.discountAmount &&
        e1?.totalBalance == e2?.totalBalance &&
        e1?.discountAmountPp == e2?.discountAmountPp &&
        e1?.pricePpDiscounted == e2?.pricePpDiscounted;
  }

  @override
  int hash(ToursRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.tourName,
        e?.regionID,
        e?.uid,
        e?.passengers,
        e?.tourDate,
        e?.pickupAddress,
        e?.pickupLatlng,
        e?.pricePp,
        e?.region,
        e?.venues,
        e?.guestsUid,
        e?.pickupUnitNumber,
        e?.tourState,
        e?.platformTastingFee,
        e?.driverReff,
        e?.driverUid,
        e?.countryState,
        e?.transportFeePp,
        e?.totalTastingFeePp,
        e?.largeGroupVenueEarlySeatingCount,
        e?.subTotal,
        e?.totalPaid,
        e?.lunchVenueFee,
        e?.discountAmount,
        e?.totalBalance,
        e?.discountAmountPp,
        e?.pricePpDiscounted
      ]);

  @override
  bool isValidKey(Object? o) => o is ToursRecord;
}
