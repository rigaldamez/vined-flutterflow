import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transport_pricing_record.g.dart';

abstract class TransportPricingRecord
    implements Built<TransportPricingRecord, TransportPricingRecordBuilder> {
  static Serializer<TransportPricingRecord> get serializer =>
      _$transportPricingRecordSerializer;

  @nullable
  double get price;

  @nullable
  int get passengersLbl;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransportPricingRecordBuilder builder) =>
      builder
        ..price = 0.0
        ..passengersLbl = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transportPricing');

  static Stream<TransportPricingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TransportPricingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransportPricingRecord._();
  factory TransportPricingRecord(
          [void Function(TransportPricingRecordBuilder) updates]) =
      _$TransportPricingRecord;

  static TransportPricingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransportPricingRecordData({
  double price,
  int passengersLbl,
}) =>
    serializers.toFirestore(
        TransportPricingRecord.serializer,
        TransportPricingRecord((t) => t
          ..price = price
          ..passengersLbl = passengersLbl));
