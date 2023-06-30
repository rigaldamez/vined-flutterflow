import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TastingExperiencesRecord extends FirestoreRecord {
  TastingExperiencesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "tasting_experience_price" field.
  double? _tastingExperiencePrice;
  double get tastingExperiencePrice => _tastingExperiencePrice ?? 0.0;
  bool hasTastingExperiencePrice() => _tastingExperiencePrice != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
    _tastingExperiencePrice =
        castToType<double>(snapshotData['tasting_experience_price']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tasting_experiences')
          : FirebaseFirestore.instance.collectionGroup('tasting_experiences');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tasting_experiences').doc();

  static Stream<TastingExperiencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TastingExperiencesRecord.fromSnapshot(s));

  static Future<TastingExperiencesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TastingExperiencesRecord.fromSnapshot(s));

  static TastingExperiencesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TastingExperiencesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TastingExperiencesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TastingExperiencesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TastingExperiencesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TastingExperiencesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTastingExperiencesRecordData({
  String? image,
  String? description,
  double? tastingExperiencePrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'description': description,
      'tasting_experience_price': tastingExperiencePrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class TastingExperiencesRecordDocumentEquality
    implements Equality<TastingExperiencesRecord> {
  const TastingExperiencesRecordDocumentEquality();

  @override
  bool equals(TastingExperiencesRecord? e1, TastingExperiencesRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.description == e2?.description &&
        e1?.tastingExperiencePrice == e2?.tastingExperiencePrice;
  }

  @override
  int hash(TastingExperiencesRecord? e) => const ListEquality()
      .hash([e?.image, e?.description, e?.tastingExperiencePrice]);

  @override
  bool isValidKey(Object? o) => o is TastingExperiencesRecord;
}
