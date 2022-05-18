import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'app_config_record.g.dart';

abstract class AppConfigRecord
    implements Built<AppConfigRecord, AppConfigRecordBuilder> {
  static Serializer<AppConfigRecord> get serializer =>
      _$appConfigRecordSerializer;

  @nullable
  String get vinedMessengerURL;

  @nullable
  int get itineraryVenueLimit;

  @nullable
  double get platformTastingFee;

  @nullable
  int get tourLeadTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AppConfigRecordBuilder builder) => builder
    ..vinedMessengerURL = ''
    ..itineraryVenueLimit = 0
    ..platformTastingFee = 0.0
    ..tourLeadTime = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_config');

  static Stream<AppConfigRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AppConfigRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AppConfigRecord._();
  factory AppConfigRecord([void Function(AppConfigRecordBuilder) updates]) =
      _$AppConfigRecord;

  static AppConfigRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAppConfigRecordData({
  String vinedMessengerURL,
  int itineraryVenueLimit,
  double platformTastingFee,
  int tourLeadTime,
}) =>
    serializers.toFirestore(
        AppConfigRecord.serializer,
        AppConfigRecord((a) => a
          ..vinedMessengerURL = vinedMessengerURL
          ..itineraryVenueLimit = itineraryVenueLimit
          ..platformTastingFee = platformTastingFee
          ..tourLeadTime = tourLeadTime));
