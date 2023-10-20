import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_venue_to_tour_model.dart';
export 'add_venue_to_tour_model.dart';

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
  late AddVenueToTourModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddVenueToTourModel());

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

    return StreamBuilder<List<SelectedVenuesRecord>>(
      stream: querySelectedVenuesRecord(
        queryBuilder: (selectedVenuesRecord) => selectedVenuesRecord.where(
          'tourRef',
          isEqualTo: widget.tourID,
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
        List<SelectedVenuesRecord> addVenueToTourSelectedVenuesRecordList =
            snapshot.data!;
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
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          widget.tourName!,
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<SelectedVenuesRecord>>(
                          stream: querySelectedVenuesRecord(
                            queryBuilder: (selectedVenuesRecord) =>
                                selectedVenuesRecord.where(
                              'tourRef',
                              isEqualTo: widget.tourID,
                            ),
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
                            List<SelectedVenuesRecord>
                                textSelectedVenuesRecordList = snapshot.data!;
                            return Text(
                              'Tap to ADD venue',
                              style: FlutterFlowTheme.of(context).titleMedium,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Text(
                            'Tour Date:',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Text(
                          dateTimeFormat('MMMEd', widget.tourRecord!.tourDate!),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Text(
                            'Venues count:',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        Text(
                          widget.venueCount!.toString(),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: StreamBuilder<List<VenuesRecord>>(
                        stream: queryVenuesRecord(
                          queryBuilder: (venuesRecord) => venuesRecord.where(
                            'regionID',
                            isEqualTo: widget.regionID,
                          ),
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
                          List<VenuesRecord> gridViewVenuesRecordList =
                              snapshot.data!;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: gridViewVenuesRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewVenuesRecord =
                                  gridViewVenuesRecordList[gridViewIndex];
                              return Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
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
                                      text: gridViewVenuesRecord.name,
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 300.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0x003474E0),
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
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(28.0),
                                      child: Image.network(
                                        gridViewVenuesRecord.image,
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x6C000000),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      gridViewVenuesRecord.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .cultured,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  if (!functions.isVenueAlreadyAdded(
                                      addVenueToTourSelectedVenuesRecordList
                                          .toList(),
                                      gridViewVenuesRecord.reference))
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (widget.venueCount! >= 4) {
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
                                        if (widget.venueCount! < 4) {
                                          await widget.tourID!.update({
                                            ...mapToFirestore(
                                              {
                                                'venues':
                                                    FieldValue.arrayUnion([
                                                  gridViewVenuesRecord.reference
                                                ]),
                                              },
                                            ),
                                          });
                                        } else {
                                          return;
                                        }

                                        await SelectedVenuesRecord.collection
                                            .doc()
                                            .set(createSelectedVenuesRecordData(
                                              venueRef: gridViewVenuesRecord
                                                  .reference,
                                              addedByUid: currentUserReference,
                                              isLunchVenue:
                                                  widget.makeLunchStopBool,
                                              tourRef: widget.tourID,
                                              addedDate: getCurrentTimestamp,
                                              tastingFee: gridViewVenuesRecord
                                                  .tastingFee,
                                            ));
                                        context.pop();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00333333),
                                          borderRadius:
                                              BorderRadius.circular(28.0),
                                        ),
                                      ),
                                    ),
                                  if (functions.isVenueAlreadyAdded(
                                      addVenueToTourSelectedVenuesRecordList
                                          .toList(),
                                      gridViewVenuesRecord.reference))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.90, -0.90),
                                      child: Icon(
                                        Icons.check_circle_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .cultured,
                                        size: 28.0,
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.55),
                                    child: Text(
                                      'Hello World',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .cultured,
                                          ),
                                    ),
                                  ),
                                  if (functions.meetsVenueCapacity(
                                      widget.tourRecord,
                                      gridViewVenuesRecord.capacity))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-0.95, -0.85),
                                      child: Text(
                                        'Meets Capacity',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
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
