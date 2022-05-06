import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'venues_record.g.dart';

abstract class VenuesRecord
    implements Built<VenuesRecord, VenuesRecordBuilder> {
  static Serializer<VenuesRecord> get serializer => _$venuesRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get regionID;

  @nullable
  String get image;

  @nullable
  String get regionName;

  @nullable
  double get tastingFee;

  @nullable
  int get capacity;

  @nullable
  BuiltList<int> get openDays;

  @nullable
  bool get maxCapacityEnforced;

  @nullable
  bool get mustAcknowledgeTCs;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(VenuesRecordBuilder builder) => builder
    ..name = ''
    ..regionID = ''
    ..image = ''
    ..regionName = ''
    ..tastingFee = 0.0
    ..capacity = 0
    ..openDays = ListBuilder()
    ..maxCapacityEnforced = false
    ..mustAcknowledgeTCs = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('venues');

  static Stream<VenuesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<VenuesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static VenuesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      VenuesRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..regionID = snapshot.data['regionID']
          ..image = snapshot.data['image']
          ..regionName = snapshot.data['regionName']
          ..tastingFee = snapshot.data['tastingFee']?.toDouble()
          ..capacity = snapshot.data['capacity']?.round()
          ..openDays =
              safeGet(() => ListBuilder(snapshot.data['openDays']?.round()))
          ..maxCapacityEnforced = snapshot.data['maxCapacityEnforced']
          ..mustAcknowledgeTCs = snapshot.data['mustAcknowledgeTCs']
          ..reference = VenuesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VenuesRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'venues',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  VenuesRecord._();
  factory VenuesRecord([void Function(VenuesRecordBuilder) updates]) =
      _$VenuesRecord;

  static VenuesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createVenuesRecordData({
  String name,
  String regionID,
  String image,
  String regionName,
  double tastingFee,
  int capacity,
  bool maxCapacityEnforced,
  bool mustAcknowledgeTCs,
}) =>
    serializers.toFirestore(
        VenuesRecord.serializer,
        VenuesRecord((v) => v
          ..name = name
          ..regionID = regionID
          ..image = image
          ..regionName = regionName
          ..tastingFee = tastingFee
          ..capacity = capacity
          ..openDays = null
          ..maxCapacityEnforced = maxCapacityEnforced
          ..mustAcknowledgeTCs = mustAcknowledgeTCs));
