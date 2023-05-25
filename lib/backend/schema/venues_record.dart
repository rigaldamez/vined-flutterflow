import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VenuesRecord extends FirestoreRecord {
  VenuesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "regionID" field.
  String? _regionID;
  String get regionID => _regionID ?? '';
  bool hasRegionID() => _regionID != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "regionName" field.
  String? _regionName;
  String get regionName => _regionName ?? '';
  bool hasRegionName() => _regionName != null;

  // "tastingFee" field.
  double? _tastingFee;
  double get tastingFee => _tastingFee ?? 0.0;
  bool hasTastingFee() => _tastingFee != null;

  // "capacity" field.
  int? _capacity;
  int get capacity => _capacity ?? 0;
  bool hasCapacity() => _capacity != null;

  // "openDays" field.
  List<int>? _openDays;
  List<int> get openDays => _openDays ?? const [];
  bool hasOpenDays() => _openDays != null;

  // "maxCapacityEnforced" field.
  bool? _maxCapacityEnforced;
  bool get maxCapacityEnforced => _maxCapacityEnforced ?? false;
  bool hasMaxCapacityEnforced() => _maxCapacityEnforced != null;

  // "mustAcknowledgeTCs" field.
  bool? _mustAcknowledgeTCs;
  bool get mustAcknowledgeTCs => _mustAcknowledgeTCs ?? false;
  bool hasMustAcknowledgeTCs() => _mustAcknowledgeTCs != null;

  // "region_Ref" field.
  DocumentReference? _regionRef;
  DocumentReference? get regionRef => _regionRef;
  bool hasRegionRef() => _regionRef != null;

  // "is_favourited_by" field.
  List<DocumentReference>? _isFavouritedBy;
  List<DocumentReference> get isFavouritedBy => _isFavouritedBy ?? const [];
  bool hasIsFavouritedBy() => _isFavouritedBy != null;

  // "country_state" field.
  String? _countryState;
  String get countryState => _countryState ?? '';
  bool hasCountryState() => _countryState != null;

  // "is_lunch_venue_only" field.
  bool? _isLunchVenueOnly;
  bool get isLunchVenueOnly => _isLunchVenueOnly ?? false;
  bool hasIsLunchVenueOnly() => _isLunchVenueOnly != null;

  // "large_group_early_seating_only" field.
  bool? _largeGroupEarlySeatingOnly;
  bool get largeGroupEarlySeatingOnly => _largeGroupEarlySeatingOnly ?? false;
  bool hasLargeGroupEarlySeatingOnly() => _largeGroupEarlySeatingOnly != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _regionID = snapshotData['regionID'] as String?;
    _image = snapshotData['image'] as String?;
    _regionName = snapshotData['regionName'] as String?;
    _tastingFee = castToType<double>(snapshotData['tastingFee']);
    _capacity = snapshotData['capacity'] as int?;
    _openDays = getDataList(snapshotData['openDays']);
    _maxCapacityEnforced = snapshotData['maxCapacityEnforced'] as bool?;
    _mustAcknowledgeTCs = snapshotData['mustAcknowledgeTCs'] as bool?;
    _regionRef = snapshotData['region_Ref'] as DocumentReference?;
    _isFavouritedBy = getDataList(snapshotData['is_favourited_by']);
    _countryState = snapshotData['country_state'] as String?;
    _isLunchVenueOnly = snapshotData['is_lunch_venue_only'] as bool?;
    _largeGroupEarlySeatingOnly =
        snapshotData['large_group_early_seating_only'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('venues');

  static Stream<VenuesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VenuesRecord.fromSnapshot(s));

  static Future<VenuesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VenuesRecord.fromSnapshot(s));

  static VenuesRecord fromSnapshot(DocumentSnapshot snapshot) => VenuesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VenuesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VenuesRecord._(reference, mapFromFirestore(data));

  static VenuesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      VenuesRecord.getDocumentFromData(
        {
          'name': snapshot.data['name'],
          'regionID': snapshot.data['regionID'],
          'image': snapshot.data['image'],
          'regionName': snapshot.data['regionName'],
          'tastingFee': snapshot.data['tastingFee']?.toDouble(),
          'capacity': snapshot.data['capacity']?.round(),
          'openDays': safeGet(
            () => snapshot.data['openDays']
                .map((i) => (i as num).round())
                .toList(),
          ),
          'maxCapacityEnforced': snapshot.data['maxCapacityEnforced'],
          'mustAcknowledgeTCs': snapshot.data['mustAcknowledgeTCs'],
          'region_Ref': safeGet(
            () => toRef(snapshot.data['region_Ref']),
          ),
          'is_favourited_by': safeGet(
            () =>
                snapshot.data['is_favourited_by'].map((s) => toRef(s)).toList(),
          ),
          'country_state': snapshot.data['country_state'],
          'is_lunch_venue_only': snapshot.data['is_lunch_venue_only'],
          'large_group_early_seating_only':
              snapshot.data['large_group_early_seating_only'],
        },
        VenuesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VenuesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'venues',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'VenuesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createVenuesRecordData({
  String? name,
  String? regionID,
  String? image,
  String? regionName,
  double? tastingFee,
  int? capacity,
  bool? maxCapacityEnforced,
  bool? mustAcknowledgeTCs,
  DocumentReference? regionRef,
  String? countryState,
  bool? isLunchVenueOnly,
  bool? largeGroupEarlySeatingOnly,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'regionID': regionID,
      'image': image,
      'regionName': regionName,
      'tastingFee': tastingFee,
      'capacity': capacity,
      'maxCapacityEnforced': maxCapacityEnforced,
      'mustAcknowledgeTCs': mustAcknowledgeTCs,
      'region_Ref': regionRef,
      'country_state': countryState,
      'is_lunch_venue_only': isLunchVenueOnly,
      'large_group_early_seating_only': largeGroupEarlySeatingOnly,
    }.withoutNulls,
  );

  return firestoreData;
}
