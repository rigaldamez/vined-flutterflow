// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_messages_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TourMessagesRecord> _$tourMessagesRecordSerializer =
    new _$TourMessagesRecordSerializer();

class _$TourMessagesRecordSerializer
    implements StructuredSerializer<TourMessagesRecord> {
  @override
  final Iterable<Type> types = const [TourMessagesRecord, _$TourMessagesRecord];
  @override
  final String wireName = 'TourMessagesRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TourMessagesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.dateSent;
    if (value != null) {
      result
        ..add('date_sent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.senderUserReff;
    if (value != null) {
      result
        ..add('sender_user_reff')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.messageBody;
    if (value != null) {
      result
        ..add('message_body')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isRead;
    if (value != null) {
      result
        ..add('is_read')
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
  TourMessagesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TourMessagesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date_sent':
          result.dateSent = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'sender_user_reff':
          result.senderUserReff = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'message_body':
          result.messageBody = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_read':
          result.isRead = serializers.deserialize(value,
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

class _$TourMessagesRecord extends TourMessagesRecord {
  @override
  final DateTime? dateSent;
  @override
  final DocumentReference<Object?>? senderUserReff;
  @override
  final String? messageBody;
  @override
  final bool? isRead;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TourMessagesRecord(
          [void Function(TourMessagesRecordBuilder)? updates]) =>
      (new TourMessagesRecordBuilder()..update(updates))._build();

  _$TourMessagesRecord._(
      {this.dateSent,
      this.senderUserReff,
      this.messageBody,
      this.isRead,
      this.ffRef})
      : super._();

  @override
  TourMessagesRecord rebuild(
          void Function(TourMessagesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TourMessagesRecordBuilder toBuilder() =>
      new TourMessagesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TourMessagesRecord &&
        dateSent == other.dateSent &&
        senderUserReff == other.senderUserReff &&
        messageBody == other.messageBody &&
        isRead == other.isRead &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dateSent.hashCode);
    _$hash = $jc(_$hash, senderUserReff.hashCode);
    _$hash = $jc(_$hash, messageBody.hashCode);
    _$hash = $jc(_$hash, isRead.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TourMessagesRecord')
          ..add('dateSent', dateSent)
          ..add('senderUserReff', senderUserReff)
          ..add('messageBody', messageBody)
          ..add('isRead', isRead)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TourMessagesRecordBuilder
    implements Builder<TourMessagesRecord, TourMessagesRecordBuilder> {
  _$TourMessagesRecord? _$v;

  DateTime? _dateSent;
  DateTime? get dateSent => _$this._dateSent;
  set dateSent(DateTime? dateSent) => _$this._dateSent = dateSent;

  DocumentReference<Object?>? _senderUserReff;
  DocumentReference<Object?>? get senderUserReff => _$this._senderUserReff;
  set senderUserReff(DocumentReference<Object?>? senderUserReff) =>
      _$this._senderUserReff = senderUserReff;

  String? _messageBody;
  String? get messageBody => _$this._messageBody;
  set messageBody(String? messageBody) => _$this._messageBody = messageBody;

  bool? _isRead;
  bool? get isRead => _$this._isRead;
  set isRead(bool? isRead) => _$this._isRead = isRead;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TourMessagesRecordBuilder() {
    TourMessagesRecord._initializeBuilder(this);
  }

  TourMessagesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateSent = $v.dateSent;
      _senderUserReff = $v.senderUserReff;
      _messageBody = $v.messageBody;
      _isRead = $v.isRead;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TourMessagesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TourMessagesRecord;
  }

  @override
  void update(void Function(TourMessagesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TourMessagesRecord build() => _build();

  _$TourMessagesRecord _build() {
    final _$result = _$v ??
        new _$TourMessagesRecord._(
            dateSent: dateSent,
            senderUserReff: senderUserReff,
            messageBody: messageBody,
            isRead: isRead,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
