import 'dart:async';

import 'package:collection/collection.dart';

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

  // "mapbox_key" field.
  String? _mapboxKey;
  String get mapboxKey => _mapboxKey ?? '';
  bool hasMapboxKey() => _mapboxKey != null;

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
    _mapboxKey = snapshotData['mapbox_key'] as String?;
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
  String? mapboxKey,
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
      'mapbox_key': mapboxKey,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppConfigRecordDocumentEquality implements Equality<AppConfigRecord> {
  const AppConfigRecordDocumentEquality();

  @override
  bool equals(AppConfigRecord? e1, AppConfigRecord? e2) {
    return e1?.vinedMessengerURL == e2?.vinedMessengerURL &&
        e1?.itineraryVenueLimit == e2?.itineraryVenueLimit &&
        e1?.platformTastingFee == e2?.platformTastingFee &&
        e1?.tourLeadTime == e2?.tourLeadTime &&
        e1?.vinedWebsiteURL == e2?.vinedWebsiteURL &&
        e1?.largeGroupThreshold == e2?.largeGroupThreshold &&
        e1?.largeGroupVenuesEarlySeatingThreshold ==
            e2?.largeGroupVenuesEarlySeatingThreshold &&
        e1?.lunchVenueFee == e2?.lunchVenueFee &&
        e1?.mapboxKey == e2?.mapboxKey;
  }

  @override
  int hash(AppConfigRecord? e) => const ListEquality().hash([
        e?.vinedMessengerURL,
        e?.itineraryVenueLimit,
        e?.platformTastingFee,
        e?.tourLeadTime,
        e?.vinedWebsiteURL,
        e?.largeGroupThreshold,
        e?.largeGroupVenuesEarlySeatingThreshold,
        e?.lunchVenueFee,
        e?.mapboxKey
      ]);

  @override
  bool isValidKey(Object? o) => o is AppConfigRecord;
}
