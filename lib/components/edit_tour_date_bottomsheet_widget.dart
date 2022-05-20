import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class EditTourDateBottomsheetWidget extends StatefulWidget {
  const EditTourDateBottomsheetWidget({
    Key key,
    this.tourID,
  }) : super(key: key);

  final DocumentReference tourID;

  @override
  _EditTourDateBottomsheetWidgetState createState() =>
      _EditTourDateBottomsheetWidgetState();
}

class _EditTourDateBottomsheetWidgetState
    extends State<EditTourDateBottomsheetWidget> {
  DateTime datePicked;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ToursRecord>(
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
        final containerToursRecord = snapshot.data;
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
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Text(
                                    'Tour Date',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                  borderRadius: BorderRadius.circular(18),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Color(0x19000000),
                                  ),
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.calendar_today_rounded,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                      Text(
                                        dateTimeFormat('MMMMEEEEd', datePicked),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        dateTimeFormat('jm', datePicked),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.94,
                              child: Stack(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 58,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(34),
                                    ),
                                    alignment: AlignmentDirectional(0, 0),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .purplePastel,
                                                size: 20,
                                              ),
                                            ),
                                          );
                                        }
                                        List<AppConfigRecord>
                                            buttonAppConfigRecordList =
                                            snapshot.data;
                                        final buttonAppConfigRecord =
                                            buttonAppConfigRecordList.isNotEmpty
                                                ? buttonAppConfigRecordList
                                                    .first
                                                : null;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            await DatePicker.showDateTimePicker(
                                              context,
                                              showTitleActions: true,
                                              onConfirm: (date) {
                                                setState(
                                                    () => datePicked = date);
                                              },
                                              currentTime: functions
                                                  .getCurrentDateTimePlusAweek(
                                                      getCurrentTimestamp,
                                                      buttonAppConfigRecord
                                                          .tourLeadTime,
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.tourLeadTimeExempted,
                                                          false)),
                                              minTime:
                                                  functions.getCurrentDateTimePlusAweek(
                                                      getCurrentTimestamp,
                                                      buttonAppConfigRecord
                                                          .tourLeadTime,
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.tourLeadTimeExempted,
                                                          false)),
                                            );
                                          },
                                          text: 'Select New Date',
                                          options: FFButtonOptions(
                                            width: 390,
                                            height: 58,
                                            color: Colors.white,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black,
                                              width: 1,
                                            ),
                                            borderRadius: 34,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final toursUpdateData = createToursRecordData(
                                  tourDate: datePicked,
                                );
                                await widget.tourID.update(toursUpdateData);
                                Navigator.pop(context);
                              },
                              text: 'Save',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60,
                                color: FlutterFlowTheme.of(context).black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFF5F5F5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 40,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Text(
                                  'Cancel',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    width: 300,
                                    height: 40,
                                    decoration: BoxDecoration(),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
