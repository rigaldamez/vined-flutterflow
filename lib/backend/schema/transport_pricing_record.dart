import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransportPricingRecord extends FirestoreRecord {
  TransportPricingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "passengersLbl" field.
  int? _passengersLbl;
  int get passengersLbl => _passengersLbl ?? 0;
  bool hasPassengersLbl() => _passengersLbl != null;

  void _initializeFields() {
    _price = castToType<double>(snapshotData['price']);
    _passengersLbl = castToType<int>(snapshotData['passengersLbl']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transportPricing');

  static Stream<TransportPricingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransportPricingRecord.fromSnapshot(s));

  static Future<TransportPricingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TransportPricingRecord.fromSnapshot(s));

  static TransportPricingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransportPricingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransportPricingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransportPricingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransportPricingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransportPricingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransportPricingRecordData({
  double? price,
  int? passengersLbl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'passengersLbl': passengersLbl,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransportPricingRecordDocumentEquality
    implements Equality<TransportPricingRecord> {
  const TransportPricingRecordDocumentEquality();

  @override
  bool equals(TransportPricingRecord? e1, TransportPricingRecord? e2) {
    return e1?.price == e2?.price && e1?.passengersLbl == e2?.passengersLbl;
  }

  @override
  int hash(TransportPricingRecord? e) =>
      const ListEquality().hash([e?.price, e?.passengersLbl]);

  @override
  bool isValidKey(Object? o) => o is TransportPricingRecord;
}
