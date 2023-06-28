import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key? key}) : super(key: key);

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());

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
      body: Container(
        width: MediaQuery.of(context).size.width * 1.0,
        height: MediaQuery.of(context).size.height * 1.0,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  PageView(
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.network(
                        'https://res.cloudinary.com/rigcloudinary/image/upload/v1636889806/CellarDweller/Walkthrough%20screens/FF-Onboarding1-Discover-1-op_vdrb31.jpg',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://res.cloudinary.com/rigcloudinary/image/upload/v1636886584/CellarDweller/Walkthrough%20screens/IMG_9166_oped_xyesi3.jpg',
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                      Stack(
                        children: [
                          Image.network(
                            'https://res.cloudinary.com/rigcloudinary/image/upload/v1636887096/CellarDweller/Walkthrough%20screens/boudoir-bend-oregon_oped_trkvuj.jpg',
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.8),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('Login');
                              },
                              text: 'Get Started',
                              options: FFButtonOptions(
                                width: 360.0,
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFF4F4F4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.8),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          dotColor: Color(0x89FDBEEB),
                          activeDotColor:
                              FlutterFlowTheme.of(context).pinkPastel,
                          paintStyle: PaintingStyle.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
