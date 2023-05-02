// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_codes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromoCodesRecord> _$promoCodesRecordSerializer =
    new _$PromoCodesRecordSerializer();

class _$PromoCodesRecordSerializer
    implements StructuredSerializer<PromoCodesRecord> {
  @override
  final Iterable<Type> types = const [PromoCodesRecord, _$PromoCodesRecord];
  @override
  final String wireName = 'PromoCodesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PromoCodesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.promoCode;
    if (value != null) {
      result
        ..add('promo_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.expiryDate;
    if (value != null) {
      result
        ..add('expiry_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.discountType;
    if (value != null) {
      result
        ..add('discount_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.discountAmount;
    if (value != null) {
      result
        ..add('discount_amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.usedByList;
    if (value != null) {
      result
        ..add('used_by_list')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  PromoCodesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromoCodesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'promo_code':
          result.promoCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'expiry_date':
          result.expiryDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'discount_type':
          result.discountType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'discount_amount':
          result.discountAmount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'used_by_list':
          result.usedByList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$PromoCodesRecord extends PromoCodesRecord {
  @override
  final String? promoCode;
  @override
  final DateTime? createdDate;
  @override
  final DateTime? expiryDate;
  @override
  final String? discountType;
  @override
  final double? discountAmount;
  @override
  final BuiltList<DocumentReference<Object?>>? usedByList;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromoCodesRecord(
          [void Function(PromoCodesRecordBuilder)? updates]) =>
      (new PromoCodesRecordBuilder()..update(updates))._build();

  _$PromoCodesRecord._(
      {this.promoCode,
      this.createdDate,
      this.expiryDate,
      this.discountType,
      this.discountAmount,
      this.usedByList,
      this.ffRef})
      : super._();

  @override
  PromoCodesRecord rebuild(void Function(PromoCodesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromoCodesRecordBuilder toBuilder() =>
      new PromoCodesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromoCodesRecord &&
        promoCode == other.promoCode &&
        createdDate == other.createdDate &&
        expiryDate == other.expiryDate &&
        discountType == other.discountType &&
        discountAmount == other.discountAmount &&
        usedByList == other.usedByList &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, promoCode.hashCode);
    _$hash = $jc(_$hash, createdDate.hashCode);
    _$hash = $jc(_$hash, expiryDate.hashCode);
    _$hash = $jc(_$hash, discountType.hashCode);
    _$hash = $jc(_$hash, discountAmount.hashCode);
    _$hash = $jc(_$hash, usedByList.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromoCodesRecord')
          ..add('promoCode', promoCode)
          ..add('createdDate', createdDate)
          ..add('expiryDate', expiryDate)
          ..add('discountType', discountType)
          ..add('discountAmount', discountAmount)
          ..add('usedByList', usedByList)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromoCodesRecordBuilder
    implements Builder<PromoCodesRecord, PromoCodesRecordBuilder> {
  _$PromoCodesRecord? _$v;

  String? _promoCode;
  String? get promoCode => _$this._promoCode;
  set promoCode(String? promoCode) => _$this._promoCode = promoCode;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  DateTime? _expiryDate;
  DateTime? get expiryDate => _$this._expiryDate;
  set expiryDate(DateTime? expiryDate) => _$this._expiryDate = expiryDate;

  String? _discountType;
  String? get discountType => _$this._discountType;
  set discountType(String? discountType) => _$this._discountType = discountType;

  double? _discountAmount;
  double? get discountAmount => _$this._discountAmount;
  set discountAmount(double? discountAmount) =>
      _$this._discountAmount = discountAmount;

  ListBuilder<DocumentReference<Object?>>? _usedByList;
  ListBuilder<DocumentReference<Object?>> get usedByList =>
      _$this._usedByList ??= new ListBuilder<DocumentReference<Object?>>();
  set usedByList(ListBuilder<DocumentReference<Object?>>? usedByList) =>
      _$this._usedByList = usedByList;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromoCodesRecordBuilder() {
    PromoCodesRecord._initializeBuilder(this);
  }

  PromoCodesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _promoCode = $v.promoCode;
      _createdDate = $v.createdDate;
      _expiryDate = $v.expiryDate;
      _discountType = $v.discountType;
      _discountAmount = $v.discountAmount;
      _usedByList = $v.usedByList?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromoCodesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromoCodesRecord;
  }

  @override
  void update(void Function(PromoCodesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromoCodesRecord build() => _build();

  _$PromoCodesRecord _build() {
    _$PromoCodesRecord _$result;
    try {
      _$result = _$v ??
          new _$PromoCodesRecord._(
              promoCode: promoCode,
              createdDate: createdDate,
              expiryDate: expiryDate,
              discountType: discountType,
              discountAmount: discountAmount,
              usedByList: _usedByList?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usedByList';
        _usedByList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PromoCodesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
