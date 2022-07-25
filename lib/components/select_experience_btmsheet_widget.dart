import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  SelectedVenuesRecord? lastSelectedVenue2;
  SelectedVenuesRecord? lastSelectedVenue;
  SelectedVenuesRecord? lastSelectedVenue3;

  @override
  Widget build(BuildContext context) {
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
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).purplePastel,
              ),
            ),
          );
        }
        List<SelectedVenuesRecord> containerSelectedVenuesRecordList =
            snapshot.data!;
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Choose your tasting experience',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<TastingExperiencesRecord>>(
                      stream: queryTastingExperiencesRecord(
                        parent: widget.venueRec!.reference,
                        queryBuilder: (tastingExperiencesRecord) =>
                            tastingExperiencesRecord
                                .orderBy('tasting_experience_price'),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).purplePastel,
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
                                borderRadius: BorderRadius.circular(24),
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
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .purplePastel,
                                              ),
                                            ),
                                          );
                                        }
                                        List<AppConfigRecord>
                                            containerAppConfigRecordList =
                                            snapshot.data!;
                                        final containerAppConfigRecord =
                                            containerAppConfigRecordList.first;
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.94,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 10),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                    child: Image.network(
                                                      functions.setImagePath(
                                                          listViewTastingExperiencesRecord!
                                                              .image,
                                                          widget
                                                              .venueRec!.image),
                                                      width: 100,
                                                      height: double.infinity,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 0, 0),
                                                  child: Container(
                                                    width: 180,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1, 0),
                                                    child: Text(
                                                      listViewTastingExperiencesRecord!
                                                          .description!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
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
                                      onTap: () async {
                                        if (functions.isLunchVenue(
                                            widget.venueRec!.reference,
                                            FFAppState().lunchVenueReff)) {
                                          final selectedVenuesCreateData =
                                              createSelectedVenuesRecordData(
                                            venueRef:
                                                widget.venueRec!.reference,
                                            tourRef: widget.tourReff,
                                            addedByUid: currentUserReference,
                                            isLunchVenue:
                                                functions.isLunchVenue(
                                                    widget.venueRec!.reference,
                                                    FFAppState()
                                                        .lunchVenueReff),
                                            tastingFee:
                                                listViewTastingExperiencesRecord!
                                                    .tastingExperiencePrice,
                                            addedDate: getCurrentTimestamp,
                                            bookingReference: '',
                                            regionID: widget.regionReff,
                                            reservationTime:
                                                functions.epochTime(),
                                            isLunchVenueOnly: widget
                                                .venueRec!.isLunchVenueOnly,
                                            tastingExperienceDescription:
                                                listViewTastingExperiencesRecord!
                                                    .description,
                                            isTastingIncluded: true,
                                          );
                                          var selectedVenuesRecordReference =
                                              SelectedVenuesRecord.collection
                                                  .doc();
                                          await selectedVenuesRecordReference
                                              .set(selectedVenuesCreateData);
                                          lastSelectedVenue = SelectedVenuesRecord
                                              .getDocumentFromData(
                                                  selectedVenuesCreateData,
                                                  selectedVenuesRecordReference);

                                          final toursUpdateData = {
                                            ...createToursRecordData(
                                              totalTastingFeePp: functions
                                                  .addtoTotalTastingFeePP(
                                                      widget.tourDoc!
                                                          .totalTastingFeePp,
                                                      listViewTastingExperiencesRecord!
                                                          .tastingExperiencePrice),
                                              pricePp: functions
                                                  .getPerPersonFeeAsInt2(
                                                      widget.tourDoc!
                                                          .transportFeePp,
                                                      containerSelectedVenuesRecordList
                                                          .toList(),
                                                      widget.tourDoc!
                                                          .platformTastingFee,
                                                      lastSelectedVenue)
                                                  ?.toDouble(),
                                              subTotal: functions.getTourSubTotal(
                                                  widget.tourDoc!.passengers,
                                                  functions
                                                      .getPerPersonFeeAsInt2(
                                                          widget.tourDoc!
                                                              .transportFeePp,
                                                          containerSelectedVenuesRecordList
                                                              .toList(),
                                                          widget.tourDoc!
                                                              .platformTastingFee,
                                                          lastSelectedVenue)
                                                      ?.toDouble()),
                                            ),
                                            'venues': FieldValue.arrayUnion(
                                                [widget.venueRec!.reference]),
                                          };
                                          await widget.tourReff!
                                              .update(toursUpdateData);
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
                                                  fontSize: 12,
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
                                              .largeGroupEarlySeatingOnly!) {
                                            final selectedVenuesCreateData =
                                                createSelectedVenuesRecordData(
                                              venueRef:
                                                  widget.venueRec!.reference,
                                              tourRef: widget.tourReff,
                                              addedByUid: currentUserReference,
                                              isLunchVenue:
                                                  functions.isLunchVenue(
                                                      widget
                                                          .venueRec!.reference,
                                                      FFAppState()
                                                          .lunchVenueReff),
                                              tastingFee:
                                                  listViewTastingExperiencesRecord!
                                                      .tastingExperiencePrice,
                                              addedDate: getCurrentTimestamp,
                                              bookingReference: '',
                                              regionID: widget.regionReff,
                                              reservationTime:
                                                  functions.epochTime(),
                                              isLargeGroupEarlySeatingOnlyVenue:
                                                  true,
                                              tastingExperienceDescription:
                                                  listViewTastingExperiencesRecord!
                                                      .description,
                                              isTastingIncluded: true,
                                            );
                                            var selectedVenuesRecordReference =
                                                SelectedVenuesRecord.collection
                                                    .doc();
                                            await selectedVenuesRecordReference
                                                .set(selectedVenuesCreateData);
                                            lastSelectedVenue2 = SelectedVenuesRecord
                                                .getDocumentFromData(
                                                    selectedVenuesCreateData,
                                                    selectedVenuesRecordReference);

                                            final toursUpdateData = {
                                              ...createToursRecordData(
                                                totalTastingFeePp: functions
                                                    .addtoTotalTastingFeePP(
                                                        widget.tourDoc!
                                                            .totalTastingFeePp,
                                                        listViewTastingExperiencesRecord!
                                                            .tastingExperiencePrice),
                                                pricePp: functions
                                                    .getPerPersonFeeAsInt2(
                                                        widget.tourDoc!
                                                            .transportFeePp,
                                                        containerSelectedVenuesRecordList
                                                            .toList(),
                                                        widget.tourDoc!
                                                            .platformTastingFee,
                                                        lastSelectedVenue2)
                                                    ?.toDouble(),
                                                subTotal: functions.getTourSubTotal(
                                                    widget.tourDoc!.passengers,
                                                    functions
                                                        .getPerPersonFeeAsInt2(
                                                            widget.tourDoc!
                                                                .transportFeePp,
                                                            containerSelectedVenuesRecordList
                                                                .toList(),
                                                            widget.tourDoc!
                                                                .platformTastingFee,
                                                            lastSelectedVenue2)
                                                        ?.toDouble()),
                                              ),
                                              'venues': FieldValue.arrayUnion(
                                                  [widget.venueRec!.reference]),
                                              'large_group_venue_early_seating_count':
                                                  FieldValue.increment(1),
                                            };
                                            await widget.tourReff!
                                                .update(toursUpdateData);
                                            context.pop();
                                          } else {
                                            final selectedVenuesCreateData =
                                                createSelectedVenuesRecordData(
                                              venueRef:
                                                  widget.venueRec!.reference,
                                              tourRef: widget.tourReff,
                                              addedByUid: currentUserReference,
                                              isLunchVenue:
                                                  functions.isLunchVenue(
                                                      widget
                                                          .venueRec!.reference,
                                                      FFAppState()
                                                          .lunchVenueReff),
                                              tastingFee:
                                                  listViewTastingExperiencesRecord!
                                                      .tastingExperiencePrice,
                                              addedDate: getCurrentTimestamp,
                                              bookingReference: '',
                                              regionID: widget.regionReff,
                                              reservationTime:
                                                  functions.epochTime(),
                                              isLargeGroupEarlySeatingOnlyVenue:
                                                  false,
                                              tastingExperienceDescription:
                                                  listViewTastingExperiencesRecord!
                                                      .description,
                                              isTastingIncluded: true,
                                            );
                                            var selectedVenuesRecordReference =
                                                SelectedVenuesRecord.collection
                                                    .doc();
                                            await selectedVenuesRecordReference
                                                .set(selectedVenuesCreateData);
                                            lastSelectedVenue3 = SelectedVenuesRecord
                                                .getDocumentFromData(
                                                    selectedVenuesCreateData,
                                                    selectedVenuesRecordReference);

                                            final toursUpdateData = {
                                              ...createToursRecordData(
                                                totalTastingFeePp: functions
                                                    .addtoTotalTastingFeePP(
                                                        widget.tourDoc!
                                                            .totalTastingFeePp,
                                                        listViewTastingExperiencesRecord!
                                                            .tastingExperiencePrice),
                                                pricePp: functions
                                                    .getPerPersonFeeAsInt2(
                                                        widget.tourDoc!
                                                            .transportFeePp,
                                                        containerSelectedVenuesRecordList
                                                            .toList(),
                                                        widget.tourDoc!
                                                            .platformTastingFee,
                                                        lastSelectedVenue3)
                                                    ?.toDouble(),
                                                subTotal: functions.getTourSubTotal(
                                                    widget.tourDoc!.passengers,
                                                    functions
                                                        .getPerPersonFeeAsInt2(
                                                            widget.tourDoc!
                                                                .transportFeePp,
                                                            containerSelectedVenuesRecordList
                                                                .toList(),
                                                            widget.tourDoc!
                                                                .platformTastingFee,
                                                            lastSelectedVenue3)
                                                        ?.toDouble()),
                                              ),
                                              'venues': FieldValue.arrayUnion(
                                                  [widget.venueRec!.reference]),
                                            };
                                            await widget.tourReff!
                                                .update(toursUpdateData);
                                            context.pop();
                                          }
                                        }

                                        setState(() {});
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
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
              ],
            ),
          ),
        );
      },
    );
  }
}
