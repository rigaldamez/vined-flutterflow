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
  int get days;

  @nullable
  String get vinedMessengerURL;

  @nullable
  int get itineraryVenueLimit;

  @nullable
  double get platformTastingFee;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AppConfigRecordBuilder builder) => builder
    ..days = 0
    ..vinedMessengerURL = ''
    ..itineraryVenueLimit = 0
    ..platformTastingFee = 0.0;

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
  int days,
  String vinedMessengerURL,
  int itineraryVenueLimit,
  double platformTastingFee,
}) =>
    serializers.toFirestore(
        AppConfigRecord.serializer,
        AppConfigRecord((a) => a
          ..days = days
          ..vinedMessengerURL = vinedMessengerURL
          ..itineraryVenueLimit = itineraryVenueLimit
          ..platformTastingFee = platformTastingFee));
