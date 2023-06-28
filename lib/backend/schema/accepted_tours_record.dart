import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AcceptedToursRecord extends FirestoreRecord {
  AcceptedToursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tourID" field.
  DocumentReference? _tourID;
  DocumentReference? get tourID => _tourID;
  bool hasTourID() => _tourID != null;

  // "customer_reff" field.
  DocumentReference? _customerReff;
  DocumentReference? get customerReff => _customerReff;
  bool hasCustomerReff() => _customerReff != null;

  // "driver_reff" field.
  DocumentReference? _driverReff;
  DocumentReference? get driverReff => _driverReff;
  bool hasDriverReff() => _driverReff != null;

  // "accepted_date" field.
  DateTime? _acceptedDate;
  DateTime? get acceptedDate => _acceptedDate;
  bool hasAcceptedDate() => _acceptedDate != null;

  void _initializeFields() {
    _tourID = snapshotData['tourID'] as DocumentReference?;
    _customerReff = snapshotData['customer_reff'] as DocumentReference?;
    _driverReff = snapshotData['driver_reff'] as DocumentReference?;
    _acceptedDate = snapshotData['accepted_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Accepted_Tours');

  static Stream<AcceptedToursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AcceptedToursRecord.fromSnapshot(s));

  static Future<AcceptedToursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AcceptedToursRecord.fromSnapshot(s));

  static AcceptedToursRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AcceptedToursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AcceptedToursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AcceptedToursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AcceptedToursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AcceptedToursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAcceptedToursRecordData({
  DocumentReference? tourID,
  DocumentReference? customerReff,
  DocumentReference? driverReff,
  DateTime? acceptedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tourID': tourID,
      'customer_reff': customerReff,
      'driver_reff': driverReff,
      'accepted_date': acceptedDate,
    }.withoutNulls,
  );

  return firestoreData;
}
