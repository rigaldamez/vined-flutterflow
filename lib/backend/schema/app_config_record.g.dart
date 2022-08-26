// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppConfigRecord> _$appConfigRecordSerializer =
    new _$AppConfigRecordSerializer();

class _$AppConfigRecordSerializer
    implements StructuredSerializer<AppConfigRecord> {
  @override
  final Iterable<Type> types = const [AppConfigRecord, _$AppConfigRecord];
  @override
  final String wireName = 'AppConfigRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AppConfigRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.vinedMessengerURL;
    if (value != null) {
      result
        ..add('vinedMessengerURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.itineraryVenueLimit;
    if (value != null) {
      result
        ..add('itineraryVenueLimit')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.platformTastingFee;
    if (value != null) {
      result
        ..add('platformTastingFee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tourLeadTime;
    if (value != null) {
      result
        ..add('tourLeadTime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.vinedWebsiteURL;
    if (value != null) {
      result
        ..add('vinedWebsiteURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.largeGroupThreshold;
    if (value != null) {
      result
        ..add('large_group_threshold')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.largeGroupVenuesEarlySeatingThreshold;
    if (value != null) {
      result
        ..add('large_group_venues_early_seating_threshold')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.lunchVenueFee;
    if (value != null) {
      result
        ..add('lunch_venue_fee')
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
  AppConfigRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppConfigRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vinedMessengerURL':
          result.vinedMessengerURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'itineraryVenueLimit':
          result.itineraryVenueLimit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'platformTastingFee':
          result.platformTastingFee = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'tourLeadTime':
          result.tourLeadTime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'vinedWebsiteURL':
          result.vinedWebsiteURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'large_group_threshold':
          result.largeGroupThreshold = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'large_group_venues_early_seating_threshold':
          result.largeGroupVenuesEarlySeatingThreshold = serializers
              .deserialize(value, specifiedType: const FullType(int)) as int?;
          break;
        case 'lunch_venue_fee':
          result.lunchVenueFee = serializers.deserialize(value,
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

class _$AppConfigRecord extends AppConfigRecord {
  @override
  final String? vinedMessengerURL;
  @override
  final int? itineraryVenueLimit;
  @override
  final double? platformTastingFee;
  @override
  final int? tourLeadTime;
  @override
  final String? vinedWebsiteURL;
  @override
  final int? largeGroupThreshold;
  @override
  final int? largeGroupVenuesEarlySeatingThreshold;
  @override
  final double? lunchVenueFee;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AppConfigRecord([void Function(AppConfigRecordBuilder)? updates]) =>
      (new AppConfigRecordBuilder()..update(updates))._build();

  _$AppConfigRecord._(
      {this.vinedMessengerURL,
      this.itineraryVenueLimit,
      this.platformTastingFee,
      this.tourLeadTime,
      this.vinedWebsiteURL,
      this.largeGroupThreshold,
      this.largeGroupVenuesEarlySeatingThreshold,
      this.lunchVenueFee,
      this.ffRef})
      : super._();

  @override
  AppConfigRecord rebuild(void Function(AppConfigRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppConfigRecordBuilder toBuilder() =>
      new AppConfigRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppConfigRecord &&
        vinedMessengerURL == other.vinedMessengerURL &&
        itineraryVenueLimit == other.itineraryVenueLimit &&
        platformTastingFee == other.platformTastingFee &&
        tourLeadTime == other.tourLeadTime &&
        vinedWebsiteURL == other.vinedWebsiteURL &&
        largeGroupThreshold == other.largeGroupThreshold &&
        largeGroupVenuesEarlySeatingThreshold ==
            other.largeGroupVenuesEarlySeatingThreshold &&
        lunchVenueFee == other.lunchVenueFee &&
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
                                $jc($jc(0, vinedMessengerURL.hashCode),
                                    itineraryVenueLimit.hashCode),
                                platformTastingFee.hashCode),
                            tourLeadTime.hashCode),
                        vinedWebsiteURL.hashCode),
                    largeGroupThreshold.hashCode),
                largeGroupVenuesEarlySeatingThreshold.hashCode),
            lunchVenueFee.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AppConfigRecord')
          ..add('vinedMessengerURL', vinedMessengerURL)
          ..add('itineraryVenueLimit', itineraryVenueLimit)
          ..add('platformTastingFee', platformTastingFee)
          ..add('tourLeadTime', tourLeadTime)
          ..add('vinedWebsiteURL', vinedWebsiteURL)
          ..add('largeGroupThreshold', largeGroupThreshold)
          ..add('largeGroupVenuesEarlySeatingThreshold',
              largeGroupVenuesEarlySeatingThreshold)
          ..add('lunchVenueFee', lunchVenueFee)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AppConfigRecordBuilder
    implements Builder<AppConfigRecord, AppConfigRecordBuilder> {
  _$AppConfigRecord? _$v;

  String? _vinedMessengerURL;
  String? get vinedMessengerURL => _$this._vinedMessengerURL;
  set vinedMessengerURL(String? vinedMessengerURL) =>
      _$this._vinedMessengerURL = vinedMessengerURL;

  int? _itineraryVenueLimit;
  int? get itineraryVenueLimit => _$this._itineraryVenueLimit;
  set itineraryVenueLimit(int? itineraryVenueLimit) =>
      _$this._itineraryVenueLimit = itineraryVenueLimit;

  double? _platformTastingFee;
  double? get platformTastingFee => _$this._platformTastingFee;
  set platformTastingFee(double? platformTastingFee) =>
      _$this._platformTastingFee = platformTastingFee;

  int? _tourLeadTime;
  int? get tourLeadTime => _$this._tourLeadTime;
  set tourLeadTime(int? tourLeadTime) => _$this._tourLeadTime = tourLeadTime;

  String? _vinedWebsiteURL;
  String? get vinedWebsiteURL => _$this._vinedWebsiteURL;
  set vinedWebsiteURL(String? vinedWebsiteURL) =>
      _$this._vinedWebsiteURL = vinedWebsiteURL;

  int? _largeGroupThreshold;
  int? get largeGroupThreshold => _$this._largeGroupThreshold;
  set largeGroupThreshold(int? largeGroupThreshold) =>
      _$this._largeGroupThreshold = largeGroupThreshold;

  int? _largeGroupVenuesEarlySeatingThreshold;
  int? get largeGroupVenuesEarlySeatingThreshold =>
      _$this._largeGroupVenuesEarlySeatingThreshold;
  set largeGroupVenuesEarlySeatingThreshold(
          int? largeGroupVenuesEarlySeatingThreshold) =>
      _$this._largeGroupVenuesEarlySeatingThreshold =
          largeGroupVenuesEarlySeatingThreshold;

  double? _lunchVenueFee;
  double? get lunchVenueFee => _$this._lunchVenueFee;
  set lunchVenueFee(double? lunchVenueFee) =>
      _$this._lunchVenueFee = lunchVenueFee;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AppConfigRecordBuilder() {
    AppConfigRecord._initializeBuilder(this);
  }

  AppConfigRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vinedMessengerURL = $v.vinedMessengerURL;
      _itineraryVenueLimit = $v.itineraryVenueLimit;
      _platformTastingFee = $v.platformTastingFee;
      _tourLeadTime = $v.tourLeadTime;
      _vinedWebsiteURL = $v.vinedWebsiteURL;
      _largeGroupThreshold = $v.largeGroupThreshold;
      _largeGroupVenuesEarlySeatingThreshold =
          $v.largeGroupVenuesEarlySeatingThreshold;
      _lunchVenueFee = $v.lunchVenueFee;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppConfigRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppConfigRecord;
  }

  @override
  void update(void Function(AppConfigRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AppConfigRecord build() => _build();

  _$AppConfigRecord _build() {
    final _$result = _$v ??
        new _$AppConfigRecord._(
            vinedMessengerURL: vinedMessengerURL,
            itineraryVenueLimit: itineraryVenueLimit,
            platformTastingFee: platformTastingFee,
            tourLeadTime: tourLeadTime,
            vinedWebsiteURL: vinedWebsiteURL,
            largeGroupThreshold: largeGroupThreshold,
            largeGroupVenuesEarlySeatingThreshold:
                largeGroupVenuesEarlySeatingThreshold,
            lunchVenueFee: lunchVenueFee,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
