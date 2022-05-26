import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tour_messages_record.g.dart';

abstract class TourMessagesRecord
    implements Built<TourMessagesRecord, TourMessagesRecordBuilder> {
  static Serializer<TourMessagesRecord> get serializer =>
      _$tourMessagesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'date_sent')
  DateTime get dateSent;

  @nullable
  @BuiltValueField(wireName: 'sender_user_reff')
  DocumentReference get senderUserReff;

  @nullable
  @BuiltValueField(wireName: 'message_body')
  String get messageBody;

  @nullable
  @BuiltValueField(wireName: 'is_read')
  bool get isRead;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(TourMessagesRecordBuilder builder) => builder
    ..messageBody = ''
    ..isRead = false;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('Tour_Messages')
          : FirebaseFirestore.instance.collectionGroup('Tour_Messages');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Tour_Messages').doc();

  static Stream<TourMessagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TourMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TourMessagesRecord._();
  factory TourMessagesRecord(
          [void Function(TourMessagesRecordBuilder) updates]) =
      _$TourMessagesRecord;

  static TourMessagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTourMessagesRecordData({
  DateTime dateSent,
  DocumentReference senderUserReff,
  String messageBody,
  bool isRead,
}) =>
    serializers.toFirestore(
        TourMessagesRecord.serializer,
        TourMessagesRecord((t) => t
          ..dateSent = dateSent
          ..senderUserReff = senderUserReff
          ..messageBody = messageBody
          ..isRead = isRead));
