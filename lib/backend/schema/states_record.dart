import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatesRecord extends FirestoreRecord {
  StatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "stateCode" field.
  String? _stateCode;
  String get stateCode => _stateCode ?? '';
  bool hasStateCode() => _stateCode != null;

  // "stateDisplayName" field.
  String? _stateDisplayName;
  String get stateDisplayName => _stateDisplayName ?? '';
  bool hasStateDisplayName() => _stateDisplayName != null;

  // "isServiced" field.
  bool? _isServiced;
  bool get isServiced => _isServiced ?? false;
  bool hasIsServiced() => _isServiced != null;

  // "stateImage" field.
  String? _stateImage;
  String get stateImage => _stateImage ?? '';
  bool hasStateImage() => _stateImage != null;

  void _initializeFields() {
    _stateCode = snapshotData['stateCode'] as String?;
    _stateDisplayName = snapshotData['stateDisplayName'] as String?;
    _isServiced = snapshotData['isServiced'] as bool?;
    _stateImage = snapshotData['stateImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('states');

  static Stream<StatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatesRecord.fromSnapshot(s));

  static Future<StatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatesRecord.fromSnapshot(s));

  static StatesRecord fromSnapshot(DocumentSnapshot snapshot) => StatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatesRecordData({
  String? stateCode,
  String? stateDisplayName,
  bool? isServiced,
  String? stateImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'stateCode': stateCode,
      'stateDisplayName': stateDisplayName,
      'isServiced': isServiced,
      'stateImage': stateImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatesRecordDocumentEquality implements Equality<StatesRecord> {
  const StatesRecordDocumentEquality();

  @override
  bool equals(StatesRecord? e1, StatesRecord? e2) {
    return e1?.stateCode == e2?.stateCode &&
        e1?.stateDisplayName == e2?.stateDisplayName &&
        e1?.isServiced == e2?.isServiced &&
        e1?.stateImage == e2?.stateImage;
  }

  @override
  int hash(StatesRecord? e) => const ListEquality()
      .hash([e?.stateCode, e?.stateDisplayName, e?.isServiced, e?.stateImage]);

  @override
  bool isValidKey(Object? o) => o is StatesRecord;
}
