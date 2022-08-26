import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

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
  DateTime? datePicked;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ToursRecord>(
      stream: ToursRecord.getDocument(widget.tourReff!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).purplePastel,
              ),
            ),
          );
        }
        final containerToursRecord = snapshot.data!;
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3B1D2429),
                offset: Offset(0, -3),
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: 6,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .purplePastel,
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
                                      0, 6, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(24),
                                        child: Image.network(
                                          widget.venueDoc!.image!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 230,
                                            height: 100,
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: AutoSizeText(
                                                functions.upperCaseString(
                                                    widget.venueDoc!.name),
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 16,
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
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0x00EEEEEE),
                                        borderRadius: BorderRadius.circular(20),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0x19333333),
                                          width: 1,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                if (!columnSelectedVenuesRecord
                                                    .isLunchVenueOnly!)
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
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 190,
                                                          height: 70,
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
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
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
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          10,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.check_box_rounded,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ],
                                                  ),
                                                if (columnSelectedVenuesRecord
                                                        .isLunchVenueOnly ??
                                                    true)
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
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    0, 0),
                                                        child: Container(
                                                          width: 190,
                                                          height: 70,
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
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          12,
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
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          10,
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
                                                        size: 24,
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
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Color(0x00EEEEEE),
                                        borderRadius: BorderRadius.circular(20),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0x19333333),
                                          width: 1,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
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
                                                  size: 24,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16, 0, 0, 0),
                                                  child: Container(
                                                    width: 190,
                                                    height: 70,
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
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12,
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
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 10,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                ToggleIcon(
                                                  onPressed: () async {
                                                    final selectedVenuesUpdateData =
                                                        {
                                                      'is_lunch_venue':
                                                          !columnSelectedVenuesRecord
                                                              .isLunchVenue!,
                                                    };
                                                    await columnSelectedVenuesRecord
                                                        .reference
                                                        .update(
                                                            selectedVenuesUpdateData);
                                                  },
                                                  value:
                                                      columnSelectedVenuesRecord
                                                          .isLunchVenue!,
                                                  onIcon: Icon(
                                                    Icons.check_box,
                                                    color: Colors.black,
                                                    size: 25,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons
                                                        .check_box_outline_blank,
                                                    color: Colors.black,
                                                    size: 25,
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
                                      MediaQuery.of(context).size.width * 0.98,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Color(0x1A000000),
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 30, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.access_time_rounded,
                                          color: Colors.black,
                                          size: 24,
                                        ),
                                        Container(
                                          width: 190,
                                          height: 100,
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
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Text(
                                                'Contact venue to make a reservation ',
                                                maxLines: 3,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 10,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 34,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .black,
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .cultured,
                                            size: 16,
                                          ),
                                          onPressed: () async {
                                            await DatePicker.showTimePicker(
                                              context,
                                              showTitleActions: true,
                                              onConfirm: (date) {
                                                setState(
                                                    () => datePicked = date);
                                              },
                                              currentTime: functions
                                                  .getTodayTimestampZeroMinutes(),
                                            );

                                            final selectedVenuesUpdateData =
                                                createSelectedVenuesRecordData(
                                              reservationTime: functions
                                                  .getBookingReservationTime(
                                                      containerToursRecord
                                                          .tourDate,
                                                      datePicked),
                                            );
                                            await widget.selectedVenueReff!
                                                .update(
                                                    selectedVenuesUpdateData);
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
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .purplePastel,
                                          ),
                                        ),
                                      );
                                    }
                                    List<SelectedVenuesRecord>
                                        containerSelectedVenuesRecordList =
                                        snapshot.data!;
                                    return Container(
                                      width: 300,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: Stack(
                                        alignment: AlignmentDirectional(0, 0),
                                        children: [
                                          Text(
                                            'Remove venue',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              if (columnSelectedVenuesRecord
                                                  .isLunchVenue!) {
                                                final toursUpdateData = {
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
                                                    widget.venueDoc!.reference
                                                  ]),
                                                };
                                                await widget.tourReff!
                                                    .update(toursUpdateData);
                                                setState(() => FFAppState()
                                                    .lunchVenueReff = null);
                                                Navigator.pop(context);
                                                await widget.selectedVenueReff!
                                                    .delete();
                                              } else {
                                                if (columnSelectedVenuesRecord
                                                    .isLargeGroupEarlySeatingOnlyVenue!) {
                                                  final toursUpdateData = {
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
                                                      widget.venueDoc!.reference
                                                    ]),
                                                    'large_group_venue_early_seating_count':
                                                        FieldValue.increment(
                                                            -(1)),
                                                  };
                                                  await widget.tourReff!
                                                      .update(toursUpdateData);
                                                  Navigator.pop(context);
                                                  await widget
                                                      .selectedVenueReff!
                                                      .delete();
                                                } else {
                                                  final toursUpdateData = {
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
                                                      widget.venueDoc!.reference
                                                    ]),
                                                  };
                                                  await widget.tourReff!
                                                      .update(toursUpdateData);
                                                  Navigator.pop(context);
                                                  await widget
                                                      .selectedVenueReff!
                                                      .delete();
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: 300,
                                              height: 40,
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
