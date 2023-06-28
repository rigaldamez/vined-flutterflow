// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<VenuesRecord>> getDocsFromCollectionVenues() async {
  // TODO change the name here
  List<VenuesRecord> docs = [];

  // Get a reference to the Firestore database
  final firestore = FirebaseFirestore.instance;

  // Get a reference to the usersdata collection
  final collectionRef = firestore.collection('venues');

  // Fetch all documents from the usersdata collection
  Query query = collectionRef;

  final querySnapshot = await query.get();

  // Iterate through the documents and create CarsRecord instances
  for (var doc in querySnapshot.docs) {
    // TODO 2 x with capipital letter and 1 x lower letter
    VenuesRecord venueDoc = await VenuesRecord.getDocumentOnce(doc.reference);
    // TODO 1 x lower letter
    docs.add(venueDoc);
  }

  return docs;
}
