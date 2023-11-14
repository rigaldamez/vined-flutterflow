import '/components/new_tour_bottomsheet/new_tour_bottomsheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'how_it_works_empty_state_model.dart';
export 'how_it_works_empty_state_model.dart';

class HowItWorksEmptyStateWidget extends StatefulWidget {
  const HowItWorksEmptyStateWidget({Key? key}) : super(key: key);

  @override
  _HowItWorksEmptyStateWidgetState createState() =>
      _HowItWorksEmptyStateWidgetState();
}

class _HowItWorksEmptyStateWidgetState
    extends State<HowItWorksEmptyStateWidget> {
  late HowItWorksEmptyStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HowItWorksEmptyStateModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              PageView(
                controller: _model.pageViewController ??=
                    PageController(initialPage: 0),
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(34.0),
                          child: Image.network(
                            'https://res.cloudinary.com/rigcloudinary/image/upload/v1614030907/CellarDweller/Design/Onboarding/1_oped_epi0bd.jpg',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(34.0),
                          child: Image.network(
                            'https://res.cloudinary.com/rigcloudinary/image/upload/v1614030907/CellarDweller/Design/Onboarding/2_oped_tvvkxx.jpg',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24.0),
                            bottomRight: Radius.circular(24.0),
                            topLeft: Radius.circular(38.0),
                            topRight: Radius.circular(24.0),
                          ),
                          child: Image.network(
                            'https://res.cloudinary.com/rigcloudinary/image/upload/v1614030907/CellarDweller/Design/Onboarding/3_oped_oxznkl.jpg',
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 1.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: smooth_page_indicator.SmoothPageIndicator(
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    count: 3,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) async {
                      await _model.pageViewController!.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    effect: smooth_page_indicator.ExpandingDotsEffect(
                      expansionFactor: 3.0,
                      spacing: 8.0,
                      radius: 16.0,
                      dotWidth: 8.0,
                      dotHeight: 8.0,
                      dotColor: Color(0x89FDBEEB),
                      activeDotColor: FlutterFlowTheme.of(context).pinkPastel,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 10.0),
          child: FFButtonWidget(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Color(0x00000000),
                context: context,
                builder: (context) {
                  return WebViewAware(
                      child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: Container(
                      height: 400.0,
                      child: NewTourBottomsheetWidget(),
                    ),
                  ));
                },
              ).then((value) => safeSetState(() {}));
            },
            text: 'Create Tour',
            options: FFButtonOptions(
              width: 180.0,
              height: 46.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).black,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
              elevation: 8.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ),
        ),
      ],
    );
  }
}
