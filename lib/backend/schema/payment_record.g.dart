// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentRecord> _$paymentRecordSerializer =
    new _$PaymentRecordSerializer();

class _$PaymentRecordSerializer implements StructuredSerializer<PaymentRecord> {
  @override
  final Iterable<Type> types = const [PaymentRecord, _$PaymentRecord];
  @override
  final String wireName = 'PaymentRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PaymentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.paymentByUserRef;
    if (value != null) {
      result
        ..add('payment_by_user_Ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.amountPaid;
    if (value != null) {
      result
        ..add('amount_paid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.datePaid;
    if (value != null) {
      result
        ..add('date_paid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.stripePaymentID;
    if (value != null) {
      result
        ..add('stripe_paymentID')
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
  PaymentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'payment_by_user_Ref':
          result.paymentByUserRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'amount_paid':
          result.amountPaid = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'date_paid':
          result.datePaid = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'stripe_paymentID':
          result.stripePaymentID = serializers.deserialize(value,
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

class _$PaymentRecord extends PaymentRecord {
  @override
  final DocumentReference<Object?>? paymentByUserRef;
  @override
  final double? amountPaid;
  @override
  final DateTime? datePaid;
  @override
  final String? stripePaymentID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PaymentRecord([void Function(PaymentRecordBuilder)? updates]) =>
      (new PaymentRecordBuilder()..update(updates))._build();

  _$PaymentRecord._(
      {this.paymentByUserRef,
      this.amountPaid,
      this.datePaid,
      this.stripePaymentID,
      this.ffRef})
      : super._();

  @override
  PaymentRecord rebuild(void Function(PaymentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentRecordBuilder toBuilder() => new PaymentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentRecord &&
        paymentByUserRef == other.paymentByUserRef &&
        amountPaid == other.amountPaid &&
        datePaid == other.datePaid &&
        stripePaymentID == other.stripePaymentID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentByUserRef.hashCode);
    _$hash = $jc(_$hash, amountPaid.hashCode);
    _$hash = $jc(_$hash, datePaid.hashCode);
    _$hash = $jc(_$hash, stripePaymentID.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentRecord')
          ..add('paymentByUserRef', paymentByUserRef)
          ..add('amountPaid', amountPaid)
          ..add('datePaid', datePaid)
          ..add('stripePaymentID', stripePaymentID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PaymentRecordBuilder
    implements Builder<PaymentRecord, PaymentRecordBuilder> {
  _$PaymentRecord? _$v;

  DocumentReference<Object?>? _paymentByUserRef;
  DocumentReference<Object?>? get paymentByUserRef => _$this._paymentByUserRef;
  set paymentByUserRef(DocumentReference<Object?>? paymentByUserRef) =>
      _$this._paymentByUserRef = paymentByUserRef;

  double? _amountPaid;
  double? get amountPaid => _$this._amountPaid;
  set amountPaid(double? amountPaid) => _$this._amountPaid = amountPaid;

  DateTime? _datePaid;
  DateTime? get datePaid => _$this._datePaid;
  set datePaid(DateTime? datePaid) => _$this._datePaid = datePaid;

  String? _stripePaymentID;
  String? get stripePaymentID => _$this._stripePaymentID;
  set stripePaymentID(String? stripePaymentID) =>
      _$this._stripePaymentID = stripePaymentID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PaymentRecordBuilder() {
    PaymentRecord._initializeBuilder(this);
  }

  PaymentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentByUserRef = $v.paymentByUserRef;
      _amountPaid = $v.amountPaid;
      _datePaid = $v.datePaid;
      _stripePaymentID = $v.stripePaymentID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentRecord;
  }

  @override
  void update(void Function(PaymentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentRecord build() => _build();

  _$PaymentRecord _build() {
    final _$result = _$v ??
        new _$PaymentRecord._(
            paymentByUserRef: paymentByUserRef,
            amountPaid: amountPaid,
            datePaid: datePaid,
            stripePaymentID: stripePaymentID,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
