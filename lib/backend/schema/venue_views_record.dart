import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenueViewsRecord extends FirestoreRecord {
  VenueViewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "viewed_by" field.
  DocumentReference? _viewedBy;
  DocumentReference? get viewedBy => _viewedBy;
  bool hasViewedBy() => _viewedBy != null;

  // "viewed_date" field.
  DateTime? _viewedDate;
  DateTime? get viewedDate => _viewedDate;
  bool hasViewedDate() => _viewedDate != null;

  // "viewed_from_latlong" field.
  LatLng? _viewedFromLatlong;
  LatLng? get viewedFromLatlong => _viewedFromLatlong;
  bool hasViewedFromLatlong() => _viewedFromLatlong != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _viewedBy = snapshotData['viewed_by'] as DocumentReference?;
    _viewedDate = snapshotData['viewed_date'] as DateTime?;
    _viewedFromLatlong = snapshotData['viewed_from_latlong'] as LatLng?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('venue_views')
          : FirebaseFirestore.instance.collectionGroup('venue_views');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('venue_views').doc();

  static Stream<VenueViewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VenueViewsRecord.fromSnapshot(s));

  static Future<VenueViewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VenueViewsRecord.fromSnapshot(s));

  static VenueViewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VenueViewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VenueViewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VenueViewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VenueViewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VenueViewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVenueViewsRecordData({
  DocumentReference? viewedBy,
  DateTime? viewedDate,
  LatLng? viewedFromLatlong,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'viewed_by': viewedBy,
      'viewed_date': viewedDate,
      'viewed_from_latlong': viewedFromLatlong,
    }.withoutNulls,
  );

  return firestoreData;
}
