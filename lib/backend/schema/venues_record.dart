import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

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

  // "country_state_display_name" field.
  String? _countryStateDisplayName;
  String get countryStateDisplayName => _countryStateDisplayName ?? '';
  bool hasCountryStateDisplayName() => _countryStateDisplayName != null;

  // "lat_long" field.
  LatLng? _latLong;
  LatLng? get latLong => _latLong;
  bool hasLatLong() => _latLong != null;

  // "views_count" field.
  int? _viewsCount;
  int get viewsCount => _viewsCount ?? 0;
  bool hasViewsCount() => _viewsCount != null;

  // "last_venue_view_date" field.
  DateTime? _lastVenueViewDate;
  DateTime? get lastVenueViewDate => _lastVenueViewDate;
  bool hasLastVenueViewDate() => _lastVenueViewDate != null;

  // "featured_venue" field.
  bool? _featuredVenue;
  bool get featuredVenue => _featuredVenue ?? false;
  bool hasFeaturedVenue() => _featuredVenue != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "venueDescription" field.
  String? _venueDescription;
  String get venueDescription => _venueDescription ?? '';
  bool hasVenueDescription() => _venueDescription != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "googlePlaceID" field.
  String? _googlePlaceID;
  String get googlePlaceID => _googlePlaceID ?? '';
  bool hasGooglePlaceID() => _googlePlaceID != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _regionID = snapshotData['regionID'] as String?;
    _image = snapshotData['image'] as String?;
    _regionName = snapshotData['regionName'] as String?;
    _tastingFee = castToType<double>(snapshotData['tastingFee']);
    _capacity = castToType<int>(snapshotData['capacity']);
    _openDays = getDataList(snapshotData['openDays']);
    _maxCapacityEnforced = snapshotData['maxCapacityEnforced'] as bool?;
    _mustAcknowledgeTCs = snapshotData['mustAcknowledgeTCs'] as bool?;
    _regionRef = snapshotData['region_Ref'] as DocumentReference?;
    _isFavouritedBy = getDataList(snapshotData['is_favourited_by']);
    _countryState = snapshotData['country_state'] as String?;
    _isLunchVenueOnly = snapshotData['is_lunch_venue_only'] as bool?;
    _largeGroupEarlySeatingOnly =
        snapshotData['large_group_early_seating_only'] as bool?;
    _countryStateDisplayName =
        snapshotData['country_state_display_name'] as String?;
    _latLong = snapshotData['lat_long'] as LatLng?;
    _viewsCount = castToType<int>(snapshotData['views_count']);
    _lastVenueViewDate = snapshotData['last_venue_view_date'] as DateTime?;
    _featuredVenue = snapshotData['featured_venue'] as bool?;
    _isActive = snapshotData['isActive'] as bool?;
    _venueDescription = snapshotData['venueDescription'] as String?;
    _address = snapshotData['address'] as String?;
    _googlePlaceID = snapshotData['googlePlaceID'] as String?;
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
          'tastingFee': convertAlgoliaParam(
            snapshot.data['tastingFee'],
            ParamType.double,
            false,
          ),
          'capacity': convertAlgoliaParam(
            snapshot.data['capacity'],
            ParamType.int,
            false,
          ),
          'openDays': safeGet(
            () => convertAlgoliaParam<int>(
              snapshot.data['openDays'],
              ParamType.int,
              true,
            ).toList(),
          ),
          'maxCapacityEnforced': snapshot.data['maxCapacityEnforced'],
          'mustAcknowledgeTCs': snapshot.data['mustAcknowledgeTCs'],
          'region_Ref': convertAlgoliaParam(
            snapshot.data['region_Ref'],
            ParamType.DocumentReference,
            false,
          ),
          'is_favourited_by': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['is_favourited_by'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'country_state': snapshot.data['country_state'],
          'is_lunch_venue_only': snapshot.data['is_lunch_venue_only'],
          'large_group_early_seating_only':
              snapshot.data['large_group_early_seating_only'],
          'country_state_display_name':
              snapshot.data['country_state_display_name'],
          'lat_long': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'views_count': convertAlgoliaParam(
            snapshot.data['views_count'],
            ParamType.int,
            false,
          ),
          'last_venue_view_date': convertAlgoliaParam(
            snapshot.data['last_venue_view_date'],
            ParamType.DateTime,
            false,
          ),
          'featured_venue': snapshot.data['featured_venue'],
          'isActive': snapshot.data['isActive'],
          'venueDescription': snapshot.data['venueDescription'],
          'address': snapshot.data['address'],
          'googlePlaceID': snapshot.data['googlePlaceID'],
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

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VenuesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
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
  String? countryStateDisplayName,
  LatLng? latLong,
  int? viewsCount,
  DateTime? lastVenueViewDate,
  bool? featuredVenue,
  bool? isActive,
  String? venueDescription,
  String? address,
  String? googlePlaceID,
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
      'country_state_display_name': countryStateDisplayName,
      'lat_long': latLong,
      'views_count': viewsCount,
      'last_venue_view_date': lastVenueViewDate,
      'featured_venue': featuredVenue,
      'isActive': isActive,
      'venueDescription': venueDescription,
      'address': address,
      'googlePlaceID': googlePlaceID,
    }.withoutNulls,
  );

  return firestoreData;
}

class VenuesRecordDocumentEquality implements Equality<VenuesRecord> {
  const VenuesRecordDocumentEquality();

  @override
  bool equals(VenuesRecord? e1, VenuesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.regionID == e2?.regionID &&
        e1?.image == e2?.image &&
        e1?.regionName == e2?.regionName &&
        e1?.tastingFee == e2?.tastingFee &&
        e1?.capacity == e2?.capacity &&
        listEquality.equals(e1?.openDays, e2?.openDays) &&
        e1?.maxCapacityEnforced == e2?.maxCapacityEnforced &&
        e1?.mustAcknowledgeTCs == e2?.mustAcknowledgeTCs &&
        e1?.regionRef == e2?.regionRef &&
        listEquality.equals(e1?.isFavouritedBy, e2?.isFavouritedBy) &&
        e1?.countryState == e2?.countryState &&
        e1?.isLunchVenueOnly == e2?.isLunchVenueOnly &&
        e1?.largeGroupEarlySeatingOnly == e2?.largeGroupEarlySeatingOnly &&
        e1?.countryStateDisplayName == e2?.countryStateDisplayName &&
        e1?.latLong == e2?.latLong &&
        e1?.viewsCount == e2?.viewsCount &&
        e1?.lastVenueViewDate == e2?.lastVenueViewDate &&
        e1?.featuredVenue == e2?.featuredVenue &&
        e1?.isActive == e2?.isActive &&
        e1?.venueDescription == e2?.venueDescription &&
        e1?.address == e2?.address &&
        e1?.googlePlaceID == e2?.googlePlaceID;
  }

  @override
  int hash(VenuesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.regionID,
        e?.image,
        e?.regionName,
        e?.tastingFee,
        e?.capacity,
        e?.openDays,
        e?.maxCapacityEnforced,
        e?.mustAcknowledgeTCs,
        e?.regionRef,
        e?.isFavouritedBy,
        e?.countryState,
        e?.isLunchVenueOnly,
        e?.largeGroupEarlySeatingOnly,
        e?.countryStateDisplayName,
        e?.latLong,
        e?.viewsCount,
        e?.lastVenueViewDate,
        e?.featuredVenue,
        e?.isActive,
        e?.venueDescription,
        e?.address,
        e?.googlePlaceID
      ]);

  @override
  bool isValidKey(Object? o) => o is VenuesRecord;
}
