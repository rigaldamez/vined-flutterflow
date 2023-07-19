import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenueFeaturesRecord extends FirestoreRecord {
  VenueFeaturesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "feature_name" field.
  String? _featureName;
  String get featureName => _featureName ?? '';
  bool hasFeatureName() => _featureName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _featureName = snapshotData['feature_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('venue_features')
          : FirebaseFirestore.instance.collectionGroup('venue_features');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('venue_features').doc();

  static Stream<VenueFeaturesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VenueFeaturesRecord.fromSnapshot(s));

  static Future<VenueFeaturesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VenueFeaturesRecord.fromSnapshot(s));

  static VenueFeaturesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VenueFeaturesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VenueFeaturesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VenueFeaturesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VenueFeaturesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VenueFeaturesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVenueFeaturesRecordData({
  String? featureName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'feature_name': featureName,
    }.withoutNulls,
  );

  return firestoreData;
}

class VenueFeaturesRecordDocumentEquality
    implements Equality<VenueFeaturesRecord> {
  const VenueFeaturesRecordDocumentEquality();

  @override
  bool equals(VenueFeaturesRecord? e1, VenueFeaturesRecord? e2) {
    return e1?.featureName == e2?.featureName;
  }

  @override
  int hash(VenueFeaturesRecord? e) =>
      const ListEquality().hash([e?.featureName]);

  @override
  bool isValidKey(Object? o) => o is VenueFeaturesRecord;
}
