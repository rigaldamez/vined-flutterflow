import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'del_update_venue_btmsheet_model.dart';
export 'del_update_venue_btmsheet_model.dart';

class DelUpdateVenueBtmsheetWidget extends StatefulWidget {
  const DelUpdateVenueBtmsheetWidget({
    Key? key,
    this.tourReff,
    this.venueDoc,
    this.selectedVenueReff,
  }) : super(key: key);

  final DocumentReference? tourReff;
  final VenuesRecord? venueDoc;
  final DocumentReference? selectedVenueReff;

  @override
  _DelUpdateVenueBtmsheetWidgetState createState() =>
      _DelUpdateVenueBtmsheetWidgetState();
}

class _DelUpdateVenueBtmsheetWidgetState
    extends State<DelUpdateVenueBtmsheetWidget> {
  late DelUpdateVenueBtmsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DelUpdateVenueBtmsheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ToursRecord>(
      stream: ToursRecord.getDocument(widget.tourReff!),
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
        final containerToursRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Color(0x3B1D2429),
                offset: Offset(0.0, -3.0),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.12,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).black,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: StreamBuilder<SelectedVenuesRecord>(
                          stream: SelectedVenuesRecord.getDocument(
                              widget.selectedVenueReff!),
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
                            final columnSelectedVenuesRecord = snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        child: Image.network(
                                          widget.venueDoc!.image,
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 230.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                functions.upperCaseString(
                                                    widget.venueDoc?.name),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00EEEEEE),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0x19333333),
                                          width: 1.0,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                if (!columnSelectedVenuesRecord
                                                    .isLunchVenueOnly)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.wine_bar_rounded,
                                                        color: Colors.black,
                                                        size: 24.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 190.0,
                                                          height: 70.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Tasting experience',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Text(
                                                                functions.displayTastingExperienceDescription(
                                                                    columnSelectedVenuesRecord
                                                                        .tastingExperienceDescription),
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          10.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.check_box_rounded,
                                                        color: Colors.black,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                                if (columnSelectedVenuesRecord
                                                    .isLunchVenueOnly)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.wine_bar_rounded,
                                                        color: Colors.black,
                                                        size: 24.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 190.0,
                                                          height: 70.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Tasting experience',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              Text(
                                                                'Not applicable',
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          10.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .check_box_outline_blank_rounded,
                                                        color:
                                                            Colors.transparent,
                                                        size: 24.0,
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00EEEEEE),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0x19333333),
                                          width: 1.0,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.dinner_dining,
                                                  color: Colors.black,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 190.0,
                                                    height: 70.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Make this my lunch stop?',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                        Text(
                                                          'At your own expense. ',
                                                          maxLines: 3,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 10.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    await columnSelectedVenuesRecord
                                                        .reference
                                                        .update({
                                                      'is_lunch_venue':
                                                          !columnSelectedVenuesRecord
                                                              .isLunchVenue,
                                                    });
                                                  },
                                                  value:
                                                      columnSelectedVenuesRecord
                                                          .isLunchVenue,
                                                  onIcon: Icon(
                                                    Icons.check_box,
                                                    color: Colors.black,
                                                    size: 25.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Colors.black,
                                                    size: 25.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.98,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    border: Border.all(
                                      color: Color(0x1A000000),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 30.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.access_time_rounded,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                        Container(
                                          width: 190.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Add reservation time',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                'Contact venue to make a reservation ',
                                                maxLines: 3,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 10.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 34.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .black,
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .cultured,
                                            size: 16.0,
                                          ),
                                          onPressed: () async {
                                            final _datePickedTime =
                                                await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay
                                                  .fromDateTime(functions
                                                      .getTodayTimestampZeroMinutes()),
                                            );
                                            if (_datePickedTime != null) {
                                              setState(() {
                                                _model.datePicked = DateTime(
                                                  functions
                                                      .getTodayTimestampZeroMinutes()
                                                      .year,
                                                  functions
                                                      .getTodayTimestampZeroMinutes()
                                                      .month,
                                                  functions
                                                      .getTodayTimestampZeroMinutes()
                                                      .day,
                                                  _datePickedTime.hour,
                                                  _datePickedTime.minute,
                                                );
                                              });
                                            }

                                            await widget.selectedVenueReff!.update(
                                                createSelectedVenuesRecordData(
                                              reservationTime: functions
                                                  .getBookingReservationTime(
                                                      containerToursRecord
                                                          .tourDate,
                                                      _model.datePicked),
                                            ));
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                StreamBuilder<List<SelectedVenuesRecord>>(
                                  stream: querySelectedVenuesRecord(
                                    queryBuilder: (selectedVenuesRecord) =>
                                        selectedVenuesRecord.where('tourRef',
                                            isEqualTo: widget.tourReff),
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
                                    List<SelectedVenuesRecord>
                                        containerSelectedVenuesRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: 300.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                      ),
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Text(
                                            'Remove venue',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (columnSelectedVenuesRecord
                                                  .isLunchVenue) {
                                                await widget.tourReff!.update({
                                                  ...createToursRecordData(
                                                    totalTastingFeePp: functions
                                                        .deductFromTotalTastingFeePP(
                                                            containerToursRecord
                                                                .totalTastingFeePp,
                                                            columnSelectedVenuesRecord),
                                                    pricePp: functions
                                                        .getPerPersonFeeAsIntRemoveVenue(
                                                            containerToursRecord
                                                                .platformTastingFee,
                                                            containerToursRecord
                                                                .pricePp,
                                                            columnSelectedVenuesRecord
                                                                .tastingFee)
                                                        .toDouble(),
                                                    subTotal: functions.getTourSubTotal(
                                                        containerToursRecord
                                                            .passengers,
                                                        functions
                                                            .getPerPersonFeeAsIntRemoveVenue(
                                                                containerToursRecord
                                                                    .platformTastingFee,
                                                                containerToursRecord
                                                                    .pricePp,
                                                                columnSelectedVenuesRecord
                                                                    .tastingFee)
                                                            .toDouble()),
                                                  ),
                                                  'venues':
                                                      FieldValue.arrayRemove([
                                                    widget.venueDoc?.reference
                                                  ]),
                                                });
                                                FFAppState().update(() {
                                                  FFAppState().lunchVenueReff =
                                                      null;
                                                });
                                                Navigator.pop(context);
                                                await widget.selectedVenueReff!
                                                    .delete();
                                              } else {
                                                if (columnSelectedVenuesRecord
                                                    .isLargeGroupEarlySeatingOnlyVenue) {
                                                  await widget.tourReff!
                                                      .update({
                                                    ...createToursRecordData(
                                                      totalTastingFeePp: functions
                                                          .deductFromTotalTastingFeePP(
                                                              containerToursRecord
                                                                  .totalTastingFeePp,
                                                              columnSelectedVenuesRecord),
                                                      pricePp: functions
                                                          .getPerPersonFeeAsInt(
                                                              containerToursRecord
                                                                  .transportFeePp,
                                                              containerSelectedVenuesRecordList
                                                                  .toList(),
                                                              containerToursRecord
                                                                  .platformTastingFee)
                                                          .toDouble(),
                                                      subTotal: functions.getTourSubTotal(
                                                          containerToursRecord
                                                              .passengers,
                                                          functions
                                                              .getPerPersonFeeAsInt(
                                                                  containerToursRecord
                                                                      .transportFeePp,
                                                                  containerSelectedVenuesRecordList
                                                                      .toList(),
                                                                  containerToursRecord
                                                                      .platformTastingFee)
                                                              .toDouble()),
                                                    ),
                                                    'venues':
                                                        FieldValue.arrayRemove([
                                                      widget.venueDoc?.reference
                                                    ]),
                                                    'large_group_venue_early_seating_count':
                                                        FieldValue.increment(
                                                            -(1)),
                                                  });
                                                  Navigator.pop(context);
                                                  await widget
                                                      .selectedVenueReff!
                                                      .delete();
                                                } else {
                                                  await widget.tourReff!
                                                      .update({
                                                    ...createToursRecordData(
                                                      totalTastingFeePp: functions
                                                          .deductFromTotalTastingFeePP(
                                                              containerToursRecord
                                                                  .totalTastingFeePp,
                                                              columnSelectedVenuesRecord),
                                                      pricePp: functions
                                                          .getPerPersonFeeAsIntRemoveVenue(
                                                              containerToursRecord
                                                                  .platformTastingFee,
                                                              containerToursRecord
                                                                  .pricePp,
                                                              columnSelectedVenuesRecord
                                                                  .tastingFee)
                                                          .toDouble(),
                                                      subTotal: functions.getTourSubTotal(
                                                          containerToursRecord
                                                              .passengers,
                                                          functions
                                                              .getPerPersonFeeAsIntRemoveVenue(
                                                                  containerToursRecord
                                                                      .platformTastingFee,
                                                                  containerToursRecord
                                                                      .pricePp,
                                                                  columnSelectedVenuesRecord
                                                                      .tastingFee)
                                                              .toDouble()),
                                                    ),
                                                    'venues':
                                                        FieldValue.arrayRemove([
                                                      widget.venueDoc?.reference
                                                    ]),
                                                  });
                                                  Navigator.pop(context);
                                                  await widget
                                                      .selectedVenueReff!
                                                      .delete();
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 300.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
