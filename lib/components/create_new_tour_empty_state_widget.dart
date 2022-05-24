import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewTourEmptyStateWidget extends StatefulWidget {
  const CreateNewTourEmptyStateWidget({Key key}) : super(key: key);

  @override
  _CreateNewTourEmptyStateWidgetState createState() =>
      _CreateNewTourEmptyStateWidgetState();
}

class _CreateNewTourEmptyStateWidgetState
    extends State<CreateNewTourEmptyStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.directions_bus_rounded,
                    color: Colors.black,
                    size: 32,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: Text(
                      'Your  planned  tours  and',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          ),
                    ),
                  ),
                  Text(
                    'those you join will appear here',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
