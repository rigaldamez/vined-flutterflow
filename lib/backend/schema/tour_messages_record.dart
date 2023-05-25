import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TourMessagesRecord extends FirestoreRecord {
  TourMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date_sent" field.
  DateTime? _dateSent;
  DateTime? get dateSent => _dateSent;
  bool hasDateSent() => _dateSent != null;

  // "sender_user_reff" field.
  DocumentReference? _senderUserReff;
  DocumentReference? get senderUserReff => _senderUserReff;
  bool hasSenderUserReff() => _senderUserReff != null;

  // "message_body" field.
  String? _messageBody;
  String get messageBody => _messageBody ?? '';
  bool hasMessageBody() => _messageBody != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dateSent = snapshotData['date_sent'] as DateTime?;
    _senderUserReff = snapshotData['sender_user_reff'] as DocumentReference?;
    _messageBody = snapshotData['message_body'] as String?;
    _isRead = snapshotData['is_read'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Tour_Messages')
          : FirebaseFirestore.instance.collectionGroup('Tour_Messages');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Tour_Messages').doc();

  static Stream<TourMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TourMessagesRecord.fromSnapshot(s));

  static Future<TourMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TourMessagesRecord.fromSnapshot(s));

  static TourMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TourMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TourMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TourMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TourMessagesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTourMessagesRecordData({
  DateTime? dateSent,
  DocumentReference? senderUserReff,
  String? messageBody,
  bool? isRead,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_sent': dateSent,
      'sender_user_reff': senderUserReff,
      'message_body': messageBody,
      'is_read': isRead,
    }.withoutNulls,
  );

  return firestoreData;
}
