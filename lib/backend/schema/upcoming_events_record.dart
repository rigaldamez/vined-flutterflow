import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpcomingEventsRecord extends FirestoreRecord {
  UpcomingEventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_date" field.
  DateTime? _eventDate;
  DateTime? get eventDate => _eventDate;
  bool hasEventDate() => _eventDate != null;

  // "event_image" field.
  String? _eventImage;
  String get eventImage => _eventImage ?? '';
  bool hasEventImage() => _eventImage != null;

  // "event_link" field.
  String? _eventLink;
  String get eventLink => _eventLink ?? '';
  bool hasEventLink() => _eventLink != null;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _eventDate = snapshotData['event_date'] as DateTime?;
    _eventImage = snapshotData['event_image'] as String?;
    _eventLink = snapshotData['event_link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('upcoming_events');

  static Stream<UpcomingEventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UpcomingEventsRecord.fromSnapshot(s));

  static Future<UpcomingEventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UpcomingEventsRecord.fromSnapshot(s));

  static UpcomingEventsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpcomingEventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpcomingEventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpcomingEventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpcomingEventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpcomingEventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpcomingEventsRecordData({
  String? eventName,
  DateTime? eventDate,
  String? eventImage,
  String? eventLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'event_date': eventDate,
      'event_image': eventImage,
      'event_link': eventLink,
    }.withoutNulls,
  );

  return firestoreData;
}
