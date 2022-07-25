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
    value = object.discountAmount;
    if (value != null) {
      result
        ..add('discount_amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalPaid;
    if (value != null) {
      result
        ..add('total_paid')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalBalance;
    if (value != null) {
      result
        ..add('total_balance')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.promoCode;
    if (value != null) {
      result
        ..add('promo_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.promoDiscountPercent;
    if (value != null) {
      result
        ..add('promo_discount_percent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.promoCodeSubmitted;
    if (value != null) {
      result
        ..add('promo_code_submitted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
      final key = iterator.current as String;
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
        case 'discount_amount':
          result.discountAmount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total_paid':
          result.totalPaid = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total_balance':
          result.totalBalance = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'promo_code':
          result.promoCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'promo_discount_percent':
          result.promoDiscountPercent = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'promo_code_submitted':
          result.promoCodeSubmitted = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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
  final int? discountAmount;
  @override
  final int? totalPaid;
  @override
  final int? totalBalance;
  @override
  final String? promoCode;
  @override
  final double? promoDiscountPercent;
  @override
  final String? promoCodeSubmitted;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ToursRecord([void Function(ToursRecordBuilder)? updates]) =>
      (new ToursRecordBuilder()..update(updates)).build();

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
      this.discountAmount,
      this.totalPaid,
      this.totalBalance,
      this.promoCode,
      this.promoDiscountPercent,
      this.promoCodeSubmitted,
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
        discountAmount == other.discountAmount &&
        totalPaid == other.totalPaid &&
        totalBalance == other.totalBalance &&
        promoCode == other.promoCode &&
        promoDiscountPercent == other.promoDiscountPercent &&
        promoCodeSubmitted == other.promoCodeSubmitted &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, createdTime.hashCode), tourName.hashCode), regionID.hashCode), uid.hashCode), passengers.hashCode), tourDate.hashCode), pickupAddress.hashCode), pickupLatlng.hashCode), pricePp.hashCode), region.hashCode),
                                                                                venues.hashCode),
                                                                            guestsUid.hashCode),
                                                                        pickupUnitNumber.hashCode),
                                                                    tourState.hashCode),
                                                                platformTastingFee.hashCode),
                                                            driverReff.hashCode),
                                                        driverUid.hashCode),
                                                    countryState.hashCode),
                                                transportFeePp.hashCode),
                                            totalTastingFeePp.hashCode),
                                        largeGroupVenueEarlySeatingCount.hashCode),
                                    subTotal.hashCode),
                                discountAmount.hashCode),
                            totalPaid.hashCode),
                        totalBalance.hashCode),
                    promoCode.hashCode),
                promoDiscountPercent.hashCode),
            promoCodeSubmitted.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ToursRecord')
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
          ..add('discountAmount', discountAmount)
          ..add('totalPaid', totalPaid)
          ..add('totalBalance', totalBalance)
          ..add('promoCode', promoCode)
          ..add('promoDiscountPercent', promoDiscountPercent)
          ..add('promoCodeSubmitted', promoCodeSubmitted)
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

  int? _discountAmount;
  int? get discountAmount => _$this._discountAmount;
  set discountAmount(int? discountAmount) =>
      _$this._discountAmount = discountAmount;

  int? _totalPaid;
  int? get totalPaid => _$this._totalPaid;
  set totalPaid(int? totalPaid) => _$this._totalPaid = totalPaid;

  int? _totalBalance;
  int? get totalBalance => _$this._totalBalance;
  set totalBalance(int? totalBalance) => _$this._totalBalance = totalBalance;

  String? _promoCode;
  String? get promoCode => _$this._promoCode;
  set promoCode(String? promoCode) => _$this._promoCode = promoCode;

  double? _promoDiscountPercent;
  double? get promoDiscountPercent => _$this._promoDiscountPercent;
  set promoDiscountPercent(double? promoDiscountPercent) =>
      _$this._promoDiscountPercent = promoDiscountPercent;

  String? _promoCodeSubmitted;
  String? get promoCodeSubmitted => _$this._promoCodeSubmitted;
  set promoCodeSubmitted(String? promoCodeSubmitted) =>
      _$this._promoCodeSubmitted = promoCodeSubmitted;

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
      _discountAmount = $v.discountAmount;
      _totalPaid = $v.totalPaid;
      _totalBalance = $v.totalBalance;
      _promoCode = $v.promoCode;
      _promoDiscountPercent = $v.promoDiscountPercent;
      _promoCodeSubmitted = $v.promoCodeSubmitted;
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
  _$ToursRecord build() {
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
              discountAmount: discountAmount,
              totalPaid: totalPaid,
              totalBalance: totalBalance,
              promoCode: promoCode,
              promoDiscountPercent: promoDiscountPercent,
              promoCodeSubmitted: promoCodeSubmitted,
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
            'ToursRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
