import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TastingDiaryRecord extends FirestoreRecord {
  TastingDiaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "tasting_notes" field.
  String? _tastingNotes;
  String get tastingNotes => _tastingNotes ?? '';
  bool hasTastingNotes() => _tastingNotes != null;

  // "venue_reff" field.
  DocumentReference? _venueReff;
  DocumentReference? get venueReff => _venueReff;
  bool hasVenueReff() => _venueReff != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _tastingNotes = snapshotData['tasting_notes'] as String?;
    _venueReff = snapshotData['venue_reff'] as DocumentReference?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tasting_diary')
          : FirebaseFirestore.instance.collectionGroup('tasting_diary');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tasting_diary').doc();

  static Stream<TastingDiaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TastingDiaryRecord.fromSnapshot(s));

  static Future<TastingDiaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TastingDiaryRecord.fromSnapshot(s));

  static TastingDiaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TastingDiaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TastingDiaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TastingDiaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TastingDiaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TastingDiaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTastingDiaryRecordData({
  String? image,
  String? tastingNotes,
  DocumentReference? venueReff,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'tasting_notes': tastingNotes,
      'venue_reff': venueReff,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class TastingDiaryRecordDocumentEquality
    implements Equality<TastingDiaryRecord> {
  const TastingDiaryRecordDocumentEquality();

  @override
  bool equals(TastingDiaryRecord? e1, TastingDiaryRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.tastingNotes == e2?.tastingNotes &&
        e1?.venueReff == e2?.venueReff &&
        e1?.date == e2?.date;
  }

  @override
  int hash(TastingDiaryRecord? e) => const ListEquality()
      .hash([e?.image, e?.tastingNotes, e?.venueReff, e?.date]);

  @override
  bool isValidKey(Object? o) => o is TastingDiaryRecord;
}
