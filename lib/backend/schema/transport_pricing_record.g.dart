// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_pricing_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransportPricingRecord> _$transportPricingRecordSerializer =
    new _$TransportPricingRecordSerializer();

class _$TransportPricingRecordSerializer
    implements StructuredSerializer<TransportPricingRecord> {
  @override
  final Iterable<Type> types = const [
    TransportPricingRecord,
    _$TransportPricingRecord
  ];
  @override
  final String wireName = 'TransportPricingRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TransportPricingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.passengersLbl;
    if (value != null) {
      result
        ..add('passengersLbl')
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
  TransportPricingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransportPricingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'passengersLbl':
          result.passengersLbl = serializers.deserialize(value,
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

class _$TransportPricingRecord extends TransportPricingRecord {
  @override
  final double? price;
  @override
  final int? passengersLbl;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TransportPricingRecord(
          [void Function(TransportPricingRecordBuilder)? updates]) =>
      (new TransportPricingRecordBuilder()..update(updates))._build();

  _$TransportPricingRecord._({this.price, this.passengersLbl, this.ffRef})
      : super._();

  @override
  TransportPricingRecord rebuild(
          void Function(TransportPricingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransportPricingRecordBuilder toBuilder() =>
      new TransportPricingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransportPricingRecord &&
        price == other.price &&
        passengersLbl == other.passengersLbl &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, price.hashCode), passengersLbl.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransportPricingRecord')
          ..add('price', price)
          ..add('passengersLbl', passengersLbl)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TransportPricingRecordBuilder
    implements Builder<TransportPricingRecord, TransportPricingRecordBuilder> {
  _$TransportPricingRecord? _$v;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  int? _passengersLbl;
  int? get passengersLbl => _$this._passengersLbl;
  set passengersLbl(int? passengersLbl) =>
      _$this._passengersLbl = passengersLbl;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TransportPricingRecordBuilder() {
    TransportPricingRecord._initializeBuilder(this);
  }

  TransportPricingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _price = $v.price;
      _passengersLbl = $v.passengersLbl;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransportPricingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransportPricingRecord;
  }

  @override
  void update(void Function(TransportPricingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransportPricingRecord build() => _build();

  _$TransportPricingRecord _build() {
    final _$result = _$v ??
        new _$TransportPricingRecord._(
            price: price, passengersLbl: passengersLbl, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
