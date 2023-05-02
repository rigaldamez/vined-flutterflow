// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegionsRecord> _$regionsRecordSerializer =
    new _$RegionsRecordSerializer();

class _$RegionsRecordSerializer implements StructuredSerializer<RegionsRecord> {
  @override
  final Iterable<Type> types = const [RegionsRecord, _$RegionsRecord];
  @override
  final String wireName = 'RegionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RegionsRecord object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isServiced;
    if (value != null) {
      result
        ..add('isServiced')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.regionID;
    if (value != null) {
      result
        ..add('regionID')
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
  RegionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isServiced':
          result.isServiced = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'regionID':
          result.regionID = serializers.deserialize(value,
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

class _$RegionsRecord extends RegionsRecord {
  @override
  final String? name;
  @override
  final String? image;
  @override
  final bool? isServiced;
  @override
  final String? regionID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RegionsRecord([void Function(RegionsRecordBuilder)? updates]) =>
      (new RegionsRecordBuilder()..update(updates))._build();

  _$RegionsRecord._(
      {this.name, this.image, this.isServiced, this.regionID, this.ffRef})
      : super._();

  @override
  RegionsRecord rebuild(void Function(RegionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegionsRecordBuilder toBuilder() => new RegionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegionsRecord &&
        name == other.name &&
        image == other.image &&
        isServiced == other.isServiced &&
        regionID == other.regionID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jc(_$hash, isServiced.hashCode);
    _$hash = $jc(_$hash, regionID.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegionsRecord')
          ..add('name', name)
          ..add('image', image)
          ..add('isServiced', isServiced)
          ..add('regionID', regionID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RegionsRecordBuilder
    implements Builder<RegionsRecord, RegionsRecordBuilder> {
  _$RegionsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  bool? _isServiced;
  bool? get isServiced => _$this._isServiced;
  set isServiced(bool? isServiced) => _$this._isServiced = isServiced;

  String? _regionID;
  String? get regionID => _$this._regionID;
  set regionID(String? regionID) => _$this._regionID = regionID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RegionsRecordBuilder() {
    RegionsRecord._initializeBuilder(this);
  }

  RegionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _isServiced = $v.isServiced;
      _regionID = $v.regionID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegionsRecord;
  }

  @override
  void update(void Function(RegionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegionsRecord build() => _build();

  _$RegionsRecord _build() {
    final _$result = _$v ??
        new _$RegionsRecord._(
            name: name,
            image: image,
            isServiced: isServiced,
            regionID: regionID,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
