import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'regions_record.g.dart';

abstract class RegionsRecord
    implements Built<RegionsRecord, RegionsRecordBuilder> {
  static Serializer<RegionsRecord> get serializer => _$regionsRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get image;

  @nullable
  bool get isServiced;

  @nullable
  String get regionID;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RegionsRecordBuilder builder) => builder
    ..name = ''
    ..image = ''
    ..isServiced = false
    ..regionID = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('regions');

  static Stream<RegionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RegionsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  RegionsRecord._();
  factory RegionsRecord([void Function(RegionsRecordBuilder) updates]) =
      _$RegionsRecord;

  static RegionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRegionsRecordData({
  String name,
  String image,
  bool isServiced,
  String regionID,
}) =>
    serializers.toFirestore(
        RegionsRecord.serializer,
        RegionsRecord((r) => r
          ..name = name
          ..image = image
          ..isServiced = isServiced
          ..regionID = regionID));
