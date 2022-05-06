import '../backend/backend.dart';
import '../create_new_tour3/create_new_tour3_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewTour2Widget extends StatefulWidget {
  const CreateNewTour2Widget({
    Key key,
    this.state,
    this.regionIDRef,
  }) : super(key: key);

  final dynamic state;
  final DocumentReference regionIDRef;

  @override
  _CreateNewTour2WidgetState createState() => _CreateNewTour2WidgetState();
}

class _CreateNewTour2WidgetState extends State<CreateNewTour2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                      size: 26,
                    ),
                    onPressed: () async {
                      setState(() => FFAppState().newTourRegionID = '');
                      setState(() => FFAppState().newTourRegionName = '');
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    FFAppState().newTourName,
                    style: FlutterFlowTheme.of(context).subtitle1,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'No. of Passengers',
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Poppins',
                              fontSize: 22,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
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
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).purplePastel,
                            ),
                          ),
                        );
                      }
                      List<TransportPricingRecord>
                          gridViewTransportPricingRecordList = snapshot.data;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewTransportPricingRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewTransportPricingRecord =
                              gridViewTransportPricingRecordList[gridViewIndex];
                          return Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        gridViewTransportPricingRecord
                                            .passengersLbl
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFFF4F4F4),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.16,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 2, 0, 0),
                                            child: AutoSizeText(
                                              functions.fortmatCurrency(
                                                  gridViewTransportPricingRecord
                                                      .price,
                                                  '\$'),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                        fontSize: 12,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      width: 2,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.people,
                                    color: FlutterFlowTheme.of(context).black,
                                    size: 16,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  setState(() =>
                                      FFAppState().newTourNoOfPassengers =
                                          gridViewTransportPricingRecord
                                              .passengersLbl);
                                  setState(() => FFAppState().newTourPricePP =
                                      gridViewTransportPricingRecord.price);
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 150),
                                      reverseDuration:
                                          Duration(milliseconds: 150),
                                      child: CreateNewTour3Widget(
                                        regionIDRef: widget.regionIDRef,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
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
  }
}
