import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppConfigRecord extends FirestoreRecord {
  AppConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "vinedMessengerURL" field.
  String? _vinedMessengerURL;
  String get vinedMessengerURL => _vinedMessengerURL ?? '';
  bool hasVinedMessengerURL() => _vinedMessengerURL != null;

  // "itineraryVenueLimit" field.
  int? _itineraryVenueLimit;
  int get itineraryVenueLimit => _itineraryVenueLimit ?? 0;
  bool hasItineraryVenueLimit() => _itineraryVenueLimit != null;

  // "platformTastingFee" field.
  double? _platformTastingFee;
  double get platformTastingFee => _platformTastingFee ?? 0.0;
  bool hasPlatformTastingFee() => _platformTastingFee != null;

  // "tourLeadTime" field.
  int? _tourLeadTime;
  int get tourLeadTime => _tourLeadTime ?? 0;
  bool hasTourLeadTime() => _tourLeadTime != null;

  // "vinedWebsiteURL" field.
  String? _vinedWebsiteURL;
  String get vinedWebsiteURL => _vinedWebsiteURL ?? '';
  bool hasVinedWebsiteURL() => _vinedWebsiteURL != null;

  // "large_group_threshold" field.
  int? _largeGroupThreshold;
  int get largeGroupThreshold => _largeGroupThreshold ?? 0;
  bool hasLargeGroupThreshold() => _largeGroupThreshold != null;

  // "large_group_venues_early_seating_threshold" field.
  int? _largeGroupVenuesEarlySeatingThreshold;
  int get largeGroupVenuesEarlySeatingThreshold =>
      _largeGroupVenuesEarlySeatingThreshold ?? 0;
  bool hasLargeGroupVenuesEarlySeatingThreshold() =>
      _largeGroupVenuesEarlySeatingThreshold != null;

  // "lunch_venue_fee" field.
  double? _lunchVenueFee;
  double get lunchVenueFee => _lunchVenueFee ?? 0.0;
  bool hasLunchVenueFee() => _lunchVenueFee != null;

  void _initializeFields() {
    _vinedMessengerURL = snapshotData['vinedMessengerURL'] as String?;
    _itineraryVenueLimit = castToType<int>(snapshotData['itineraryVenueLimit']);
    _platformTastingFee =
        castToType<double>(snapshotData['platformTastingFee']);
    _tourLeadTime = castToType<int>(snapshotData['tourLeadTime']);
    _vinedWebsiteURL = snapshotData['vinedWebsiteURL'] as String?;
    _largeGroupThreshold =
        castToType<int>(snapshotData['large_group_threshold']);
    _largeGroupVenuesEarlySeatingThreshold = castToType<int>(
        snapshotData['large_group_venues_early_seating_threshold']);
    _lunchVenueFee = castToType<double>(snapshotData['lunch_venue_fee']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_config');

  static Stream<AppConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppConfigRecord.fromSnapshot(s));

  static Future<AppConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppConfigRecord.fromSnapshot(s));

  static AppConfigRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vinedMessengerURL': vinedMessengerURL,
      'itineraryVenueLimit': itineraryVenueLimit,
      'platformTastingFee': platformTastingFee,
      'tourLeadTime': tourLeadTime,
      'vinedWebsiteURL': vinedWebsiteURL,
      'large_group_threshold': largeGroupThreshold,
      'large_group_venues_early_seating_threshold':
          largeGroupVenuesEarlySeatingThreshold,
      'lunch_venue_fee': lunchVenueFee,
    }.withoutNulls,
  );

  return firestoreData;
}
