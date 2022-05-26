import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'accepted_tours_record.g.dart';

abstract class AcceptedToursRecord
    implements Built<AcceptedToursRecord, AcceptedToursRecordBuilder> {
  static Serializer<AcceptedToursRecord> get serializer =>
      _$acceptedToursRecordSerializer;

  @nullable
  DocumentReference get tourID;

  @nullable
  @BuiltValueField(wireName: 'customer_reff')
  DocumentReference get customerReff;

  @nullable
  @BuiltValueField(wireName: 'driver_reff')
  DocumentReference get driverReff;

  @nullable
  @BuiltValueField(wireName: 'accepted_date')
  DateTime get acceptedDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AcceptedToursRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Accepted_Tours');

  static Stream<AcceptedToursRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AcceptedToursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  AcceptedToursRecord._();
  factory AcceptedToursRecord(
          [void Function(AcceptedToursRecordBuilder) updates]) =
      _$AcceptedToursRecord;

  static AcceptedToursRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAcceptedToursRecordData({
  DocumentReference tourID,
  DocumentReference customerReff,
  DocumentReference driverReff,
  DateTime acceptedDate,
}) =>
    serializers.toFirestore(
        AcceptedToursRecord.serializer,
        AcceptedToursRecord((a) => a
          ..tourID = tourID
          ..customerReff = customerReff
          ..driverReff = driverReff
          ..acceptedDate = acceptedDate));
