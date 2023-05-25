import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentRecord extends FirestoreRecord {
  PaymentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "payment_by_user_Ref" field.
  DocumentReference? _paymentByUserRef;
  DocumentReference? get paymentByUserRef => _paymentByUserRef;
  bool hasPaymentByUserRef() => _paymentByUserRef != null;

  // "amount_paid" field.
  double? _amountPaid;
  double get amountPaid => _amountPaid ?? 0.0;
  bool hasAmountPaid() => _amountPaid != null;

  // "date_paid" field.
  DateTime? _datePaid;
  DateTime? get datePaid => _datePaid;
  bool hasDatePaid() => _datePaid != null;

  // "stripe_paymentID" field.
  String? _stripePaymentID;
  String get stripePaymentID => _stripePaymentID ?? '';
  bool hasStripePaymentID() => _stripePaymentID != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _paymentByUserRef =
        snapshotData['payment_by_user_Ref'] as DocumentReference?;
    _amountPaid = castToType<double>(snapshotData['amount_paid']);
    _datePaid = snapshotData['date_paid'] as DateTime?;
    _stripePaymentID = snapshotData['stripe_paymentID'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('payment')
          : FirebaseFirestore.instance.collectionGroup('payment');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('payment').doc();

  static Stream<PaymentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentRecord.fromSnapshot(s));

  static Future<PaymentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentRecord.fromSnapshot(s));

  static PaymentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPaymentRecordData({
  DocumentReference? paymentByUserRef,
  double? amountPaid,
  DateTime? datePaid,
  String? stripePaymentID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'payment_by_user_Ref': paymentByUserRef,
      'amount_paid': amountPaid,
      'date_paid': datePaid,
      'stripe_paymentID': stripePaymentID,
    }.withoutNulls,
  );

  return firestoreData;
}
