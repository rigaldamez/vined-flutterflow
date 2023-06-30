import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HighlightsRecord extends FirestoreRecord {
  HighlightsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name_description" field.
  String? _nameDescription;
  String get nameDescription => _nameDescription ?? '';
  bool hasNameDescription() => _nameDescription != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  void _initializeFields() {
    _nameDescription = snapshotData['name_description'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _link = snapshotData['link'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('highlights');

  static Stream<HighlightsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HighlightsRecord.fromSnapshot(s));

  static Future<HighlightsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HighlightsRecord.fromSnapshot(s));

  static HighlightsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HighlightsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HighlightsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HighlightsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HighlightsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HighlightsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHighlightsRecordData({
  String? nameDescription,
  DateTime? date,
  String? image,
  String? link,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name_description': nameDescription,
      'date': date,
      'image': image,
      'link': link,
      'is_active': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class HighlightsRecordDocumentEquality implements Equality<HighlightsRecord> {
  const HighlightsRecordDocumentEquality();

  @override
  bool equals(HighlightsRecord? e1, HighlightsRecord? e2) {
    return e1?.nameDescription == e2?.nameDescription &&
        e1?.date == e2?.date &&
        e1?.image == e2?.image &&
        e1?.link == e2?.link &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(HighlightsRecord? e) => const ListEquality()
      .hash([e?.nameDescription, e?.date, e?.image, e?.link, e?.isActive]);

  @override
  bool isValidKey(Object? o) => o is HighlightsRecord;
}
