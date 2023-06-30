import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegionsRecord extends FirestoreRecord {
  RegionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "isServiced" field.
  bool? _isServiced;
  bool get isServiced => _isServiced ?? false;
  bool hasIsServiced() => _isServiced != null;

  // "regionID" field.
  String? _regionID;
  String get regionID => _regionID ?? '';
  bool hasRegionID() => _regionID != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _isServiced = snapshotData['isServiced'] as bool?;
    _regionID = snapshotData['regionID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('regions');

  static Stream<RegionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegionsRecord.fromSnapshot(s));

  static Future<RegionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegionsRecord.fromSnapshot(s));

  static RegionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegionsRecordData({
  String? name,
  String? image,
  bool? isServiced,
  String? regionID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'isServiced': isServiced,
      'regionID': regionID,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegionsRecordDocumentEquality implements Equality<RegionsRecord> {
  const RegionsRecordDocumentEquality();

  @override
  bool equals(RegionsRecord? e1, RegionsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.isServiced == e2?.isServiced &&
        e1?.regionID == e2?.regionID;
  }

  @override
  int hash(RegionsRecord? e) => const ListEquality()
      .hash([e?.name, e?.image, e?.isServiced, e?.regionID]);

  @override
  bool isValidKey(Object? o) => o is RegionsRecord;
}
