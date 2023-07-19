import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_experience_btmsheet_model.dart';
export 'select_experience_btmsheet_model.dart';

class SelectExperienceBtmsheetWidget extends StatefulWidget {
  const SelectExperienceBtmsheetWidget({
    Key? key,
    this.venueRec,
    this.tourReff,
    this.regionReff,
    this.tourDoc,
    this.isLargeGroupEarlySeatingOnlyVenue,
  }) : super(key: key);

  final VenuesRecord? venueRec;
  final DocumentReference? tourReff;
  final DocumentReference? regionReff;
  final ToursRecord? tourDoc;
  final bool? isLargeGroupEarlySeatingOnlyVenue;

  @override
  _SelectExperienceBtmsheetWidgetState createState() =>
      _SelectExperienceBtmsheetWidgetState();
}

class _SelectExperienceBtmsheetWidgetState
    extends State<SelectExperienceBtmsheetWidget> {
  late SelectExperienceBtmsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectExperienceBtmsheetModel());

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

    return FutureBuilder<List<SelectedVenuesRecord>>(
      future: querySelectedVenuesRecordOnce(
        queryBuilder: (selectedVenuesRecord) =>
            selectedVenuesRecord.where('tourRef', isEqualTo: widget.tourReff),
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
        List<SelectedVenuesRecord> containerSelectedVenuesRecordList =
            snapshot.data!;
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Choose your experience',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 120.0,
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<TastingExperiencesRecord>>(
                      stream: queryTastingExperiencesRecord(
                        parent: widget.venueRec?.reference,
                        queryBuilder: (tastingExperiencesRecord) =>
                            tastingExperiencesRecord
                                .orderBy('tasting_experience_price'),
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
                        List<TastingExperiencesRecord>
                            listViewTastingExperiencesRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              listViewTastingExperiencesRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewTastingExperiencesRecord =
                                listViewTastingExperiencesRecordList[
                                    listViewIndex];
                            return Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Container(
                                height: double.infinity,
                                child: Stack(
                                  children: [
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xFFB19CD9),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<AppConfigRecord>
                                            containerAppConfigRecordList =
                                            snapshot.data!;
                                        final containerAppConfigRecord =
                                            containerAppConfigRecordList
                                                    .isNotEmpty
                                                ? containerAppConfigRecordList
                                                    .first
                                                : null;
                                        return Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.94,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18.0),
                                                    child: Image.network(
                                                      functions.setImagePath(
                                                          listViewTastingExperiencesRecord
                                                              .image,
                                                          widget
                                                              .venueRec?.image),
                                                      width: 100.0,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 180.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      listViewTastingExperiencesRecord
                                                          .description,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (widget.venueRec!.isLunchVenueOnly) {
                                          var selectedVenuesRecordReference1 =
                                              SelectedVenuesRecord.collection
                                                  .doc();
                                          await selectedVenuesRecordReference1
                                              .set({
                                            ...createSelectedVenuesRecordData(
                                              venueRef:
                                                  widget.venueRec?.reference,
                                              tourRef: widget.tourReff,
                                              addedByUid: currentUserReference,
                                              isLunchVenue: true,
                                              tastingFee:
                                                  listViewTastingExperiencesRecord
                                                      .tastingExperiencePrice,
                                              addedDate: getCurrentTimestamp,
                                              bookingReference: '',
                                              regionID: widget.regionReff,
                                              reservationTime:
                                                  functions.epochTime(),
                                              isLunchVenueOnly: widget
                                                  .venueRec?.isLunchVenueOnly,
                                              tastingExperienceDescription:
                                                  listViewTastingExperiencesRecord
                                                      .description,
                                              isTastingIncluded: false,
                                              capacity:
                                                  widget.venueRec?.capacity,
                                            ),
                                            'openDays':
                                                widget.venueRec?.openDays,
                                          });
                                          _model.lastVenueAdded =
                                              SelectedVenuesRecord
                                                  .getDocumentFromData({
                                            ...createSelectedVenuesRecordData(
                                              venueRef:
                                                  widget.venueRec?.reference,
                                              tourRef: widget.tourReff,
                                              addedByUid: currentUserReference,
                                              isLunchVenue: true,
                                              tastingFee:
                                                  listViewTastingExperiencesRecord
                                                      .tastingExperiencePrice,
                                              addedDate: getCurrentTimestamp,
                                              bookingReference: '',
                                              regionID: widget.regionReff,
                                              reservationTime:
                                                  functions.epochTime(),
                                              isLunchVenueOnly: widget
                                                  .venueRec?.isLunchVenueOnly,
                                              tastingExperienceDescription:
                                                  listViewTastingExperiencesRecord
                                                      .description,
                                              isTastingIncluded: false,
                                              capacity:
                                                  widget.venueRec?.capacity,
                                            ),
                                            'openDays':
                                                widget.venueRec?.openDays,
                                          }, selectedVenuesRecordReference1);

                                          await widget.tourReff!.update({
                                            ...createToursRecordData(
                                              totalTastingFeePp: functions
                                                  .addtoTotalTastingFeePP(
                                                      widget.tourDoc
                                                          ?.totalTastingFeePp,
                                                      listViewTastingExperiencesRecord
                                                          .tastingExperiencePrice),
                                              pricePp: functions
                                                  .getPerPersonFeeAsInt2(
                                                      widget.tourDoc
                                                          ?.transportFeePp,
                                                      containerSelectedVenuesRecordList
                                                          .toList(),
                                                      widget.tourDoc
                                                          ?.platformTastingFee,
                                                      _model.lastVenueAdded)
                                                  .toDouble(),
                                              subTotal: functions.getTourSubTotal(
                                                  widget.tourDoc?.passengers,
                                                  functions
                                                      .getPerPersonFeeAsInt2(
                                                          widget.tourDoc
                                                              ?.transportFeePp,
                                                          containerSelectedVenuesRecordList
                                                              .toList(),
                                                          widget.tourDoc
                                                              ?.platformTastingFee,
                                                          _model.lastVenueAdded)
                                                      .toDouble()),
                                            ),
                                            'venues': FieldValue.arrayUnion(
                                                [widget.venueRec?.reference]),
                                          });
                                          context.pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Contact venue to make a reservation. Cost at your own expense. Update itinerary with confirmed time.',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .cultured,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .black,
                                            ),
                                          );
                                        } else {
                                          if (widget.venueRec!
                                              .largeGroupEarlySeatingOnly) {
                                            var selectedVenuesRecordReference2 =
                                                SelectedVenuesRecord.collection
                                                    .doc();
                                            await selectedVenuesRecordReference2
                                                .set({
                                              ...createSelectedVenuesRecordData(
                                                venueRef:
                                                    widget.venueRec?.reference,
                                                tourRef: widget.tourReff,
                                                addedByUid:
                                                    currentUserReference,
                                                isLunchVenue:
                                                    functions.isLunchVenue(
                                                        widget.venueRec
                                                            ?.reference,
                                                        FFAppState()
                                                            .lunchVenueReff),
                                                tastingFee:
                                                    listViewTastingExperiencesRecord
                                                        .tastingExperiencePrice,
                                                addedDate: getCurrentTimestamp,
                                                bookingReference: '',
                                                regionID: widget.regionReff,
                                                reservationTime:
                                                    functions.epochTime(),
                                                isLargeGroupEarlySeatingOnlyVenue:
                                                    true,
                                                tastingExperienceDescription:
                                                    listViewTastingExperiencesRecord
                                                        .description,
                                                isTastingIncluded: true,
                                                isLunchVenueOnly: widget
                                                    .venueRec?.isLunchVenueOnly,
                                                capacity:
                                                    widget.venueRec?.capacity,
                                              ),
                                              'openDays':
                                                  widget.venueRec?.openDays,
                                            });
                                            _model.lastSelectedVenue2 =
                                                SelectedVenuesRecord
                                                    .getDocumentFromData({
                                              ...createSelectedVenuesRecordData(
                                                venueRef:
                                                    widget.venueRec?.reference,
                                                tourRef: widget.tourReff,
                                                addedByUid:
                                                    currentUserReference,
                                                isLunchVenue:
                                                    functions.isLunchVenue(
                                                        widget.venueRec
                                                            ?.reference,
                                                        FFAppState()
                                                            .lunchVenueReff),
                                                tastingFee:
                                                    listViewTastingExperiencesRecord
                                                        .tastingExperiencePrice,
                                                addedDate: getCurrentTimestamp,
                                                bookingReference: '',
                                                regionID: widget.regionReff,
                                                reservationTime:
                                                    functions.epochTime(),
                                                isLargeGroupEarlySeatingOnlyVenue:
                                                    true,
                                                tastingExperienceDescription:
                                                    listViewTastingExperiencesRecord
                                                        .description,
                                                isTastingIncluded: true,
                                                isLunchVenueOnly: widget
                                                    .venueRec?.isLunchVenueOnly,
                                                capacity:
                                                    widget.venueRec?.capacity,
                                              ),
                                              'openDays':
                                                  widget.venueRec?.openDays,
                                            }, selectedVenuesRecordReference2);

                                            await widget.tourReff!.update({
                                              ...createToursRecordData(
                                                totalTastingFeePp: functions
                                                    .addtoTotalTastingFeePP(
                                                        widget.tourDoc
                                                            ?.totalTastingFeePp,
                                                        listViewTastingExperiencesRecord
                                                            .tastingExperiencePrice),
                                                pricePp: functions
                                                    .getPerPersonFeeAsInt2(
                                                        widget.tourDoc
                                                            ?.transportFeePp,
                                                        containerSelectedVenuesRecordList
                                                            .toList(),
                                                        widget.tourDoc
                                                            ?.platformTastingFee,
                                                        _model
                                                            .lastSelectedVenue2)
                                                    .toDouble(),
                                                subTotal: functions.getTourSubTotal(
                                                    widget.tourDoc?.passengers,
                                                    functions
                                                        .getPerPersonFeeAsInt2(
                                                            widget.tourDoc
                                                                ?.transportFeePp,
                                                            containerSelectedVenuesRecordList
                                                                .toList(),
                                                            widget.tourDoc
                                                                ?.platformTastingFee,
                                                            _model
                                                                .lastSelectedVenue2)
                                                        .toDouble()),
                                              ),
                                              'venues': FieldValue.arrayUnion(
                                                  [widget.venueRec?.reference]),
                                              'large_group_venue_early_seating_count':
                                                  FieldValue.increment(1),
                                            });
                                            context.pop();
                                          } else {
                                            var selectedVenuesRecordReference3 =
                                                SelectedVenuesRecord.collection
                                                    .doc();
                                            await selectedVenuesRecordReference3
                                                .set({
                                              ...createSelectedVenuesRecordData(
                                                venueRef:
                                                    widget.venueRec?.reference,
                                                tourRef: widget.tourReff,
                                                addedByUid:
                                                    currentUserReference,
                                                isLunchVenue:
                                                    functions.isLunchVenue(
                                                        widget.venueRec
                                                            ?.reference,
                                                        FFAppState()
                                                            .lunchVenueReff),
                                                tastingFee:
                                                    listViewTastingExperiencesRecord
                                                        .tastingExperiencePrice,
                                                addedDate: getCurrentTimestamp,
                                                bookingReference: '',
                                                regionID: widget.regionReff,
                                                reservationTime:
                                                    functions.epochTime(),
                                                isLargeGroupEarlySeatingOnlyVenue:
                                                    false,
                                                tastingExperienceDescription:
                                                    listViewTastingExperiencesRecord
                                                        .description,
                                                isTastingIncluded: true,
                                                isLunchVenueOnly: widget
                                                    .venueRec?.isLunchVenueOnly,
                                                capacity:
                                                    widget.venueRec?.capacity,
                                              ),
                                              'openDays':
                                                  widget.venueRec?.openDays,
                                            });
                                            _model.lastSelectedVenue3 =
                                                SelectedVenuesRecord
                                                    .getDocumentFromData({
                                              ...createSelectedVenuesRecordData(
                                                venueRef:
                                                    widget.venueRec?.reference,
                                                tourRef: widget.tourReff,
                                                addedByUid:
                                                    currentUserReference,
                                                isLunchVenue:
                                                    functions.isLunchVenue(
                                                        widget.venueRec
                                                            ?.reference,
                                                        FFAppState()
                                                            .lunchVenueReff),
                                                tastingFee:
                                                    listViewTastingExperiencesRecord
                                                        .tastingExperiencePrice,
                                                addedDate: getCurrentTimestamp,
                                                bookingReference: '',
                                                regionID: widget.regionReff,
                                                reservationTime:
                                                    functions.epochTime(),
                                                isLargeGroupEarlySeatingOnlyVenue:
                                                    false,
                                                tastingExperienceDescription:
                                                    listViewTastingExperiencesRecord
                                                        .description,
                                                isTastingIncluded: true,
                                                isLunchVenueOnly: widget
                                                    .venueRec?.isLunchVenueOnly,
                                                capacity:
                                                    widget.venueRec?.capacity,
                                              ),
                                              'openDays':
                                                  widget.venueRec?.openDays,
                                            }, selectedVenuesRecordReference3);

                                            await widget.tourReff!.update({
                                              ...createToursRecordData(
                                                totalTastingFeePp: functions
                                                    .addtoTotalTastingFeePP(
                                                        widget.tourDoc
                                                            ?.totalTastingFeePp,
                                                        listViewTastingExperiencesRecord
                                                            .tastingExperiencePrice),
                                                pricePp: functions
                                                    .getPerPersonFeeAsInt2(
                                                        widget.tourDoc
                                                            ?.transportFeePp,
                                                        containerSelectedVenuesRecordList
                                                            .toList(),
                                                        widget.tourDoc
                                                            ?.platformTastingFee,
                                                        _model
                                                            .lastSelectedVenue3)
                                                    .toDouble(),
                                                subTotal: functions.getTourSubTotal(
                                                    widget.tourDoc?.passengers,
                                                    functions
                                                        .getPerPersonFeeAsInt2(
                                                            widget.tourDoc
                                                                ?.transportFeePp,
                                                            containerSelectedVenuesRecordList
                                                                .toList(),
                                                            widget.tourDoc
                                                                ?.platformTastingFee,
                                                            _model
                                                                .lastSelectedVenue3)
                                                        .toDouble()),
                                              ),
                                              'venues': FieldValue.arrayUnion(
                                                  [widget.venueRec?.reference]),
                                            });
                                            context.pop();
                                          }
                                        }

                                        setState(() {});
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.94,
                                        height: double.infinity,
                                        decoration: BoxDecoration(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      child: Stack(
                        children: [],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
