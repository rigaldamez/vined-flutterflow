import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'payment_record.g.dart';

abstract class PaymentRecord
    implements Built<PaymentRecord, PaymentRecordBuilder> {
  static Serializer<PaymentRecord> get serializer => _$paymentRecordSerializer;

  @BuiltValueField(wireName: 'payment_by_user_Ref')
  DocumentReference? get paymentByUserRef;

  @BuiltValueField(wireName: 'amount_paid')
  double? get amountPaid;

  @BuiltValueField(wireName: 'date_paid')
  DateTime? get datePaid;

  @BuiltValueField(wireName: 'stripe_paymentID')
  String? get stripePaymentID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PaymentRecordBuilder builder) => builder
    ..amountPaid = 0.0
    ..stripePaymentID = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('payment')
          : FirebaseFirestore.instance.collectionGroup('payment');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('payment').doc();

  static Stream<PaymentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PaymentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PaymentRecord._();
  factory PaymentRecord([void Function(PaymentRecordBuilder) updates]) =
      _$PaymentRecord;

  static PaymentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPaymentRecordData({
  DocumentReference? paymentByUserRef,
  double? amountPaid,
  DateTime? datePaid,
  String? stripePaymentID,
}) {
  final firestoreData = serializers.toFirestore(
    PaymentRecord.serializer,
    PaymentRecord(
      (p) => p
        ..paymentByUserRef = paymentByUserRef
        ..amountPaid = amountPaid
        ..datePaid = datePaid
        ..stripePaymentID = stripePaymentID,
    ),
  );

  return firestoreData;
}
