import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'promo_codes_record.g.dart';

abstract class PromoCodesRecord
    implements Built<PromoCodesRecord, PromoCodesRecordBuilder> {
  static Serializer<PromoCodesRecord> get serializer =>
      _$promoCodesRecordSerializer;

  @BuiltValueField(wireName: 'promo_code')
  String? get promoCode;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  @BuiltValueField(wireName: 'expiry_date')
  DateTime? get expiryDate;

  @BuiltValueField(wireName: 'discount_type')
  String? get discountType;

  @BuiltValueField(wireName: 'discount_amount')
  double? get discountAmount;

  @BuiltValueField(wireName: 'used_by_list')
  BuiltList<DocumentReference>? get usedByList;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PromoCodesRecordBuilder builder) => builder
    ..promoCode = ''
    ..discountType = ''
    ..discountAmount = 0.0
    ..usedByList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promo_codes');

  static Stream<PromoCodesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PromoCodesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PromoCodesRecord._();
  factory PromoCodesRecord([void Function(PromoCodesRecordBuilder) updates]) =
      _$PromoCodesRecord;

  static PromoCodesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPromoCodesRecordData({
  String? promoCode,
  DateTime? createdDate,
  DateTime? expiryDate,
  String? discountType,
  double? discountAmount,
}) {
  final firestoreData = serializers.toFirestore(
    PromoCodesRecord.serializer,
    PromoCodesRecord(
      (p) => p
        ..promoCode = promoCode
        ..createdDate = createdDate
        ..expiryDate = expiryDate
        ..discountType = discountType
        ..discountAmount = discountAmount
        ..usedByList = null,
    ),
  );

  return firestoreData;
}
