import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'rate_venue_bottomseet_widget.dart' show RateVenueBottomseetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RateVenueBottomseetModel
    extends FlutterFlowModel<RateVenueBottomseetWidget> {
  ///  Local state fields for this component.

  DocumentReference? venueReff;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TastingNotesField widget.
  FocusNode? tastingNotesFieldFocusNode;
  TextEditingController? tastingNotesFieldController;
  String? Function(BuildContext, String?)? tastingNotesFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    tastingNotesFieldFocusNode?.dispose();
    tastingNotesFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
