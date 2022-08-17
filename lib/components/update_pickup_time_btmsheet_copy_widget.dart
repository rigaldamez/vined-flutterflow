import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePickupTimeBtmsheetCopyWidget extends StatefulWidget {
  const UpdatePickupTimeBtmsheetCopyWidget({
    Key? key,
    this.tourReff,
    this.venueReff,
    this.selectedVenue,
  }) : super(key: key);

  final DocumentReference? tourReff;
  final VenuesRecord? venueReff;
  final DocumentReference? selectedVenue;

  @override
  _UpdatePickupTimeBtmsheetCopyWidgetState createState() =>
      _UpdatePickupTimeBtmsheetCopyWidgetState();
}

class _UpdatePickupTimeBtmsheetCopyWidgetState
    extends State<UpdatePickupTimeBtmsheetCopyWidget> {
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.98,
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
                                    20, 0, 20, 0),
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 20, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Edit pickup time',
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
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'jm', datePicked),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ],
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
                                          FlutterFlowTheme.of(context).black,
                                      icon: Icon(
                                        Icons.edit_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .cultured,
                                        size: 16,
                                      ),
                                      onPressed: () async {
                                        await DatePicker.showTimePicker(
                                          context,
                                          showTitleActions: true,
                                          onConfirm: (date) {
                                            setState(() => datePicked = date);
                                          },
                                          currentTime: functions
                                              .getTodayTimestampZeroMinutes(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Container(
                                    width: 300,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).black,
                                      borderRadius: BorderRadius.circular(28),
                                    ),
                                  ),
                                  Text(
                                    'Save',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .cultured,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final toursUpdateData =
                                          createToursRecordData(
                                        tourDate:
                                            functions.getBookingReservationTime(
                                                containerToursRecord.tourDate,
                                                datePicked),
                                      );
                                      await widget.tourReff!
                                          .update(toursUpdateData);
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 300,
                                      height: 50,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
