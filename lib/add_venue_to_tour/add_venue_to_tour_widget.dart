import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddVenueToTourWidget extends StatefulWidget {
  const AddVenueToTourWidget({
    Key? key,
    this.tourID,
    this.tourName,
    this.regionID,
    this.makeLunchStopBool,
    this.venueCount,
    this.tourDate,
    this.tourRecord,
  }) : super(key: key);

  final DocumentReference? tourID;
  final String? tourName;
  final String? regionID;
  final bool? makeLunchStopBool;
  final int? venueCount;
  final DateTime? tourDate;
  final ToursRecord? tourRecord;

  @override
  _AddVenueToTourWidgetState createState() => _AddVenueToTourWidgetState();
}

class _AddVenueToTourWidgetState extends State<AddVenueToTourWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SelectedVenuesRecord>>(
      stream: querySelectedVenuesRecord(
        queryBuilder: (selectedVenuesRecord) =>
            selectedVenuesRecord.where('tourRef', isEqualTo: widget.tourID),
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
        List<SelectedVenuesRecord> addVenueToTourSelectedVenuesRecordList =
            snapshot.data!;
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
                          context.pop();
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          widget.tourName!,
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
                        StreamBuilder<List<SelectedVenuesRecord>>(
                          stream: querySelectedVenuesRecord(
                            queryBuilder: (selectedVenuesRecord) =>
                                selectedVenuesRecord.where('tourRef',
                                    isEqualTo: widget.tourID),
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
                                textSelectedVenuesRecordList = snapshot.data!;
                            return Text(
                              'Tap to ADD venue',
                              style: FlutterFlowTheme.of(context).subtitle1,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Text(
                            'Tour Date:',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Text(
                          dateTimeFormat('MMMEd', widget.tourRecord!.tourDate!),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Text(
                            'Venues count:',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Text(
                          widget.venueCount!.toString(),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: StreamBuilder<List<VenuesRecord>>(
                        stream: queryVenuesRecord(
                          queryBuilder: (venuesRecord) => venuesRecord
                              .where('regionID', isEqualTo: widget.regionID),
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
                          List<VenuesRecord> gridViewVenuesRecordList =
                              snapshot.data!;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewVenuesRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewVenuesRecord =
                                  gridViewVenuesRecordList[gridViewIndex];
                              return Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          'CreateNewTour2',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 150),
                                            ),
                                          },
                                        );
                                      },
                                      text: gridViewVenuesRecord!.name!,
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 300,
                                        color: Color(0x003474E0),
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
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(28),
                                      child: Image.network(
                                        gridViewVenuesRecord!.image!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    decoration: BoxDecoration(
                                      color: Color(0x6C000000),
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      gridViewVenuesRecord!.name!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .cultured,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  if (!(functions.isVenueAlreadyAdded(
                                          addVenueToTourSelectedVenuesRecordList
                                              .toList(),
                                          gridViewVenuesRecord!.reference)) ??
                                      true)
                                    InkWell(
                                      onTap: () async {
                                        if ((widget.venueCount!) >= 4) {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title:
                                                    Text('Max Venues Reached'),
                                                content: Text(
                                                    'you reached the max number of venues that can be added to your itinerary'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                        if ((widget.venueCount!) < 4) {
                                          final toursUpdateData = {
                                            'venues': FieldValue.arrayUnion([
                                              gridViewVenuesRecord!.reference
                                            ]),
                                          };
                                          await widget.tourID!
                                              .update(toursUpdateData);
                                        } else {
                                          return;
                                        }

                                        final selectedVenuesCreateData =
                                            createSelectedVenuesRecordData(
                                          venueRef:
                                              gridViewVenuesRecord!.reference,
                                          addedByUid: currentUserReference,
                                          isLunchVenue:
                                              widget.makeLunchStopBool,
                                          tourRef: widget.tourID,
                                          addedDate: getCurrentTimestamp,
                                          tastingFee:
                                              gridViewVenuesRecord!.tastingFee,
                                        );
                                        await SelectedVenuesRecord.collection
                                            .doc()
                                            .set(selectedVenuesCreateData);
                                        context.pop();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        decoration: BoxDecoration(
                                          color: Color(0x00333333),
                                          borderRadius:
                                              BorderRadius.circular(28),
                                        ),
                                      ),
                                    ),
                                  if (functions.isVenueAlreadyAdded(
                                          addVenueToTourSelectedVenuesRecordList
                                              .toList(),
                                          gridViewVenuesRecord!.reference) ??
                                      true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.9, -0.9),
                                      child: Icon(
                                        Icons.check_circle_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .cultured,
                                        size: 28,
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0.55),
                                    child: Text(
                                      'Hello World',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .cultured,
                                          ),
                                    ),
                                  ),
                                  if (functions.meetsVenueCapacity(
                                          widget.tourRecord,
                                          gridViewVenuesRecord!.capacity) ??
                                      true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.95, -0.85),
                                      child: Text(
                                        'Meets Capacity',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .cultured,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                ],
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
