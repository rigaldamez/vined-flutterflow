import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tasting_experiences_record.g.dart';

abstract class TastingExperiencesRecord
    implements
        Built<TastingExperiencesRecord, TastingExperiencesRecordBuilder> {
  static Serializer<TastingExperiencesRecord> get serializer =>
      _$tastingExperiencesRecordSerializer;

  String? get image;

  String? get description;

  @BuiltValueField(wireName: 'tasting_experience_price')
  double? get tastingExperiencePrice;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(TastingExperiencesRecordBuilder builder) =>
      builder
        ..image = ''
        ..description = ''
        ..tastingExperiencePrice = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tasting_experiences')
          : FirebaseFirestore.instance.collectionGroup('tasting_experiences');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tasting_experiences').doc();

  static Stream<TastingExperiencesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TastingExperiencesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TastingExperiencesRecord._();
  factory TastingExperiencesRecord(
          [void Function(TastingExperiencesRecordBuilder) updates]) =
      _$TastingExperiencesRecord;

  static TastingExperiencesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTastingExperiencesRecordData({
  String? image,
  String? description,
  double? tastingExperiencePrice,
}) {
  final firestoreData = serializers.toFirestore(
    TastingExperiencesRecord.serializer,
    TastingExperiencesRecord(
      (t) => t
        ..image = image
        ..description = description
        ..tastingExperiencePrice = tastingExperiencePrice,
    ),
  );

  return firestoreData;
}
