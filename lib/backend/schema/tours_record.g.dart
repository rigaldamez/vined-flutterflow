// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tours_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ToursRecord> _$toursRecordSerializer = new _$ToursRecordSerializer();

class _$ToursRecordSerializer implements StructuredSerializer<ToursRecord> {
  @override
  final Iterable<Type> types = const [ToursRecord, _$ToursRecord];
  @override
  final String wireName = 'ToursRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ToursRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.tourName;
    if (value != null) {
      result
        ..add('tour_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.regionID;
    if (value != null) {
      result
        ..add('region_ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.passengers;
    if (value != null) {
      result
        ..add('passengers')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tourDate;
    if (value != null) {
      result
        ..add('tour_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.pickupAddress;
    if (value != null) {
      result
        ..add('pickup_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pickupLatlng;
    if (value != null) {
      result
        ..add('pickup_latlng')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.pricePp;
    if (value != null) {
      result
        ..add('price_pp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.region;
    if (value != null) {
      result
        ..add('region')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.venues;
    if (value != null) {
      result
        ..add('venues')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.guestsUid;
    if (value != null) {
      result
        ..add('guests_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.pickupUnitNumber;
    if (value != null) {
      result
        ..add('pickup_unit_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tourState;
    if (value != null) {
      result
        ..add('tour_state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.platformTastingFee;
    if (value != null) {
      result
        ..add('platformTastingFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.driverReff;
    if (value != null) {
      result
        ..add('driver_reff')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.driverUid;
    if (value != null) {
      result
        ..add('driver_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.countryState;
    if (value != null) {
      result
        ..add('country_state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.transportFeePp;
    if (value != null) {
      result
        ..add('transport_fee_pp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.totalTastingFeePp;
    if (value != null) {
      result
        ..add('total_tasting_fee_pp')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.largeGroupVenueEarlySeatingCount;
    if (value != null) {
      result
        ..add('large_group_venue_early_seating_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.subTotal;
    if (value != null) {
      result
        ..add('sub_total')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalPaid;
    if (value != null) {
      result
        ..add('total_paid')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lunchVenueFee;
    if (value != null) {
      result
        ..add('lunch_venue_fee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.discountAmount;
    if (value != null) {
      result
        ..add('discount_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.totalBalance;
    if (value != null) {
      result
        ..add('total_balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.discountAmountPp;
    if (value != null) {
      result
        ..add('discount_amount_pp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.pricePpDiscounted;
    if (value != null) {
      result
        ..add('price_pp_discounted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ToursRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ToursRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'tour_name':
          result.tourName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'region_ID':
          result.regionID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'passengers':
          result.passengers = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'tour_date':
          result.tourDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'pickup_address':
          result.pickupAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pickup_latlng':
          result.pickupLatlng = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'price_pp':
          result.pricePp = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'region':
          result.region = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'venues':
          result.venues.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'guests_uid':
          result.guestsUid.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'pickup_unit_number':
          result.pickupUnitNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tour_state':
          result.tourState = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'platformTastingFee':
          result.platformTastingFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'driver_reff':
          result.driverReff = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'driver_uid':
          result.driverUid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'country_state':
          result.countryState = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'transport_fee_pp':
          result.transportFeePp = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'total_tasting_fee_pp':
          result.totalTastingFeePp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'large_group_venue_early_seating_count':
          result.largeGroupVenueEarlySeatingCount = serializers
              .deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'sub_total':
          result.subTotal = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total_paid':
          result.totalPaid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'lunch_venue_fee':
          result.lunchVenueFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'discount_amount':
          result.discountAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'total_balance':
          result.totalBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'discount_amount_pp':
          result.discountAmountPp = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'price_pp_discounted':
          result.pricePpDiscounted = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ToursRecord extends ToursRecord {
  @override
  final DateTime? createdTime;
  @override
  final String? tourName;
  @override
  final DocumentReference<Object?>? regionID;
  @override
  final DocumentReference<Object?>? uid;
  @override
  final int? passengers;
  @override
  final DateTime? tourDate;
  @override
  final String? pickupAddress;
  @override
  final LatLng? pickupLatlng;
  @override
  final double? pricePp;
  @override
  final String? region;
  @override
  final BuiltList<DocumentReference<Object?>>? venues;
  @override
  final BuiltList<DocumentReference<Object?>>? guestsUid;
  @override
  final String? pickupUnitNumber;
  @override
  final String? tourState;
  @override
  final double? platformTastingFee;
  @override
  final DocumentReference<Object?>? driverReff;
  @override
  final String? driverUid;
  @override
  final String? countryState;
  @override
  final double? transportFeePp;
  @override
  final int? totalTastingFeePp;
  @override
  final int? largeGroupVenueEarlySeatingCount;
  @override
  final int? subTotal;
  @override
  final int? totalPaid;
  @override
  final double? lunchVenueFee;
  @override
  final double? discountAmount;
  @override
  final double? totalBalance;
  @override
  final double? discountAmountPp;
  @override
  final double? pricePpDiscounted;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ToursRecord([void Function(ToursRecordBuilder)? updates]) =>
      (new ToursRecordBuilder()..update(updates))._build();

  _$ToursRecord._(
      {this.createdTime,
      this.tourName,
      this.regionID,
      this.uid,
      this.passengers,
      this.tourDate,
      this.pickupAddress,
      this.pickupLatlng,
      this.pricePp,
      this.region,
      this.venues,
      this.guestsUid,
      this.pickupUnitNumber,
      this.tourState,
      this.platformTastingFee,
      this.driverReff,
      this.driverUid,
      this.countryState,
      this.transportFeePp,
      this.totalTastingFeePp,
      this.largeGroupVenueEarlySeatingCount,
      this.subTotal,
      this.totalPaid,
      this.lunchVenueFee,
      this.discountAmount,
      this.totalBalance,
      this.discountAmountPp,
      this.pricePpDiscounted,
      this.ffRef})
      : super._();

  @override
  ToursRecord rebuild(void Function(ToursRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToursRecordBuilder toBuilder() => new ToursRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToursRecord &&
        createdTime == other.createdTime &&
        tourName == other.tourName &&
        regionID == other.regionID &&
        uid == other.uid &&
        passengers == other.passengers &&
        tourDate == other.tourDate &&
        pickupAddress == other.pickupAddress &&
        pickupLatlng == other.pickupLatlng &&
        pricePp == other.pricePp &&
        region == other.region &&
        venues == other.venues &&
        guestsUid == other.guestsUid &&
        pickupUnitNumber == other.pickupUnitNumber &&
        tourState == other.tourState &&
        platformTastingFee == other.platformTastingFee &&
        driverReff == other.driverReff &&
        driverUid == other.driverUid &&
        countryState == other.countryState &&
        transportFeePp == other.transportFeePp &&
        totalTastingFeePp == other.totalTastingFeePp &&
        largeGroupVenueEarlySeatingCount ==
            other.largeGroupVenueEarlySeatingCount &&
        subTotal == other.subTotal &&
        totalPaid == other.totalPaid &&
        lunchVenueFee == other.lunchVenueFee &&
        discountAmount == other.discountAmount &&
        totalBalance == other.totalBalance &&
        discountAmountPp == other.discountAmountPp &&
        pricePpDiscounted == other.pricePpDiscounted &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, tourName.hashCode);
    _$hash = $jc(_$hash, regionID.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, passengers.hashCode);
    _$hash = $jc(_$hash, tourDate.hashCode);
    _$hash = $jc(_$hash, pickupAddress.hashCode);
    _$hash = $jc(_$hash, pickupLatlng.hashCode);
    _$hash = $jc(_$hash, pricePp.hashCode);
    _$hash = $jc(_$hash, region.hashCode);
    _$hash = $jc(_$hash, venues.hashCode);
    _$hash = $jc(_$hash, guestsUid.hashCode);
    _$hash = $jc(_$hash, pickupUnitNumber.hashCode);
    _$hash = $jc(_$hash, tourState.hashCode);
    _$hash = $jc(_$hash, platformTastingFee.hashCode);
    _$hash = $jc(_$hash, driverReff.hashCode);
    _$hash = $jc(_$hash, driverUid.hashCode);
    _$hash = $jc(_$hash, countryState.hashCode);
    _$hash = $jc(_$hash, transportFeePp.hashCode);
    _$hash = $jc(_$hash, totalTastingFeePp.hashCode);
    _$hash = $jc(_$hash, largeGroupVenueEarlySeatingCount.hashCode);
    _$hash = $jc(_$hash, subTotal.hashCode);
    _$hash = $jc(_$hash, totalPaid.hashCode);
    _$hash = $jc(_$hash, lunchVenueFee.hashCode);
    _$hash = $jc(_$hash, discountAmount.hashCode);
    _$hash = $jc(_$hash, totalBalance.hashCode);
    _$hash = $jc(_$hash, discountAmountPp.hashCode);
    _$hash = $jc(_$hash, pricePpDiscounted.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ToursRecord')
          ..add('createdTime', createdTime)
          ..add('tourName', tourName)
          ..add('regionID', regionID)
          ..add('uid', uid)
          ..add('passengers', passengers)
          ..add('tourDate', tourDate)
          ..add('pickupAddress', pickupAddress)
          ..add('pickupLatlng', pickupLatlng)
          ..add('pricePp', pricePp)
          ..add('region', region)
          ..add('venues', venues)
          ..add('guestsUid', guestsUid)
          ..add('pickupUnitNumber', pickupUnitNumber)
          ..add('tourState', tourState)
          ..add('platformTastingFee', platformTastingFee)
          ..add('driverReff', driverReff)
          ..add('driverUid', driverUid)
          ..add('countryState', countryState)
          ..add('transportFeePp', transportFeePp)
          ..add('totalTastingFeePp', totalTastingFeePp)
          ..add('largeGroupVenueEarlySeatingCount',
              largeGroupVenueEarlySeatingCount)
          ..add('subTotal', subTotal)
          ..add('totalPaid', totalPaid)
          ..add('lunchVenueFee', lunchVenueFee)
          ..add('discountAmount', discountAmount)
          ..add('totalBalance', totalBalance)
          ..add('discountAmountPp', discountAmountPp)
          ..add('pricePpDiscounted', pricePpDiscounted)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ToursRecordBuilder implements Builder<ToursRecord, ToursRecordBuilder> {
  _$ToursRecord? _$v;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _tourName;
  String? get tourName => _$this._tourName;
  set tourName(String? tourName) => _$this._tourName = tourName;

  DocumentReference<Object?>? _regionID;
  DocumentReference<Object?>? get regionID => _$this._regionID;
  set regionID(DocumentReference<Object?>? regionID) =>
      _$this._regionID = regionID;

  DocumentReference<Object?>? _uid;
  DocumentReference<Object?>? get uid => _$this._uid;
  set uid(DocumentReference<Object?>? uid) => _$this._uid = uid;

  int? _passengers;
  int? get passengers => _$this._passengers;
  set passengers(int? passengers) => _$this._passengers = passengers;

  DateTime? _tourDate;
  DateTime? get tourDate => _$this._tourDate;
  set tourDate(DateTime? tourDate) => _$this._tourDate = tourDate;

  String? _pickupAddress;
  String? get pickupAddress => _$this._pickupAddress;
  set pickupAddress(String? pickupAddress) =>
      _$this._pickupAddress = pickupAddress;

  LatLng? _pickupLatlng;
  LatLng? get pickupLatlng => _$this._pickupLatlng;
  set pickupLatlng(LatLng? pickupLatlng) => _$this._pickupLatlng = pickupLatlng;

  double? _pricePp;
  double? get pricePp => _$this._pricePp;
  set pricePp(double? pricePp) => _$this._pricePp = pricePp;

  String? _region;
  String? get region => _$this._region;
  set region(String? region) => _$this._region = region;

  ListBuilder<DocumentReference<Object?>>? _venues;
  ListBuilder<DocumentReference<Object?>> get venues =>
      _$this._venues ??= new ListBuilder<DocumentReference<Object?>>();
  set venues(ListBuilder<DocumentReference<Object?>>? venues) =>
      _$this._venues = venues;

  ListBuilder<DocumentReference<Object?>>? _guestsUid;
  ListBuilder<DocumentReference<Object?>> get guestsUid =>
      _$this._guestsUid ??= new ListBuilder<DocumentReference<Object?>>();
  set guestsUid(ListBuilder<DocumentReference<Object?>>? guestsUid) =>
      _$this._guestsUid = guestsUid;

  String? _pickupUnitNumber;
  String? get pickupUnitNumber => _$this._pickupUnitNumber;
  set pickupUnitNumber(String? pickupUnitNumber) =>
      _$this._pickupUnitNumber = pickupUnitNumber;

  String? _tourState;
  String? get tourState => _$this._tourState;
  set tourState(String? tourState) => _$this._tourState = tourState;

  double? _platformTastingFee;
  double? get platformTastingFee => _$this._platformTastingFee;
  set platformTastingFee(double? platformTastingFee) =>
      _$this._platformTastingFee = platformTastingFee;

  DocumentReference<Object?>? _driverReff;
  DocumentReference<Object?>? get driverReff => _$this._driverReff;
  set driverReff(DocumentReference<Object?>? driverReff) =>
      _$this._driverReff = driverReff;

  String? _driverUid;
  String? get driverUid => _$this._driverUid;
  set driverUid(String? driverUid) => _$this._driverUid = driverUid;

  String? _countryState;
  String? get countryState => _$this._countryState;
  set countryState(String? countryState) => _$this._countryState = countryState;

  double? _transportFeePp;
  double? get transportFeePp => _$this._transportFeePp;
  set transportFeePp(double? transportFeePp) =>
      _$this._transportFeePp = transportFeePp;

  int? _totalTastingFeePp;
  int? get totalTastingFeePp => _$this._totalTastingFeePp;
  set totalTastingFeePp(int? totalTastingFeePp) =>
      _$this._totalTastingFeePp = totalTastingFeePp;

  int? _largeGroupVenueEarlySeatingCount;
  int? get largeGroupVenueEarlySeatingCount =>
      _$this._largeGroupVenueEarlySeatingCount;
  set largeGroupVenueEarlySeatingCount(int? largeGroupVenueEarlySeatingCount) =>
      _$this._largeGroupVenueEarlySeatingCount =
          largeGroupVenueEarlySeatingCount;

  int? _subTotal;
  int? get subTotal => _$this._subTotal;
  set subTotal(int? subTotal) => _$this._subTotal = subTotal;

  int? _totalPaid;
  int? get totalPaid => _$this._totalPaid;
  set totalPaid(int? totalPaid) => _$this._totalPaid = totalPaid;

  double? _lunchVenueFee;
  double? get lunchVenueFee => _$this._lunchVenueFee;
  set lunchVenueFee(double? lunchVenueFee) =>
      _$this._lunchVenueFee = lunchVenueFee;

  double? _discountAmount;
  double? get discountAmount => _$this._discountAmount;
  set discountAmount(double? discountAmount) =>
      _$this._discountAmount = discountAmount;

  double? _totalBalance;
  double? get totalBalance => _$this._totalBalance;
  set totalBalance(double? totalBalance) => _$this._totalBalance = totalBalance;

  double? _discountAmountPp;
  double? get discountAmountPp => _$this._discountAmountPp;
  set discountAmountPp(double? discountAmountPp) =>
      _$this._discountAmountPp = discountAmountPp;

  double? _pricePpDiscounted;
  double? get pricePpDiscounted => _$this._pricePpDiscounted;
  set pricePpDiscounted(double? pricePpDiscounted) =>
      _$this._pricePpDiscounted = pricePpDiscounted;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ToursRecordBuilder() {
    ToursRecord._initializeBuilder(this);
  }

  ToursRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdTime = $v.createdTime;
      _tourName = $v.tourName;
      _regionID = $v.regionID;
      _uid = $v.uid;
      _passengers = $v.passengers;
      _tourDate = $v.tourDate;
      _pickupAddress = $v.pickupAddress;
      _pickupLatlng = $v.pickupLatlng;
      _pricePp = $v.pricePp;
      _region = $v.region;
      _venues = $v.venues?.toBuilder();
      _guestsUid = $v.guestsUid?.toBuilder();
      _pickupUnitNumber = $v.pickupUnitNumber;
      _tourState = $v.tourState;
      _platformTastingFee = $v.platformTastingFee;
      _driverReff = $v.driverReff;
      _driverUid = $v.driverUid;
      _countryState = $v.countryState;
      _transportFeePp = $v.transportFeePp;
      _totalTastingFeePp = $v.totalTastingFeePp;
      _largeGroupVenueEarlySeatingCount = $v.largeGroupVenueEarlySeatingCount;
      _subTotal = $v.subTotal;
      _totalPaid = $v.totalPaid;
      _lunchVenueFee = $v.lunchVenueFee;
      _discountAmount = $v.discountAmount;
      _totalBalance = $v.totalBalance;
      _discountAmountPp = $v.discountAmountPp;
      _pricePpDiscounted = $v.pricePpDiscounted;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ToursRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ToursRecord;
  }

  @override
  void update(void Function(ToursRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ToursRecord build() => _build();

  _$ToursRecord _build() {
    _$ToursRecord _$result;
    try {
      _$result = _$v ??
          new _$ToursRecord._(
              createdTime: createdTime,
              tourName: tourName,
              regionID: regionID,
              uid: uid,
              passengers: passengers,
              tourDate: tourDate,
              pickupAddress: pickupAddress,
              pickupLatlng: pickupLatlng,
              pricePp: pricePp,
              region: region,
              venues: _venues?.build(),
              guestsUid: _guestsUid?.build(),
              pickupUnitNumber: pickupUnitNumber,
              tourState: tourState,
              platformTastingFee: platformTastingFee,
              driverReff: driverReff,
              driverUid: driverUid,
              countryState: countryState,
              transportFeePp: transportFeePp,
              totalTastingFeePp: totalTastingFeePp,
              largeGroupVenueEarlySeatingCount:
                  largeGroupVenueEarlySeatingCount,
              subTotal: subTotal,
              totalPaid: totalPaid,
              lunchVenueFee: lunchVenueFee,
              discountAmount: discountAmount,
              totalBalance: totalBalance,
              discountAmountPp: discountAmountPp,
              pricePpDiscounted: pricePpDiscounted,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'venues';
        _venues?.build();
        _$failedField = 'guestsUid';
        _guestsUid?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ToursRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
