// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accepted_tours_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AcceptedToursRecord> _$acceptedToursRecordSerializer =
    new _$AcceptedToursRecordSerializer();

class _$AcceptedToursRecordSerializer
    implements StructuredSerializer<AcceptedToursRecord> {
  @override
  final Iterable<Type> types = const [
    AcceptedToursRecord,
    _$AcceptedToursRecord
  ];
  @override
  final String wireName = 'AcceptedToursRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, AcceptedToursRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.tourID;
    if (value != null) {
      result
        ..add('tourID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.customerReff;
    if (value != null) {
      result
        ..add('customer_reff')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.driverReff;
    if (value != null) {
      result
        ..add('driver_reff')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.acceptedDate;
    if (value != null) {
      result
        ..add('accepted_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  AcceptedToursRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AcceptedToursRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'tourID':
          result.tourID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'customer_reff':
          result.customerReff = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'driver_reff':
          result.driverReff = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'accepted_date':
          result.acceptedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$AcceptedToursRecord extends AcceptedToursRecord {
  @override
  final DocumentReference<Object?>? tourID;
  @override
  final DocumentReference<Object?>? customerReff;
  @override
  final DocumentReference<Object?>? driverReff;
  @override
  final DateTime? acceptedDate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AcceptedToursRecord(
          [void Function(AcceptedToursRecordBuilder)? updates]) =>
      (new AcceptedToursRecordBuilder()..update(updates))._build();

  _$AcceptedToursRecord._(
      {this.tourID,
      this.customerReff,
      this.driverReff,
      this.acceptedDate,
      this.ffRef})
      : super._();

  @override
  AcceptedToursRecord rebuild(
          void Function(AcceptedToursRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptedToursRecordBuilder toBuilder() =>
      new AcceptedToursRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptedToursRecord &&
        tourID == other.tourID &&
        customerReff == other.customerReff &&
        driverReff == other.driverReff &&
        acceptedDate == other.acceptedDate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tourID.hashCode);
    _$hash = $jc(_$hash, customerReff.hashCode);
    _$hash = $jc(_$hash, driverReff.hashCode);
    _$hash = $jc(_$hash, acceptedDate.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AcceptedToursRecord')
          ..add('tourID', tourID)
          ..add('customerReff', customerReff)
          ..add('driverReff', driverReff)
          ..add('acceptedDate', acceptedDate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AcceptedToursRecordBuilder
    implements Builder<AcceptedToursRecord, AcceptedToursRecordBuilder> {
  _$AcceptedToursRecord? _$v;

  DocumentReference<Object?>? _tourID;
  DocumentReference<Object?>? get tourID => _$this._tourID;
  set tourID(DocumentReference<Object?>? tourID) => _$this._tourID = tourID;

  DocumentReference<Object?>? _customerReff;
  DocumentReference<Object?>? get customerReff => _$this._customerReff;
  set customerReff(DocumentReference<Object?>? customerReff) =>
      _$this._customerReff = customerReff;

  DocumentReference<Object?>? _driverReff;
  DocumentReference<Object?>? get driverReff => _$this._driverReff;
  set driverReff(DocumentReference<Object?>? driverReff) =>
      _$this._driverReff = driverReff;

  DateTime? _acceptedDate;
  DateTime? get acceptedDate => _$this._acceptedDate;
  set acceptedDate(DateTime? acceptedDate) =>
      _$this._acceptedDate = acceptedDate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AcceptedToursRecordBuilder() {
    AcceptedToursRecord._initializeBuilder(this);
  }

  AcceptedToursRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tourID = $v.tourID;
      _customerReff = $v.customerReff;
      _driverReff = $v.driverReff;
      _acceptedDate = $v.acceptedDate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcceptedToursRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AcceptedToursRecord;
  }

  @override
  void update(void Function(AcceptedToursRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptedToursRecord build() => _build();

  _$AcceptedToursRecord _build() {
    final _$result = _$v ??
        new _$AcceptedToursRecord._(
            tourID: tourID,
            customerReff: customerReff,
            driverReff: driverReff,
            acceptedDate: acceptedDate,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
