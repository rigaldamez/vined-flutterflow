import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditAddressBottomsheetWidget extends StatefulWidget {
  const EditAddressBottomsheetWidget({
    Key key,
    this.tourID,
  }) : super(key: key);

  final DocumentReference tourID;

  @override
  _EditAddressBottomsheetWidgetState createState() =>
      _EditAddressBottomsheetWidgetState();
}

class _EditAddressBottomsheetWidgetState
    extends State<EditAddressBottomsheetWidget> {
  var placePickerValue = FFPlace();

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
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).purplePastel,
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
            padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: FutureBuilder<ApiCallResponse>(
              future: GETGeolocationFORAddressCall.call(
                address: placePickerValue.address,
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
                final columnGETGeolocationFORAddressResponse = snapshot.data;
                return Column(
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 6, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Pickup address',
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.pin_drop,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Text(
                                              placePickerValue.address,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.94,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 58,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(34),
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: FlutterFlowPlacePicker(
                                            iOSGoogleMapsApiKey:
                                                'AIzaSyDMvQ-0VfFVRtzlYA-8oxKroXhswUCQCi0',
                                            androidGoogleMapsApiKey:
                                                'AIzaSyCf9LVmSv_NS1Yz34-f51SXiiHMhSlv72A',
                                            webGoogleMapsApiKey:
                                                'AIzaSyA1rjhxywp_z2GbG-GNbGMnNMiB-YLH2C8',
                                            onSelect: (place) => setState(
                                                () => placePickerValue = place),
                                            defaultText: 'Search Address',
                                            icon: Icon(
                                              Icons.place,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black,
                                              size: 16,
                                            ),
                                            buttonOptions: FFButtonOptions(
                                              width: double.infinity,
                                              height: double.infinity,
                                              color: Colors.transparent,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                        fontSize: 14,
                                                      ),
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black,
                                                width: 2,
                                              ),
                                              borderRadius: 34,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      final toursUpdateData =
                                          createToursRecordData(
                                        pickupAddress: placePickerValue.address,
                                        pickupLatlng: functions.createGeoPoint(
                                            getJsonField(
                                              (columnGETGeolocationFORAddressResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.results[0].geometry.location.lat''',
                                            ),
                                            getJsonField(
                                              (columnGETGeolocationFORAddressResponse
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.results[0].geometry.location.lng''',
                                            )),
                                        countryState: getJsonField(
                                          (columnGETGeolocationFORAddressResponse
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.results[0].address_components[4].short_name''',
                                        ).toString(),
                                      );
                                      await widget.tourID
                                          .update(toursUpdateData);
                                      context.pop();
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
