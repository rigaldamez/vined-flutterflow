import '../add_venue/add_venue_widget.dart';
import '../backend/backend.dart';
import '../components/edit_tour_date_bottomsheet_widget.dart';
import '../edit_tour_passengers/edit_tour_passengers_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TourDetailsWidget extends StatefulWidget {
  const TourDetailsWidget({
    Key key,
    this.tourID,
  }) : super(key: key);

  final DocumentReference tourID;

  @override
  _TourDetailsWidgetState createState() => _TourDetailsWidgetState();
}

class _TourDetailsWidgetState extends State<TourDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).black,
        icon: Icon(
          Icons.directions_bus_rounded,
          color: FlutterFlowTheme.of(context).cultured,
          size: 20,
        ),
        elevation: 8,
        label: Text(
          'Submit',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).cultured,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: StreamBuilder<ToursRecord>(
        stream: ToursRecord.getDocument(widget.tourID),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: SpinKitDualRing(
                  color: FlutterFlowTheme.of(context).purplePastel,
                  size: 20,
                ),
              ),
            );
          }
          final containerTourReffToursRecord = snapshot.data;
          return Container(
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Stack(
                    children: [
                      StreamBuilder<RegionsRecord>(
                        stream: RegionsRecord.getDocument(
                            containerTourReffToursRecord.regionID),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: SpinKitDualRing(
                                  color:
                                      FlutterFlowTheme.of(context).purplePastel,
                                  size: 20,
                                ),
                              ),
                            );
                          }
                          final containerRegionReffRegionsRecord =
                              snapshot.data;
                          return Container(
                            width: double.infinity,
                            height: 220,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  containerRegionReffRegionsRecord.image,
                                  width: double.infinity,
                                  height: 280,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 280,
                                  decoration: BoxDecoration(
                                    color: Color(0x4D000000),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            containerTourReffToursRecord
                                                .tourName,
                                            maxLines: 2,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFFAFAFA),
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Container(
                                            width: 100,
                                            height: 40,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 40,
                                                  fillColor: Color(0x66000000),
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.share,
                                                    color: Colors.white,
                                                    size: 14,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30,
                                                  borderWidth: 1,
                                                  buttonSize: 40,
                                                  fillColor: Color(0x65000000),
                                                  icon: Icon(
                                                    Icons.close_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .cultured,
                                                    size: 20,
                                                  ),
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            containerTourReffToursRecord.region,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFFAFAFA),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1.01),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.8,
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
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(38),
                              topRight: Radius.circular(38),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: StreamBuilder<List<AppConfigRecord>>(
                              stream: queryAppConfigRecord(
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: SpinKitDualRing(
                                        color: FlutterFlowTheme.of(context)
                                            .purplePastel,
                                        size: 20,
                                      ),
                                    ),
                                  );
                                }
                                List<AppConfigRecord>
                                    columnAppConfigReffAppConfigRecordList =
                                    snapshot.data;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data.isEmpty) {
                                  return Container();
                                }
                                final columnAppConfigReffAppConfigRecord =
                                    columnAppConfigReffAppConfigRecordList
                                            .isNotEmpty
                                        ? columnAppConfigReffAppConfigRecordList
                                            .first
                                        : null;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 10, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 70,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.calendar_today,
                                                        color: Colors.black,
                                                        size: 20,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 6, 0, 0),
                                                        child: Container(
                                                          width: 60,
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            children: [
                                                              Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    functions.getDayMonthFromDate(
                                                                        containerTourReffToursRecord
                                                                            .tourDate),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).cultured,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child: Container(
                                                              height: 440,
                                                              child:
                                                                  EditTourDateBottomsheetWidget(
                                                                tourID: widget
                                                                    .tourID,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 70,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      FaIcon(
                                                        FontAwesomeIcons.users,
                                                        color: Colors.black,
                                                        size: 20,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 6, 0, 0),
                                                        child: Container(
                                                          width: 60,
                                                          child: Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            children: [
                                                              Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    containerTourReffToursRecord
                                                                        .passengers
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).cultured,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .bottomToTop,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  150),
                                                          reverseDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      150),
                                                          child:
                                                              EditTourPassengersWidget(
                                                            tourID:
                                                                containerTourReffToursRecord
                                                                    .reference,
                                                            tourName:
                                                                containerTourReffToursRecord
                                                                    .tourName,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            StreamBuilder<
                                                List<SelectedVenuesRecord>>(
                                              stream: querySelectedVenuesRecord(
                                                queryBuilder:
                                                    (selectedVenuesRecord) =>
                                                        selectedVenuesRecord
                                                            .where('tourRef',
                                                                isEqualTo: widget
                                                                    .tourID),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: SpinKitDualRing(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .purplePastel,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<SelectedVenuesRecord>
                                                    containerSelectedVenuesSelectedVenuesRecordList =
                                                    snapshot.data;
                                                return Container(
                                                  width: 70,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FaIcon(
                                                              FontAwesomeIcons
                                                                  .dollarSign,
                                                              color:
                                                                  Colors.black,
                                                              size: 20,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'ea',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      6, 0, 0),
                                                          child: Container(
                                                            width: 60,
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              children: [
                                                                Container(
                                                                  width: 100,
                                                                  height: 30,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            4,
                                                                            4,
                                                                            0),
                                                                    child: Text(
                                                                      functions.getPerPersonFee(
                                                                          containerTourReffToursRecord
                                                                              .pricePp,
                                                                          containerSelectedVenuesSelectedVenuesRecordList
                                                                              .toList(),
                                                                          columnAppConfigReffAppConfigRecord
                                                                              .platformTastingFee),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).cultured,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Container(
                                              width: 70,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x65303030),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.emoji_people_rounded,
                                                    color: Colors.black,
                                                    size: 24,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 6, 0, 0),
                                                    child: Container(
                                                      width: 60,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            height: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                '0',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .cultured,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 20, 40, 0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: Color(0x24333333),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 4),
                                                    child: Icon(
                                                      Icons.pin_drop_outlined,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      functions.getTimeFromDate(
                                                          containerTourReffToursRecord
                                                              .tourDate),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .cultured,
                                                                fontSize: 9,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 2,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black,
                                                    ),
                                                  ),
                                                  if (functions.isArrayEmpty(
                                                          containerTourReffToursRecord
                                                              .venues
                                                              .toList()) ??
                                                      true)
                                                    Container(
                                                      width: 8,
                                                      height: 8,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.76,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.12,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 3,
                                                          color:
                                                              Color(0x34303030),
                                                          spreadRadius: 1,
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              22),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 12, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  containerTourReffToursRecord
                                                                      .pickupAddress
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        40,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF333333),
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 40,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .solidEdit,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 20,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        2,
                                                                        0,
                                                                        0),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.7,
                                                              height: 1,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x1A000000),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        10,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 26,
                                                                  height: 26,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    'https://picsum.photos/seed/701/600',
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Rogelio',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              10,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .star_rate_rounded,
                                                                    color: Colors
                                                                        .black,
                                                                    size: 18,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  '5.0',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      StreamBuilder<List<SelectedVenuesRecord>>(
                                        stream: querySelectedVenuesRecord(
                                          queryBuilder:
                                              (selectedVenuesRecord) =>
                                                  selectedVenuesRecord
                                                      .where('tourRef',
                                                          isEqualTo:
                                                              widget.tourID)
                                                      .orderBy(
                                                          'reservationTime'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: SpinKitDualRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .purplePastel,
                                                  size: 20,
                                                ),
                                              ),
                                            );
                                          }
                                          List<SelectedVenuesRecord>
                                              listViewSelectedVenuesSelectedVenuesRecordList =
                                              snapshot.data;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewSelectedVenuesSelectedVenuesRecordList
                                                    .length,
                                            itemBuilder: (context,
                                                listViewSelectedVenuesIndex) {
                                              final listViewSelectedVenuesSelectedVenuesRecord =
                                                  listViewSelectedVenuesSelectedVenuesRecordList[
                                                      listViewSelectedVenuesIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child:
                                                    StreamBuilder<VenuesRecord>(
                                                  stream: VenuesRecord.getDocument(
                                                      listViewSelectedVenuesSelectedVenuesRecord
                                                          .venueRef),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child:
                                                              SpinKitDualRing(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .purplePastel,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final rowSelectedVenueVenuesRecord =
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
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 50,
                                                              height: 20,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Text(
                                                                functions.getTimeFromDate(
                                                                    listViewSelectedVenuesSelectedVenuesRecord
                                                                        .reservationTime),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .cultured,
                                                                      fontSize:
                                                                          9,
                                                                    ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 2,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.23,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.24,
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.8,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    1,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              28),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                child: Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Colors
                                                                      .white,
                                                                  elevation: 2,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            28),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            6,
                                                                            6,
                                                                            6,
                                                                            6),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(28),
                                                                          child:
                                                                              Image.network(
                                                                            rowSelectedVenueVenuesRecord.image,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            1.02),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              6,
                                                                              0,
                                                                              6,
                                                                              6),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                100,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Colors.transparent,
                                                                                  Color(0xB3000000)
                                                                                ],
                                                                                stops: [
                                                                                  0,
                                                                                  1
                                                                                ],
                                                                                begin: AlignmentDirectional(0, -1),
                                                                                end: AlignmentDirectional(0, 1),
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(28),
                                                                                bottomRight: Radius.circular(28),
                                                                                topLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            6,
                                                                            6,
                                                                            6,
                                                                            6),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(28),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 12, 0, 12),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-0.81, -0.73),
                                                                                          child: Container(
                                                                                            width: 54,
                                                                                            height: 30,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).black,
                                                                                              borderRadius: BorderRadius.circular(50),
                                                                                              shape: BoxShape.rectangle,
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.wine_bar_rounded,
                                                                                                  color: Color(0xFFF4F4F4),
                                                                                                  size: 14,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                                  child: Icon(
                                                                                                    Icons.dinner_dining,
                                                                                                    color: FlutterFlowTheme.of(context).cultured,
                                                                                                    size: 16,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              functions.upperCaseString(rowSelectedVenueVenuesRecord.name),
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).cultured,
                                                                                                    fontSize: 12,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              functions.concatenateStrings('Booking Reff:', listViewSelectedVenuesSelectedVenuesRecord.bookingReference),
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).cultured,
                                                                                                    fontSize: 8,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      if (functions
                                              .isTourStopsCountLessThanLimitAllowed(
                                                  containerTourReffToursRecord
                                                      .venues
                                                      .toList(),
                                                  columnAppConfigReffAppConfigRecord) ??
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Icon(
                                                      Icons.access_time_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .cultured,
                                                      size: 12,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 2,
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black,
                                                    ),
                                                  ),
                                                  if (functions.isArrayEmpty(
                                                          containerTourReffToursRecord
                                                              .venues
                                                              .toList()) ??
                                                      true)
                                                    Container(
                                                      width: 8,
                                                      height: 8,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.78,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(23),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20,
                                                                    20, 20, 20),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FFButtonWidget(
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
                                                                        AddVenueWidget(
                                                                      tourID: widget
                                                                          .tourID,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              text:
                                                                  'Add a venue',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 120,
                                                                height: 30,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black,
                                                                textStyle:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Poppins',
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 6,
                                                                ),
                                                                elevation: 8,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    32,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (!(functions.isArrayEmpty(
                                              containerTourReffToursRecord
                                                  .venues
                                                  .toList())) ??
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 20),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 2,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '5.00 pm',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .cultured,
                                                                fontSize: 9,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 20, 0, 0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.68,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    12),
                                                          ),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Icon(
                                                                Icons
                                                                    .flag_rounded,
                                                                color: Colors
                                                                    .black,
                                                                size: 18,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                'return time',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Color(
                                                                          0xFF333333),
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
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
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
