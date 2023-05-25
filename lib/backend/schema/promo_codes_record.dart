import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromoCodesRecord extends FirestoreRecord {
  PromoCodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "promo_code" field.
  String? _promoCode;
  String get promoCode => _promoCode ?? '';
  bool hasPromoCode() => _promoCode != null;

  // "created_date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  // "discount_type" field.
  String? _discountType;
  String get discountType => _discountType ?? '';
  bool hasDiscountType() => _discountType != null;

  // "discount_amount" field.
  double? _discountAmount;
  double get discountAmount => _discountAmount ?? 0.0;
  bool hasDiscountAmount() => _discountAmount != null;

  // "used_by_list" field.
  List<DocumentReference>? _usedByList;
  List<DocumentReference> get usedByList => _usedByList ?? const [];
  bool hasUsedByList() => _usedByList != null;

  void _initializeFields() {
    _promoCode = snapshotData['promo_code'] as String?;
    _createdDate = snapshotData['created_date'] as DateTime?;
    _expiryDate = snapshotData['expiry_date'] as DateTime?;
    _discountType = snapshotData['discount_type'] as String?;
    _discountAmount = castToType<double>(snapshotData['discount_amount']);
    _usedByList = getDataList(snapshotData['used_by_list']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promo_codes');

  static Stream<PromoCodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromoCodesRecord.fromSnapshot(s));

  static Future<PromoCodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromoCodesRecord.fromSnapshot(s));

  static PromoCodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromoCodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromoCodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromoCodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromoCodesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPromoCodesRecordData({
  String? promoCode,
  DateTime? createdDate,
  DateTime? expiryDate,
  String? discountType,
  double? discountAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'promo_code': promoCode,
      'created_date': createdDate,
      'expiry_date': expiryDate,
      'discount_type': discountType,
      'discount_amount': discountAmount,
    }.withoutNulls,
  );

  return firestoreData;
}
