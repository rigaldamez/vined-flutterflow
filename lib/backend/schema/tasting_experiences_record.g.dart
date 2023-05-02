// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasting_experiences_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TastingExperiencesRecord> _$tastingExperiencesRecordSerializer =
    new _$TastingExperiencesRecordSerializer();

class _$TastingExperiencesRecordSerializer
    implements StructuredSerializer<TastingExperiencesRecord> {
  @override
  final Iterable<Type> types = const [
    TastingExperiencesRecord,
    _$TastingExperiencesRecord
  ];
  @override
  final String wireName = 'TastingExperiencesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TastingExperiencesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tastingExperiencePrice;
    if (value != null) {
      result
        ..add('tasting_experience_price')
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
  TastingExperiencesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TastingExperiencesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tasting_experience_price':
          result.tastingExperiencePrice = serializers.deserialize(value,
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

class _$TastingExperiencesRecord extends TastingExperiencesRecord {
  @override
  final String? image;
  @override
  final String? description;
  @override
  final double? tastingExperiencePrice;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TastingExperiencesRecord(
          [void Function(TastingExperiencesRecordBuilder)? updates]) =>
      (new TastingExperiencesRecordBuilder()..update(updates))._build();

  _$TastingExperiencesRecord._(
      {this.image, this.description, this.tastingExperiencePrice, this.ffRef})
      : super._();

  @override
  TastingExperiencesRecord rebuild(
          void Function(TastingExperiencesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TastingExperiencesRecordBuilder toBuilder() =>
      new TastingExperiencesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TastingExperiencesRecord &&
        image == other.image &&
        description == other.description &&
        tastingExperiencePrice == other.tastingExperiencePrice &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, tastingExperiencePrice.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TastingExperiencesRecord')
          ..add('image', image)
          ..add('description', description)
          ..add('tastingExperiencePrice', tastingExperiencePrice)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TastingExperiencesRecordBuilder
    implements
        Builder<TastingExperiencesRecord, TastingExperiencesRecordBuilder> {
  _$TastingExperiencesRecord? _$v;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _tastingExperiencePrice;
  double? get tastingExperiencePrice => _$this._tastingExperiencePrice;
  set tastingExperiencePrice(double? tastingExperiencePrice) =>
      _$this._tastingExperiencePrice = tastingExperiencePrice;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TastingExperiencesRecordBuilder() {
    TastingExperiencesRecord._initializeBuilder(this);
  }

  TastingExperiencesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _image = $v.image;
      _description = $v.description;
      _tastingExperiencePrice = $v.tastingExperiencePrice;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TastingExperiencesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TastingExperiencesRecord;
  }

  @override
  void update(void Function(TastingExperiencesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TastingExperiencesRecord build() => _build();

  _$TastingExperiencesRecord _build() {
    final _$result = _$v ??
        new _$TastingExperiencesRecord._(
            image: image,
            description: description,
            tastingExperiencePrice: tastingExperiencePrice,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
