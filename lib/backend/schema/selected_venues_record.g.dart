// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_venues_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SelectedVenuesRecord> _$selectedVenuesRecordSerializer =
    new _$SelectedVenuesRecordSerializer();

class _$SelectedVenuesRecordSerializer
    implements StructuredSerializer<SelectedVenuesRecord> {
  @override
  final Iterable<Type> types = const [
    SelectedVenuesRecord,
    _$SelectedVenuesRecord
  ];
  @override
  final String wireName = 'SelectedVenuesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SelectedVenuesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.venueRef;
    if (value != null) {
      result
        ..add('venueRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.tourRef;
    if (value != null) {
      result
        ..add('tourRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.addedByUid;
    if (value != null) {
      result
        ..add('added_by_uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isLunchVenue;
    if (value != null) {
      result
        ..add('is_lunch_venue')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.tastingFee;
    if (value != null) {
      result
        ..add('tastingFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.addedDate;
    if (value != null) {
      result
        ..add('addedDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bookingReference;
    if (value != null) {
      result
        ..add('bookingReference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reservationTime;
    if (value != null) {
      result
        ..add('reservationTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.regionID;
    if (value != null) {
      result
        ..add('region_ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isLargeGroupEarlySeatingOnlyVenue;
    if (value != null) {
      result
        ..add('is_large_group_early_seating_only_venue')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.isLunchVenueOnly;
    if (value != null) {
      result
        ..add('is_lunch_venue_only')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.tastingExperienceDescription;
    if (value != null) {
      result
        ..add('tasting_experience_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isTastingIncluded;
    if (value != null) {
      result
        ..add('is_tasting_included')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.openDays;
    if (value != null) {
      result
        ..add('openDays')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.capacity;
    if (value != null) {
      result
        ..add('capacity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  SelectedVenuesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SelectedVenuesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'venueRef':
          result.venueRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'tourRef':
          result.tourRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'added_by_uid':
          result.addedByUid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'is_lunch_venue':
          result.isLunchVenue = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'tastingFee':
          result.tastingFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'addedDate':
          result.addedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bookingReference':
          result.bookingReference = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reservationTime':
          result.reservationTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'region_ID':
          result.regionID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'is_large_group_early_seating_only_venue':
          result.isLargeGroupEarlySeatingOnlyVenue = serializers
              .deserialize(value, specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_lunch_venue_only':
          result.isLunchVenueOnly = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'tasting_experience_description':
          result.tastingExperienceDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_tasting_included':
          result.isTastingIncluded = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'openDays':
          result.openDays.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'capacity':
          result.capacity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$SelectedVenuesRecord extends SelectedVenuesRecord {
  @override
  final DocumentReference<Object?>? venueRef;
  @override
  final DocumentReference<Object?>? tourRef;
  @override
  final DocumentReference<Object?>? addedByUid;
  @override
  final bool? isLunchVenue;
  @override
  final double? tastingFee;
  @override
  final DateTime? addedDate;
  @override
  final String? bookingReference;
  @override
  final DateTime? reservationTime;
  @override
  final DocumentReference<Object?>? regionID;
  @override
  final bool? isLargeGroupEarlySeatingOnlyVenue;
  @override
  final bool? isLunchVenueOnly;
  @override
  final String? tastingExperienceDescription;
  @override
  final bool? isTastingIncluded;
  @override
  final BuiltList<int>? openDays;
  @override
  final int? capacity;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SelectedVenuesRecord(
          [void Function(SelectedVenuesRecordBuilder)? updates]) =>
      (new SelectedVenuesRecordBuilder()..update(updates))._build();

  _$SelectedVenuesRecord._(
      {this.venueRef,
      this.tourRef,
      this.addedByUid,
      this.isLunchVenue,
      this.tastingFee,
      this.addedDate,
      this.bookingReference,
      this.reservationTime,
      this.regionID,
      this.isLargeGroupEarlySeatingOnlyVenue,
      this.isLunchVenueOnly,
      this.tastingExperienceDescription,
      this.isTastingIncluded,
      this.openDays,
      this.capacity,
      this.ffRef})
      : super._();

  @override
  SelectedVenuesRecord rebuild(
          void Function(SelectedVenuesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SelectedVenuesRecordBuilder toBuilder() =>
      new SelectedVenuesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SelectedVenuesRecord &&
        venueRef == other.venueRef &&
        tourRef == other.tourRef &&
        addedByUid == other.addedByUid &&
        isLunchVenue == other.isLunchVenue &&
        tastingFee == other.tastingFee &&
        addedDate == other.addedDate &&
        bookingReference == other.bookingReference &&
        reservationTime == other.reservationTime &&
        regionID == other.regionID &&
        isLargeGroupEarlySeatingOnlyVenue ==
            other.isLargeGroupEarlySeatingOnlyVenue &&
        isLunchVenueOnly == other.isLunchVenueOnly &&
        tastingExperienceDescription == other.tastingExperienceDescription &&
        isTastingIncluded == other.isTastingIncluded &&
        openDays == other.openDays &&
        capacity == other.capacity &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, venueRef.hashCode);
    _$hash = $jc(_$hash, tourRef.hashCode);
    _$hash = $jc(_$hash, addedByUid.hashCode);
    _$hash = $jc(_$hash, isLunchVenue.hashCode);
    _$hash = $jc(_$hash, tastingFee.hashCode);
    _$hash = $jc(_$hash, addedDate.hashCode);
    _$hash = $jc(_$hash, bookingReference.hashCode);
    _$hash = $jc(_$hash, reservationTime.hashCode);
    _$hash = $jc(_$hash, regionID.hashCode);
    _$hash = $jc(_$hash, isLargeGroupEarlySeatingOnlyVenue.hashCode);
    _$hash = $jc(_$hash, isLunchVenueOnly.hashCode);
    _$hash = $jc(_$hash, tastingExperienceDescription.hashCode);
    _$hash = $jc(_$hash, isTastingIncluded.hashCode);
    _$hash = $jc(_$hash, openDays.hashCode);
    _$hash = $jc(_$hash, capacity.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SelectedVenuesRecord')
          ..add('venueRef', venueRef)
          ..add('tourRef', tourRef)
          ..add('addedByUid', addedByUid)
          ..add('isLunchVenue', isLunchVenue)
          ..add('tastingFee', tastingFee)
          ..add('addedDate', addedDate)
          ..add('bookingReference', bookingReference)
          ..add('reservationTime', reservationTime)
          ..add('regionID', regionID)
          ..add('isLargeGroupEarlySeatingOnlyVenue',
              isLargeGroupEarlySeatingOnlyVenue)
          ..add('isLunchVenueOnly', isLunchVenueOnly)
          ..add('tastingExperienceDescription', tastingExperienceDescription)
          ..add('isTastingIncluded', isTastingIncluded)
          ..add('openDays', openDays)
          ..add('capacity', capacity)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SelectedVenuesRecordBuilder
    implements Builder<SelectedVenuesRecord, SelectedVenuesRecordBuilder> {
  _$SelectedVenuesRecord? _$v;

  DocumentReference<Object?>? _venueRef;
  DocumentReference<Object?>? get venueRef => _$this._venueRef;
  set venueRef(DocumentReference<Object?>? venueRef) =>
      _$this._venueRef = venueRef;

  DocumentReference<Object?>? _tourRef;
  DocumentReference<Object?>? get tourRef => _$this._tourRef;
  set tourRef(DocumentReference<Object?>? tourRef) => _$this._tourRef = tourRef;

  DocumentReference<Object?>? _addedByUid;
  DocumentReference<Object?>? get addedByUid => _$this._addedByUid;
  set addedByUid(DocumentReference<Object?>? addedByUid) =>
      _$this._addedByUid = addedByUid;

  bool? _isLunchVenue;
  bool? get isLunchVenue => _$this._isLunchVenue;
  set isLunchVenue(bool? isLunchVenue) => _$this._isLunchVenue = isLunchVenue;

  double? _tastingFee;
  double? get tastingFee => _$this._tastingFee;
  set tastingFee(double? tastingFee) => _$this._tastingFee = tastingFee;

  DateTime? _addedDate;
  DateTime? get addedDate => _$this._addedDate;
  set addedDate(DateTime? addedDate) => _$this._addedDate = addedDate;

  String? _bookingReference;
  String? get bookingReference => _$this._bookingReference;
  set bookingReference(String? bookingReference) =>
      _$this._bookingReference = bookingReference;

  DateTime? _reservationTime;
  DateTime? get reservationTime => _$this._reservationTime;
  set reservationTime(DateTime? reservationTime) =>
      _$this._reservationTime = reservationTime;

  DocumentReference<Object?>? _regionID;
  DocumentReference<Object?>? get regionID => _$this._regionID;
  set regionID(DocumentReference<Object?>? regionID) =>
      _$this._regionID = regionID;

  bool? _isLargeGroupEarlySeatingOnlyVenue;
  bool? get isLargeGroupEarlySeatingOnlyVenue =>
      _$this._isLargeGroupEarlySeatingOnlyVenue;
  set isLargeGroupEarlySeatingOnlyVenue(
          bool? isLargeGroupEarlySeatingOnlyVenue) =>
      _$this._isLargeGroupEarlySeatingOnlyVenue =
          isLargeGroupEarlySeatingOnlyVenue;

  bool? _isLunchVenueOnly;
  bool? get isLunchVenueOnly => _$this._isLunchVenueOnly;
  set isLunchVenueOnly(bool? isLunchVenueOnly) =>
      _$this._isLunchVenueOnly = isLunchVenueOnly;

  String? _tastingExperienceDescription;
  String? get tastingExperienceDescription =>
      _$this._tastingExperienceDescription;
  set tastingExperienceDescription(String? tastingExperienceDescription) =>
      _$this._tastingExperienceDescription = tastingExperienceDescription;

  bool? _isTastingIncluded;
  bool? get isTastingIncluded => _$this._isTastingIncluded;
  set isTastingIncluded(bool? isTastingIncluded) =>
      _$this._isTastingIncluded = isTastingIncluded;

  ListBuilder<int>? _openDays;
  ListBuilder<int> get openDays => _$this._openDays ??= new ListBuilder<int>();
  set openDays(ListBuilder<int>? openDays) => _$this._openDays = openDays;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SelectedVenuesRecordBuilder() {
    SelectedVenuesRecord._initializeBuilder(this);
  }

  SelectedVenuesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _venueRef = $v.venueRef;
      _tourRef = $v.tourRef;
      _addedByUid = $v.addedByUid;
      _isLunchVenue = $v.isLunchVenue;
      _tastingFee = $v.tastingFee;
      _addedDate = $v.addedDate;
      _bookingReference = $v.bookingReference;
      _reservationTime = $v.reservationTime;
      _regionID = $v.regionID;
      _isLargeGroupEarlySeatingOnlyVenue = $v.isLargeGroupEarlySeatingOnlyVenue;
      _isLunchVenueOnly = $v.isLunchVenueOnly;
      _tastingExperienceDescription = $v.tastingExperienceDescription;
      _isTastingIncluded = $v.isTastingIncluded;
      _openDays = $v.openDays?.toBuilder();
      _capacity = $v.capacity;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SelectedVenuesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SelectedVenuesRecord;
  }

  @override
  void update(void Function(SelectedVenuesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SelectedVenuesRecord build() => _build();

  _$SelectedVenuesRecord _build() {
    _$SelectedVenuesRecord _$result;
    try {
      _$result = _$v ??
          new _$SelectedVenuesRecord._(
              venueRef: venueRef,
              tourRef: tourRef,
              addedByUid: addedByUid,
              isLunchVenue: isLunchVenue,
              tastingFee: tastingFee,
              addedDate: addedDate,
              bookingReference: bookingReference,
              reservationTime: reservationTime,
              regionID: regionID,
              isLargeGroupEarlySeatingOnlyVenue:
                  isLargeGroupEarlySeatingOnlyVenue,
              isLunchVenueOnly: isLunchVenueOnly,
              tastingExperienceDescription: tastingExperienceDescription,
              isTastingIncluded: isTastingIncluded,
              openDays: _openDays?.build(),
              capacity: capacity,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'openDays';
        _openDays?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SelectedVenuesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
