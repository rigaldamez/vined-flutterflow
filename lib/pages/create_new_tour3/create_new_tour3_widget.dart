import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_new_tour3_model.dart';
export 'create_new_tour3_model.dart';

class CreateNewTour3Widget extends StatefulWidget {
  const CreateNewTour3Widget({
    Key? key,
    this.regionIDRef,
  }) : super(key: key);

  final DocumentReference? regionIDRef;

  @override
  _CreateNewTour3WidgetState createState() => _CreateNewTour3WidgetState();
}

class _CreateNewTour3WidgetState extends State<CreateNewTour3Widget> {
  late CreateNewTour3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateNewTour3Model());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<ToursRecord>>(
      stream: queryToursRecord(
        queryBuilder: (toursRecord) => toursRecord.where(
          'uid',
          isEqualTo: currentUserReference,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFF5F5F5),
            body: Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFFB19CD9),
                  ),
                ),
              ),
            ),
          );
        }
        List<ToursRecord> createNewTour3ToursRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).pinkPastel,
                  FlutterFlowTheme.of(context).greenPastel
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 26.0, 12.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 26.0,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFAppState().newTourName,
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Pickup Date & Time',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: Color(0x17333333),
                                borderRadius: BorderRadius.circular(34.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 6.0, 0.0),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.black,
                                      size: 18.0,
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                        'MMMMEEEEd', _model.datePicked),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.underline,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      dateTimeFormat('jm', _model.datePicked),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                  if (!functions.isStringNotEmpty(
                                      dateTimeFormat(
                                          'MMMMEEEEd', _model.datePicked)))
                                    Text(
                                      'Tap to set',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                ],
                              ),
                            ),
                            StreamBuilder<List<AppConfigRecord>>(
                              stream: queryAppConfigRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20.0,
                                      height: 20.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color(0xFFB19CD9),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<AppConfigRecord>
                                    containerAppConfigRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerAppConfigRecord =
                                    containerAppConfigRecordList.isNotEmpty
                                        ? containerAppConfigRecordList.first
                                        : null;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final _datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate:
                                          functions.getCurrentDateTimePlusAweek(
                                              _model.datePicked,
                                              containerAppConfigRecord
                                                  ?.tourLeadTime,
                                              valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.tourLeadTimeExempted,
                                                  false)),
                                      firstDate:
                                          functions.getCurrentDateTimePlusAweek(
                                              _model.datePicked,
                                              containerAppConfigRecord
                                                  ?.tourLeadTime,
                                              valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.tourLeadTimeExempted,
                                                  false)),
                                      lastDate: DateTime(2050),
                                    );

                                    TimeOfDay? _datePickedTime;
                                    if (_datePickedDate != null) {
                                      _datePickedTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            functions.getCurrentDateTimePlusAweek(
                                                _model.datePicked,
                                                containerAppConfigRecord
                                                    ?.tourLeadTime,
                                                valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.tourLeadTimeExempted,
                                                    false))),
                                      );
                                    }

                                    if (_datePickedDate != null &&
                                        _datePickedTime != null) {
                                      safeSetState(() {
                                        _model.datePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                          _datePickedTime!.hour,
                                          _datePickedTime.minute,
                                        );
                                      });
                                    }
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.9,
                                    height: 60.0,
                                    constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.sizeOf(context).width *
                                              0.9,
                                    ),
                                    decoration: BoxDecoration(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Pickup Address',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (functions
                      .isStringNotEmpty(_model.placePickerValue.address))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  60.0, 0.0, 60.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'unit number or letter',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(34.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(34.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(34.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(34.0),
                                  ),
                                  filled: true,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 24.0, 24.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                textAlign: TextAlign.center,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (functions
                      .isStringNotEmpty(_model.placePickerValue.address))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              _model.placePickerValue.address,
                              'address',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlutterFlowPlacePicker(
                          iOSGoogleMapsApiKey:
                              'AIzaSyDMvQ-0VfFVRtzlYA-8oxKroXhswUCQCi0',
                          androidGoogleMapsApiKey:
                              'AIzaSyCf9LVmSv_NS1Yz34-f51SXiiHMhSlv72A',
                          webGoogleMapsApiKey:
                              'AIzaSyA1rjhxywp_z2GbG-GNbGMnNMiB-YLH2C8',
                          onSelect: (place) async {
                            setState(() => _model.placePickerValue = place);
                          },
                          defaultText: 'Tap to set',
                          icon: Icon(
                            Icons.place,
                            color: Colors.black,
                            size: 16.0,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: 330.0,
                            height: 60.0,
                            color: Color(0x00333333),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(34.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (functions
                      .isStringNotEmpty(_model.placePickerValue.address))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: GETGeolocationFORAddressCall.call(
                          address: _model.placePickerValue.address,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFB19CD9),
                                  ),
                                ),
                              ),
                            );
                          }
                          final rowGETGeolocationFORAddressResponse =
                              snapshot.data!;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  var toursRecordReference =
                                      ToursRecord.collection.doc();
                                  await toursRecordReference.set({
                                    ...createToursRecordData(
                                      createdTime: getCurrentTimestamp,
                                      uid: currentUserReference,
                                      passengers:
                                          FFAppState().newTourNoOfPassengers,
                                      pickupAddress:
                                          _model.placePickerValue.address,
                                      tourDate: _model.datePicked,
                                      regionID: FFAppState().newTourRegionRef,
                                      pricePp: FFAppState().newTourPricePP,
                                      pickupLatlng: functions.createGeoPoint(
                                          getJsonField(
                                            rowGETGeolocationFORAddressResponse
                                                .jsonBody,
                                            r'''$.results[0].geometry.location.lat''',
                                          ),
                                          getJsonField(
                                            rowGETGeolocationFORAddressResponse
                                                .jsonBody,
                                            r'''$.results[0].geometry.location.lng''',
                                          )),
                                      region: FFAppState().newTourRegionName,
                                      tourName: FFAppState().newTourName,
                                      pickupUnitNumber:
                                          _model.textController.text,
                                      tourState: 'draft',
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'guests_uid': [currentUserReference],
                                      },
                                    ),
                                  });
                                  _model.createdTourID =
                                      ToursRecord.getDocumentFromData({
                                    ...createToursRecordData(
                                      createdTime: getCurrentTimestamp,
                                      uid: currentUserReference,
                                      passengers:
                                          FFAppState().newTourNoOfPassengers,
                                      pickupAddress:
                                          _model.placePickerValue.address,
                                      tourDate: _model.datePicked,
                                      regionID: FFAppState().newTourRegionRef,
                                      pricePp: FFAppState().newTourPricePP,
                                      pickupLatlng: functions.createGeoPoint(
                                          getJsonField(
                                            rowGETGeolocationFORAddressResponse
                                                .jsonBody,
                                            r'''$.results[0].geometry.location.lat''',
                                          ),
                                          getJsonField(
                                            rowGETGeolocationFORAddressResponse
                                                .jsonBody,
                                            r'''$.results[0].geometry.location.lng''',
                                          )),
                                      region: FFAppState().newTourRegionName,
                                      tourName: FFAppState().newTourName,
                                      pickupUnitNumber:
                                          _model.textController.text,
                                      tourState: 'draft',
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'guests_uid': [currentUserReference],
                                      },
                                    ),
                                  }, toursRecordReference);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Tour created!',
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          color: Color(0xFFFAFAFA),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Colors.black,
                                    ),
                                  );
                                  if (Navigator.of(context).canPop()) {
                                    context.pop();
                                  }
                                  context.pushNamed(
                                    'AddVenueToTour',
                                    queryParameters: {
                                      'tourID': serializeParam(
                                        _model.createdTourID?.reference,
                                        ParamType.DocumentReference,
                                      ),
                                      'tourName': serializeParam(
                                        FFAppState().newTourName,
                                        ParamType.String,
                                      ),
                                      'regionID': serializeParam(
                                        FFAppState().newTourRegionID,
                                        ParamType.String,
                                      ),
                                      'makeLunchStopBool': serializeParam(
                                        false,
                                        ParamType.bool,
                                      ),
                                      'venueCount': serializeParam(
                                        0,
                                        ParamType.int,
                                      ),
                                      'tourDate': serializeParam(
                                        _model.datePicked,
                                        ParamType.DateTime,
                                      ),
                                      'tourRecord': serializeParam(
                                        _model.createdTourID,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'tourRecord': _model.createdTourID,
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 150),
                                      ),
                                    },
                                  );

                                  setState(() {});
                                },
                                text: 'Select wineries',
                                options: FFButtonOptions(
                                  width: 340.0,
                                  height: 60.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.black,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: StreamBuilder<List<ToursRecord>>(
                        stream: queryToursRecord(
                          queryBuilder: (toursRecord) => toursRecord
                              .where(
                                'uid',
                                isEqualTo: currentUserReference,
                              )
                              .orderBy('tour_date', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFB19CD9),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ToursRecord> listViewToursRecordList =
                              snapshot.data!;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewToursRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewToursRecord =
                                  listViewToursRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 6.0),
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 4.0, 4.0, 4.0),
                                    child: StreamBuilder<RegionsRecord>(
                                      stream: RegionsRecord.getDocument(
                                          listViewToursRecord.regionID!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 20.0,
                                              height: 20.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFB19CD9),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final rowRegionsRecord = snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'EditTourPassengers',
                                                  queryParameters: {
                                                    'tourID': serializeParam(
                                                      listViewToursRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image.network(
                                                  rowRegionsRecord.image,
                                                  width: 100.0,
                                                  height: 100.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 4.0, 0.0, 4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        listViewToursRecord
                                                            .tourName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          listViewToursRecord
                                                              .passengers
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  StreamBuilder<RegionsRecord>(
                                                    stream: RegionsRecord
                                                        .getDocument(
                                                            listViewToursRecord
                                                                .regionID!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 20.0,
                                                            height: 20.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Color(
                                                                    0xFFB19CD9),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final rowRegionsRecord =
                                                          snapshot.data!;
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            rowRegionsRecord
                                                                .name,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'yMMMd',
                                                                  listViewToursRecord
                                                                      .tourDate!),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              'AddVenueToTour',
                                                              queryParameters: {
                                                                'tourID':
                                                                    serializeParam(
                                                                  listViewToursRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'tourName':
                                                                    serializeParam(
                                                                  listViewToursRecord
                                                                      .tourName,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'regionID':
                                                                    serializeParam(
                                                                  rowRegionsRecord
                                                                      .regionID,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                                'tourDate':
                                                                    serializeParam(
                                                                  listViewToursRecord
                                                                      .tourDate,
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'tourRecord':
                                                                    serializeParam(
                                                                  listViewToursRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'tourRecord':
                                                                    listViewToursRecord,
                                                              },
                                                            );
                                                          },
                                                          text: 'Add Venue',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100.0,
                                                            height: 30.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .black,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                'ViewTourDetails',
                                                                queryParameters:
                                                                    {
                                                                  'tourRef':
                                                                      serializeParam(
                                                                    listViewToursRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            text: 'View Tour',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100.0,
                                                              height: 30.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .black,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12.0,
                                                                      ),
                                                              elevation: 2.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  StreamBuilder<List<AppConfigRecord>>(
                    stream: queryAppConfigRecord(
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFB19CD9),
                              ),
                            ),
                          ),
                        );
                      }
                      List<AppConfigRecord> rowAppConfigRecordList =
                          snapshot.data!;
                      final rowAppConfigRecord =
                          rowAppConfigRecordList.isNotEmpty
                              ? rowAppConfigRecordList.first
                              : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Lead Time: ',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              rowAppConfigRecord!.tourLeadTime.toString(),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Exempted:',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            functions.boolString(valueOrDefault<bool>(
                                currentUserDocument?.tourLeadTimeExempted,
                                false)),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
