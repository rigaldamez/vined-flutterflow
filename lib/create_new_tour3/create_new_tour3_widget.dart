import '../add_venue_to_tour/add_venue_to_tour_widget.dart';
import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../edit_tour_passengers/edit_tour_passengers_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../main.dart';
import '../view_tour_details/view_tour_details_widget.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewTour3Widget extends StatefulWidget {
  const CreateNewTour3Widget({
    Key key,
    this.regionIDRef,
  }) : super(key: key);

  final DocumentReference regionIDRef;

  @override
  _CreateNewTour3WidgetState createState() => _CreateNewTour3WidgetState();
}

class _CreateNewTour3WidgetState extends State<CreateNewTour3Widget> {
  DateTime datePicked;
  var placePickerValue = FFPlace();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ToursRecord>>(
      stream: queryToursRecord(
        queryBuilder: (toursRecord) =>
            toursRecord.where('uid', isEqualTo: currentUserReference),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitDualRing(
                color: FlutterFlowTheme.of(context).purplePastel,
                size: 50,
              ),
            ),
          );
        }
        List<ToursRecord> createNewTour3ToursRecordList = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).purplePastel,
                  FlutterFlowTheme.of(context).greenPastel
                ],
                stops: [0, 1],
                begin: AlignmentDirectional(0, -1),
                end: AlignmentDirectional(0, 1),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 26, 12, 20),
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
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          FFAppState().newTourNoOfPassengers.toString(),
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Pickup Date & Time',
                          style: FlutterFlowTheme.of(context).subtitle1,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 60,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).cultured,
                              borderRadius: BorderRadius.circular(34),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Icon(
                                    Icons.calendar_today_rounded,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  dateTimeFormat('MMMMEEEEd', datePicked),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                if (!(functions.isStringNotEmpty(dateTimeFormat(
                                        'MMMMEEEEd', datePicked))) ??
                                    true)
                                  Text(
                                    ',',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: Text(
                                    dateTimeFormat('jm', datePicked),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                if (functions.isStringNotEmpty(dateTimeFormat(
                                        'MMMMEEEEd', datePicked)) ??
                                    true)
                                  Text(
                                    'Tap to set',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await DatePicker.showDateTimePicker(
                                context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  setState(() => datePicked = date);
                                },
                                currentTime: functions
                                    .getCurrentDateTimePlusAweek(datePicked),
                                minTime: functions
                                    .getCurrentDateTimePlusAweek(datePicked),
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 60,
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.9,
                              ),
                              decoration: BoxDecoration(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            placePickerValue.address,
                            'address',
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                          onSelect: (place) =>
                              setState(() => placePickerValue = place),
                          defaultText: 'Select Pickup',
                          icon: Icon(
                            Icons.place,
                            color: Colors.black,
                            size: 16,
                          ),
                          buttonOptions: FFButtonOptions(
                            width: 300,
                            height: 50,
                            color: Colors.transparent,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: 34,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: GETGeolocationFORAddressCall.call(
                        address: placePickerValue.address,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: SpinKitDualRing(
                                color:
                                    FlutterFlowTheme.of(context).purplePastel,
                                size: 50,
                              ),
                            ),
                          );
                        }
                        final rowGETGeolocationFORAddressResponse =
                            snapshot.data;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final toursCreateData = createToursRecordData(
                                  createdTime: getCurrentTimestamp,
                                  uid: currentUserReference,
                                  passengers:
                                      FFAppState().newTourNoOfPassengers,
                                  pickupAddress: placePickerValue.address,
                                  tourDate: datePicked,
                                  regionID: FFAppState().newTourRegionRef,
                                  pricePp: FFAppState().newTourPricePP,
                                  pickupLatlng: functions.createGeoPoint(
                                      getJsonField(
                                        (rowGETGeolocationFORAddressResponse
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.results[0].geometry.location.lat''',
                                      ),
                                      getJsonField(
                                        (rowGETGeolocationFORAddressResponse
                                                ?.jsonBody ??
                                            ''),
                                        r'''$.results[0].geometry.location.lng''',
                                      )),
                                  region: FFAppState().newTourRegionName,
                                  tourName: FFAppState().newTourName,
                                );
                                await ToursRecord.collection
                                    .doc()
                                    .set(toursCreateData);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Tour created successfully!',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .purplePastel,
                                  ),
                                );
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.topToBottom,
                                    duration: Duration(milliseconds: 150),
                                    reverseDuration:
                                        Duration(milliseconds: 150),
                                    child: NavBarPage(initialPage: 'Tours'),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Create Tour',
                              options: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: StreamBuilder<List<ToursRecord>>(
                        stream: queryToursRecord(
                          queryBuilder: (toursRecord) => toursRecord
                              .where('uid', isEqualTo: currentUserReference)
                              .orderBy('tour_date', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: SpinKitDualRing(
                                  color:
                                      FlutterFlowTheme.of(context).purplePastel,
                                  size: 50,
                                ),
                              ),
                            );
                          }
                          List<ToursRecord> listViewToursRecordList =
                              snapshot.data;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewToursRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewToursRecord =
                                  listViewToursRecordList[listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 4, 4, 4),
                                    child: StreamBuilder<RegionsRecord>(
                                      stream: RegionsRecord.getDocument(
                                          listViewToursRecord.regionID),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: SpinKitDualRing(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .purplePastel,
                                                size: 50,
                                              ),
                                            ),
                                          );
                                        }
                                        final rowRegionsRecord = snapshot.data;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type: PageTransitionType
                                                        .bottomToTop,
                                                    duration: Duration(
                                                        milliseconds: 200),
                                                    reverseDuration: Duration(
                                                        milliseconds: 200),
                                                    child:
                                                        EditTourPassengersWidget(
                                                      tourID:
                                                          listViewToursRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.network(
                                                  rowRegionsRecord.image,
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 4, 0, 4),
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
                                                                .bodyText1,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewToursRecord
                                                              .passengers
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  StreamBuilder<RegionsRecord>(
                                                    stream: RegionsRecord
                                                        .getDocument(
                                                            listViewToursRecord
                                                                .regionID),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                SpinKitDualRing(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .purplePastel,
                                                              size: 50,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final rowRegionsRecord =
                                                          snapshot.data;
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
                                                                .bodyText1,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'yMMMd',
                                                                  listViewToursRecord
                                                                      .tourDate),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              PageTransition(
                                                                type: PageTransitionType
                                                                    .bottomToTop,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        150),
                                                                reverseDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            150),
                                                                child:
                                                                    AddVenueToTourWidget(
                                                                  tourID: listViewToursRecord
                                                                      .reference,
                                                                  tourName:
                                                                      listViewToursRecord
                                                                          .tourName,
                                                                  regionID:
                                                                      rowRegionsRecord
                                                                          .regionID,
                                                                  venueCount:
                                                                      listViewToursRecord
                                                                          .venuesCount,
                                                                  tourDate:
                                                                      listViewToursRecord
                                                                          .tourDate,
                                                                  tourRecord:
                                                                      listViewToursRecord,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          text: 'Add Venue',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 100,
                                                            height: 30,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .black,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius: 20,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type: PageTransitionType
                                                                      .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          150),
                                                                  reverseDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              150),
                                                                  child:
                                                                      ViewTourDetailsWidget(
                                                                    tourRef:
                                                                        listViewToursRecord
                                                                            .reference,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            text: 'View Tour',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 100,
                                                              height: 30,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .black,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1,
                                                              ),
                                                              borderRadius: 20,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
