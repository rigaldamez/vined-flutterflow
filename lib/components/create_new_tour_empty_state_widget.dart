import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewTourEmptyStateWidget extends StatefulWidget {
  const CreateNewTourEmptyStateWidget({Key key}) : super(key: key);

  @override
  _CreateNewTourEmptyStateWidgetState createState() =>
      _CreateNewTourEmptyStateWidgetState();
}

class _CreateNewTourEmptyStateWidgetState
    extends State<CreateNewTourEmptyStateWidget> {
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.directions_bus_outlined,
            color: Colors.black,
            size: 44,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
            child: Text(
              'You have no planned tours',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                  ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                      borderRadius: BorderRadius.circular(34),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: TextFormField(
                        controller: textController,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'eg; Wine Time Fun!',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(34),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(34),
                          ),
                          filled: true,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 60,
                          color: Color(0xFF333333),
                          spreadRadius: 1,
                        )
                      ],
                      borderRadius: BorderRadius.circular(34),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Create Tour',
                      options: FFButtonOptions(
                        width: 390,
                        height: 58,
                        color: FlutterFlowTheme.of(context).black,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 34,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
