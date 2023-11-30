import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenueRatingRecord extends FirestoreRecord {
  VenueRatingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rating_date" field.
  DateTime? _ratingDate;
  DateTime? get ratingDate => _ratingDate;
  bool hasRatingDate() => _ratingDate != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "rating_user_reff" field.
  DocumentReference? _ratingUserReff;
  DocumentReference? get ratingUserReff => _ratingUserReff;
  bool hasRatingUserReff() => _ratingUserReff != null;

  // "rating_comments" field.
  String? _ratingComments;
  String get ratingComments => _ratingComments ?? '';
  bool hasRatingComments() => _ratingComments != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _ratingDate = snapshotData['rating_date'] as DateTime?;
    _rating = castToType<int>(snapshotData['rating']);
    _ratingUserReff = snapshotData['rating_user_reff'] as DocumentReference?;
    _ratingComments = snapshotData['rating_comments'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('venue_rating')
          : FirebaseFirestore.instance.collectionGroup('venue_rating');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('venue_rating').doc();

  static Stream<VenueRatingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VenueRatingRecord.fromSnapshot(s));

  static Future<VenueRatingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VenueRatingRecord.fromSnapshot(s));

  static VenueRatingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VenueRatingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VenueRatingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VenueRatingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VenueRatingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VenueRatingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVenueRatingRecordData({
  DateTime? ratingDate,
  int? rating,
  DocumentReference? ratingUserReff,
  String? ratingComments,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating_date': ratingDate,
      'rating': rating,
      'rating_user_reff': ratingUserReff,
      'rating_comments': ratingComments,
    }.withoutNulls,
  );

  return firestoreData;
}

class VenueRatingRecordDocumentEquality implements Equality<VenueRatingRecord> {
  const VenueRatingRecordDocumentEquality();

  @override
  bool equals(VenueRatingRecord? e1, VenueRatingRecord? e2) {
    return e1?.ratingDate == e2?.ratingDate &&
        e1?.rating == e2?.rating &&
        e1?.ratingUserReff == e2?.ratingUserReff &&
        e1?.ratingComments == e2?.ratingComments;
  }

  @override
  int hash(VenueRatingRecord? e) => const ListEquality()
      .hash([e?.ratingDate, e?.rating, e?.ratingUserReff, e?.ratingComments]);

  @override
  bool isValidKey(Object? o) => o is VenueRatingRecord;
}
