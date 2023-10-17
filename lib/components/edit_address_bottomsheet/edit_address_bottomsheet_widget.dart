import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_address_bottomsheet_model.dart';
export 'edit_address_bottomsheet_model.dart';

class EditAddressBottomsheetWidget extends StatefulWidget {
  const EditAddressBottomsheetWidget({
    Key? key,
    this.tourID,
  }) : super(key: key);

  final DocumentReference? tourID;

  @override
  _EditAddressBottomsheetWidgetState createState() =>
      _EditAddressBottomsheetWidgetState();
}

class _EditAddressBottomsheetWidgetState
    extends State<EditAddressBottomsheetWidget> {
  late EditAddressBottomsheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditAddressBottomsheetModel());

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

    return StreamBuilder<ToursRecord>(
      stream: ToursRecord.getDocument(widget.tourID!),
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
        final containerToursRecord = snapshot.data!;
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
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
            child: FutureBuilder<ApiCallResponse>(
              future: GETGeolocationFORAddressCall.call(
                address: _model.placePickerValue.address,
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
                final columnGETGeolocationFORAddressResponse = snapshot.data!;
                return Column(
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Pickup address',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 20.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Color(0x00EEEEEE),
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                          color: Color(0x19000000),
                                        ),
                                      ),
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.pin_drop,
                                              color: Colors.black,
                                              size: 24.0,
                                            ),
                                            Text(
                                              _model.placePickerValue.address,
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14.0,
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
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.94,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 58.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(34.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: FlutterFlowPlacePicker(
                                            iOSGoogleMapsApiKey:
                                                'AIzaSyDMvQ-0VfFVRtzlYA-8oxKroXhswUCQCi0',
                                            androidGoogleMapsApiKey:
                                                'AIzaSyCf9LVmSv_NS1Yz34-f51SXiiHMhSlv72A',
                                            webGoogleMapsApiKey:
                                                'AIzaSyA1rjhxywp_z2GbG-GNbGMnNMiB-YLH2C8',
                                            onSelect: (place) async {
                                              setState(() => _model
                                                  .placePickerValue = place);
                                            },
                                            defaultText: 'Search Address',
                                            icon: Icon(
                                              Icons.place,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black,
                                              size: 16.0,
                                            ),
                                            buttonOptions: FFButtonOptions(
                                              width: double.infinity,
                                              height: double.infinity,
                                              color: Colors.transparent,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                        fontSize: 14.0,
                                                      ),
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(34.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await widget.tourID!
                                          .update(createToursRecordData(
                                        pickupAddress:
                                            _model.placePickerValue.address,
                                        pickupLatlng: functions.createGeoPoint(
                                            getJsonField(
                                              columnGETGeolocationFORAddressResponse
                                                  .jsonBody,
                                              r'''$.results[0].geometry.location.lat''',
                                            ),
                                            getJsonField(
                                              columnGETGeolocationFORAddressResponse
                                                  .jsonBody,
                                              r'''$.results[0].geometry.location.lng''',
                                            )),
                                        countryState: getJsonField(
                                          columnGETGeolocationFORAddressResponse
                                              .jsonBody,
                                          r'''$.results[0].address_components[4].short_name''',
                                        ).toString(),
                                      ));
                                      Navigator.pop(context);
                                    },
                                    text: 'Save',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 60.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).black,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFFF5F5F5),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
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
