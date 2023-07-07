import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DiscoverModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  LatLng? currentUserLocation;

  int? upcomingeventsCount;

  List<VenuesRecord> venuesListLocal = [];
  void addToVenuesListLocal(VenuesRecord item) => venuesListLocal.add(item);
  void removeFromVenuesListLocal(VenuesRecord item) =>
      venuesListLocal.remove(item);
  void removeAtIndexFromVenuesListLocal(int index) =>
      venuesListLocal.removeAt(index);
  void updateVenuesListLocalAtIndex(
          int index, Function(VenuesRecord) updateFn) =>
      venuesListLocal[index] = updateFn(venuesListLocal[index]);

  bool? upcomingEventsTrueFalse = false;

  bool? activeHighlights;

  List<VenuesRecord> venuesSortedByDistancePS = [];
  void addToVenuesSortedByDistancePS(VenuesRecord item) =>
      venuesSortedByDistancePS.add(item);
  void removeFromVenuesSortedByDistancePS(VenuesRecord item) =>
      venuesSortedByDistancePS.remove(item);
  void removeAtIndexFromVenuesSortedByDistancePS(int index) =>
      venuesSortedByDistancePS.removeAt(index);
  void updateVenuesSortedByDistancePSAtIndex(
          int index, Function(VenuesRecord) updateFn) =>
      venuesSortedByDistancePS[index] =
          updateFn(venuesSortedByDistancePS[index]);

  bool? pageLoaded;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - countCollectionDocs] action in Discover widget.
  int? highlightsCount;
  // Stores action output result for [Custom Action - getDocsFromCollectionVenues] action in Discover widget.
  List<VenuesRecord>? venuesList;
  // Stores action output result for [Custom Action - sortVenuesByDistance] action in Discover widget.
  List<VenuesRecord>? sortedVenuesByDistanceOutput;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Stores action output result for [Custom Action - getDocsFromCollectionVenues] action in ChoiceChips widget.
  List<VenuesRecord>? venuesListChoiceChips;
  // Stores action output result for [Custom Action - sortVenuesByDistance] action in ChoiceChips widget.
  List<VenuesRecord>? sortedVenuesByDistanceOutputChoiceChips;
  // Stores action output result for [Custom Action - getDocsFromCollectionVenues] action in Container widget.
  List<VenuesRecord>? venuesList2;
  // Stores action output result for [Custom Action - sortVenuesByDistance] action in Container widget.
  List<VenuesRecord>? sortedVenuesByDistanceOutput2;
  // Stores action output result for [Custom Action - getDocsFromCollectionVenues] action in Container widget.
  List<VenuesRecord>? venuesList3;
  // Stores action output result for [Custom Action - sortVenuesByDistance] action in Container widget.
  List<VenuesRecord>? sortedVenuesByDistanceOutput3;
  // Stores action output result for [Custom Action - getDocsFromCollectionVenues] action in Container widget.
  List<VenuesRecord>? venuesList5;
  // Stores action output result for [Custom Action - sortVenuesByDistance] action in Container widget.
  List<VenuesRecord>? sortedVenuesByDistanceOutput5;
  // Stores action output result for [Custom Action - getDocsFromCollectionVenues] action in Container widget.
  List<VenuesRecord>? venuesList4;
  // Stores action output result for [Custom Action - sortVenuesByDistance] action in Container widget.
  List<VenuesRecord>? sortedVenuesByDistanceOutput4;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
