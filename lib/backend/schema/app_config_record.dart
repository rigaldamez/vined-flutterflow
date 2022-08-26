import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'app_config_record.g.dart';

abstract class AppConfigRecord
    implements Built<AppConfigRecord, AppConfigRecordBuilder> {
  static Serializer<AppConfigRecord> get serializer =>
      _$appConfigRecordSerializer;

  String? get vinedMessengerURL;

  int? get itineraryVenueLimit;

  double? get platformTastingFee;

  int? get tourLeadTime;

  String? get vinedWebsiteURL;

  @BuiltValueField(wireName: 'large_group_threshold')
  int? get largeGroupThreshold;

  @BuiltValueField(wireName: 'large_group_venues_early_seating_threshold')
  int? get largeGroupVenuesEarlySeatingThreshold;

  @BuiltValueField(wireName: 'lunch_venue_fee')
  double? get lunchVenueFee;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AppConfigRecordBuilder builder) => builder
    ..vinedMessengerURL = ''
    ..itineraryVenueLimit = 0
    ..platformTastingFee = 0.0
    ..tourLeadTime = 0
    ..vinedWebsiteURL = ''
    ..largeGroupThreshold = 0
    ..largeGroupVenuesEarlySeatingThreshold = 0
    ..lunchVenueFee = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_config');

  static Stream<AppConfigRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AppConfigRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AppConfigRecord._();
  factory AppConfigRecord([void Function(AppConfigRecordBuilder) updates]) =
      _$AppConfigRecord;

  static AppConfigRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAppConfigRecordData({
  String? vinedMessengerURL,
  int? itineraryVenueLimit,
  double? platformTastingFee,
  int? tourLeadTime,
  String? vinedWebsiteURL,
  int? largeGroupThreshold,
  int? largeGroupVenuesEarlySeatingThreshold,
  double? lunchVenueFee,
}) {
  final firestoreData = serializers.toFirestore(
    AppConfigRecord.serializer,
    AppConfigRecord(
      (a) => a
        ..vinedMessengerURL = vinedMessengerURL
        ..itineraryVenueLimit = itineraryVenueLimit
        ..platformTastingFee = platformTastingFee
        ..tourLeadTime = tourLeadTime
        ..vinedWebsiteURL = vinedWebsiteURL
        ..largeGroupThreshold = largeGroupThreshold
        ..largeGroupVenuesEarlySeatingThreshold =
            largeGroupVenuesEarlySeatingThreshold
        ..lunchVenueFee = lunchVenueFee,
    ),
  );

  return firestoreData;
}
