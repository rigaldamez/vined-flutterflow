// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venues_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VenuesRecord> _$venuesRecordSerializer =
    new _$VenuesRecordSerializer();

class _$VenuesRecordSerializer implements StructuredSerializer<VenuesRecord> {
  @override
  final Iterable<Type> types = const [VenuesRecord, _$VenuesRecord];
  @override
  final String wireName = 'VenuesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, VenuesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.regionID;
    if (value != null) {
      result
        ..add('regionID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.regionName;
    if (value != null) {
      result
        ..add('regionName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tastingFee;
    if (value != null) {
      result
        ..add('tastingFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.capacity;
    if (value != null) {
      result
        ..add('capacity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.openDays;
    if (value != null) {
      result
        ..add('openDays')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    value = object.maxCapacityEnforced;
    if (value != null) {
      result
        ..add('maxCapacityEnforced')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.mustAcknowledgeTCs;
    if (value != null) {
      result
        ..add('mustAcknowledgeTCs')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.regionRef;
    if (value != null) {
      result
        ..add('region_Ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isFavouritedBy;
    if (value != null) {
      result
        ..add('is_favourited_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.countryState;
    if (value != null) {
      result
        ..add('country_state')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isLunchVenueOnly;
    if (value != null) {
      result
        ..add('is_lunch_venue_only')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.largeGroupEarlySeatingOnly;
    if (value != null) {
      result
        ..add('large_group_early_seating_only')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  VenuesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VenuesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'regionID':
          result.regionID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'regionName':
          result.regionName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tastingFee':
          result.tastingFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'capacity':
          result.capacity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'openDays':
          result.openDays.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))!
              as BuiltList<Object?>);
          break;
        case 'maxCapacityEnforced':
          result.maxCapacityEnforced = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'mustAcknowledgeTCs':
          result.mustAcknowledgeTCs = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'region_Ref':
          result.regionRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'is_favourited_by':
          result.isFavouritedBy.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'country_state':
          result.countryState = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_lunch_venue_only':
          result.isLunchVenueOnly = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'large_group_early_seating_only':
          result.largeGroupEarlySeatingOnly = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$VenuesRecord extends VenuesRecord {
  @override
  final String? name;
  @override
  final String? regionID;
  @override
  final String? image;
  @override
  final String? regionName;
  @override
  final double? tastingFee;
  @override
  final int? capacity;
  @override
  final BuiltList<int>? openDays;
  @override
  final bool? maxCapacityEnforced;
  @override
  final bool? mustAcknowledgeTCs;
  @override
  final DocumentReference<Object?>? regionRef;
  @override
  final BuiltList<DocumentReference<Object?>>? isFavouritedBy;
  @override
  final String? countryState;
  @override
  final bool? isLunchVenueOnly;
  @override
  final bool? largeGroupEarlySeatingOnly;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VenuesRecord([void Function(VenuesRecordBuilder)? updates]) =>
      (new VenuesRecordBuilder()..update(updates)).build();

  _$VenuesRecord._(
      {this.name,
      this.regionID,
      this.image,
      this.regionName,
      this.tastingFee,
      this.capacity,
      this.openDays,
      this.maxCapacityEnforced,
      this.mustAcknowledgeTCs,
      this.regionRef,
      this.isFavouritedBy,
      this.countryState,
      this.isLunchVenueOnly,
      this.largeGroupEarlySeatingOnly,
      this.ffRef})
      : super._();

  @override
  VenuesRecord rebuild(void Function(VenuesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VenuesRecordBuilder toBuilder() => new VenuesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VenuesRecord &&
        name == other.name &&
        regionID == other.regionID &&
        image == other.image &&
        regionName == other.regionName &&
        tastingFee == other.tastingFee &&
        capacity == other.capacity &&
        openDays == other.openDays &&
        maxCapacityEnforced == other.maxCapacityEnforced &&
        mustAcknowledgeTCs == other.mustAcknowledgeTCs &&
        regionRef == other.regionRef &&
        isFavouritedBy == other.isFavouritedBy &&
        countryState == other.countryState &&
        isLunchVenueOnly == other.isLunchVenueOnly &&
        largeGroupEarlySeatingOnly == other.largeGroupEarlySeatingOnly &&
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
                                                            $jc(0,
                                                                name.hashCode),
                                                            regionID.hashCode),
                                                        image.hashCode),
                                                    regionName.hashCode),
                                                tastingFee.hashCode),
                                            capacity.hashCode),
                                        openDays.hashCode),
                                    maxCapacityEnforced.hashCode),
                                mustAcknowledgeTCs.hashCode),
                            regionRef.hashCode),
                        isFavouritedBy.hashCode),
                    countryState.hashCode),
                isLunchVenueOnly.hashCode),
            largeGroupEarlySeatingOnly.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('VenuesRecord')
          ..add('name', name)
          ..add('regionID', regionID)
          ..add('image', image)
          ..add('regionName', regionName)
          ..add('tastingFee', tastingFee)
          ..add('capacity', capacity)
          ..add('openDays', openDays)
          ..add('maxCapacityEnforced', maxCapacityEnforced)
          ..add('mustAcknowledgeTCs', mustAcknowledgeTCs)
          ..add('regionRef', regionRef)
          ..add('isFavouritedBy', isFavouritedBy)
          ..add('countryState', countryState)
          ..add('isLunchVenueOnly', isLunchVenueOnly)
          ..add('largeGroupEarlySeatingOnly', largeGroupEarlySeatingOnly)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VenuesRecordBuilder
    implements Builder<VenuesRecord, VenuesRecordBuilder> {
  _$VenuesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _regionID;
  String? get regionID => _$this._regionID;
  set regionID(String? regionID) => _$this._regionID = regionID;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _regionName;
  String? get regionName => _$this._regionName;
  set regionName(String? regionName) => _$this._regionName = regionName;

  double? _tastingFee;
  double? get tastingFee => _$this._tastingFee;
  set tastingFee(double? tastingFee) => _$this._tastingFee = tastingFee;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  ListBuilder<int>? _openDays;
  ListBuilder<int> get openDays => _$this._openDays ??= new ListBuilder<int>();
  set openDays(ListBuilder<int>? openDays) => _$this._openDays = openDays;

  bool? _maxCapacityEnforced;
  bool? get maxCapacityEnforced => _$this._maxCapacityEnforced;
  set maxCapacityEnforced(bool? maxCapacityEnforced) =>
      _$this._maxCapacityEnforced = maxCapacityEnforced;

  bool? _mustAcknowledgeTCs;
  bool? get mustAcknowledgeTCs => _$this._mustAcknowledgeTCs;
  set mustAcknowledgeTCs(bool? mustAcknowledgeTCs) =>
      _$this._mustAcknowledgeTCs = mustAcknowledgeTCs;

  DocumentReference<Object?>? _regionRef;
  DocumentReference<Object?>? get regionRef => _$this._regionRef;
  set regionRef(DocumentReference<Object?>? regionRef) =>
      _$this._regionRef = regionRef;

  ListBuilder<DocumentReference<Object?>>? _isFavouritedBy;
  ListBuilder<DocumentReference<Object?>> get isFavouritedBy =>
      _$this._isFavouritedBy ??= new ListBuilder<DocumentReference<Object?>>();
  set isFavouritedBy(ListBuilder<DocumentReference<Object?>>? isFavouritedBy) =>
      _$this._isFavouritedBy = isFavouritedBy;

  String? _countryState;
  String? get countryState => _$this._countryState;
  set countryState(String? countryState) => _$this._countryState = countryState;

  bool? _isLunchVenueOnly;
  bool? get isLunchVenueOnly => _$this._isLunchVenueOnly;
  set isLunchVenueOnly(bool? isLunchVenueOnly) =>
      _$this._isLunchVenueOnly = isLunchVenueOnly;

  bool? _largeGroupEarlySeatingOnly;
  bool? get largeGroupEarlySeatingOnly => _$this._largeGroupEarlySeatingOnly;
  set largeGroupEarlySeatingOnly(bool? largeGroupEarlySeatingOnly) =>
      _$this._largeGroupEarlySeatingOnly = largeGroupEarlySeatingOnly;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VenuesRecordBuilder() {
    VenuesRecord._initializeBuilder(this);
  }

  VenuesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _regionID = $v.regionID;
      _image = $v.image;
      _regionName = $v.regionName;
      _tastingFee = $v.tastingFee;
      _capacity = $v.capacity;
      _openDays = $v.openDays?.toBuilder();
      _maxCapacityEnforced = $v.maxCapacityEnforced;
      _mustAcknowledgeTCs = $v.mustAcknowledgeTCs;
      _regionRef = $v.regionRef;
      _isFavouritedBy = $v.isFavouritedBy?.toBuilder();
      _countryState = $v.countryState;
      _isLunchVenueOnly = $v.isLunchVenueOnly;
      _largeGroupEarlySeatingOnly = $v.largeGroupEarlySeatingOnly;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VenuesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VenuesRecord;
  }

  @override
  void update(void Function(VenuesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$VenuesRecord build() {
    _$VenuesRecord _$result;
    try {
      _$result = _$v ??
          new _$VenuesRecord._(
              name: name,
              regionID: regionID,
              image: image,
              regionName: regionName,
              tastingFee: tastingFee,
              capacity: capacity,
              openDays: _openDays?.build(),
              maxCapacityEnforced: maxCapacityEnforced,
              mustAcknowledgeTCs: mustAcknowledgeTCs,
              regionRef: regionRef,
              isFavouritedBy: _isFavouritedBy?.build(),
              countryState: countryState,
              isLunchVenueOnly: isLunchVenueOnly,
              largeGroupEarlySeatingOnly: largeGroupEarlySeatingOnly,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'openDays';
        _openDays?.build();

        _$failedField = 'isFavouritedBy';
        _isFavouritedBy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'VenuesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
