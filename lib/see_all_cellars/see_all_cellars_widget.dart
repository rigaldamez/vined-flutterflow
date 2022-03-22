import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SeeAllCellarsWidget extends StatefulWidget {
  const SeeAllCellarsWidget({
    Key key,
    this.regionName,
  }) : super(key: key);

  final String regionName;

  @override
  _SeeAllCellarsWidgetState createState() => _SeeAllCellarsWidgetState();
}

class _SeeAllCellarsWidgetState extends State<SeeAllCellarsWidget> {
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
          padding: EdgeInsetsDirectional.fromSTEB(12, 20, 12, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Text(
                      widget.regionName,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<List<VenuesRecord>>(
                  stream: queryVenuesRecord(
                    queryBuilder: (venuesRecord) => venuesRecord
                        .where('regionName', isEqualTo: widget.regionName),
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
                    List<VenuesRecord> listViewVenuesRecordList = snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewVenuesRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewVenuesRecord =
                            listViewVenuesRecordList[listViewIndex];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(34),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(34),
                                        child: Image.network(
                                          listViewVenuesRecord.image,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.24,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14, 10, 0, 0),
                                child: Text(
                                  listViewVenuesRecord.name,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
