import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_tour_passengers_model.dart';
export 'edit_tour_passengers_model.dart';

class EditTourPassengersWidget extends StatefulWidget {
  const EditTourPassengersWidget({
    Key? key,
    this.tourID,
    this.tourName,
  }) : super(key: key);

  final DocumentReference? tourID;
  final String? tourName;

  @override
  _EditTourPassengersWidgetState createState() =>
      _EditTourPassengersWidgetState();
}

class _EditTourPassengersWidgetState extends State<EditTourPassengersWidget> {
  late EditTourPassengersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTourPassengersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: StreamBuilder<ToursRecord>(
        stream: ToursRecord.getDocument(widget.tourID!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  color: Color(0xFFB19CD9),
                ),
              ),
            );
          }
          final containerToursRecord = snapshot.data!;
          return Container(
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
                      Text(
                        'Hello World',
                        style: FlutterFlowTheme.of(context).titleMedium,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'No. of Passengers',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: StreamBuilder<List<TransportPricingRecord>>(
                        stream: queryTransportPricingRecord(
                          queryBuilder: (transportPricingRecord) =>
                              transportPricingRecord.orderBy('passengersLbl'),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  color: Color(0xFFB19CD9),
                                ),
                              ),
                            );
                          }
                          List<TransportPricingRecord>
                              gridViewTransportPricingRecordList =
                              snapshot.data!;
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount:
                                gridViewTransportPricingRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewTransportPricingRecord =
                                  gridViewTransportPricingRecordList[
                                      gridViewIndex];
                              return Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            gridViewTransportPricingRecord
                                                .passengersLbl
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFFF4F4F4),
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14,
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFEEEEEE),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 2.0, 0.0, 0.0),
                                                child: AutoSizeText(
                                                  formatNumber(
                                                    gridViewTransportPricingRecord
                                                        .price,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: '\$',
                                                    format: '',
                                                    locale: '',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Container(
                                      width: 28.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        border: Border.all(
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.people,
                                        color:
                                            FlutterFlowTheme.of(context).black,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await widget.tourID!
                                          .update(createToursRecordData(
                                        passengers:
                                            gridViewTransportPricingRecord
                                                .passengersLbl,
                                        transportFeePp:
                                            gridViewTransportPricingRecord
                                                .price,
                                        pricePp:
                                            functions
                                                .updatePassengersCalculatePricePP(
                                                    gridViewTransportPricingRecord
                                                        .price,
                                                    containerToursRecord
                                                        .totalTastingFeePp
                                                        .toDouble(),
                                                    containerToursRecord
                                                        .platformTastingFee,
                                                    containerToursRecord
                                                        .venues.length),
                                        subTotal: functions.getTourSubTotal(
                                            gridViewTransportPricingRecord
                                                .passengersLbl,
                                            functions
                                                .updatePassengersCalculatePricePP(
                                                    gridViewTransportPricingRecord
                                                        .price,
                                                    containerToursRecord
                                                        .totalTastingFeePp
                                                        .toDouble(),
                                                    containerToursRecord
                                                        .platformTastingFee,
                                                    containerToursRecord
                                                        .venues.length)),
                                      ));
                                      context.pop();
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(28.0),
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
          );
        },
      ),
    );
  }
}
