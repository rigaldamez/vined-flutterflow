import '../components/new_tour_bottomsheet_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowItWorksEmptyStateWidget extends StatefulWidget {
  const HowItWorksEmptyStateWidget({Key? key}) : super(key: key);

  @override
  _HowItWorksEmptyStateWidgetState createState() =>
      _HowItWorksEmptyStateWidgetState();
}

class _HowItWorksEmptyStateWidgetState
    extends State<HowItWorksEmptyStateWidget> {
  PageController? pageViewController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              PageView(
                controller: pageViewController ??=
                    PageController(initialPage: 0),
                scrollDirection: Axis.horizontal,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(34),
                          child: Image.network(
                            'https://res.cloudinary.com/rigcloudinary/image/upload/v1614030907/CellarDweller/Design/Onboarding/1_oped_epi0bd.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(34),
                          child: Image.network(
                            'https://res.cloudinary.com/rigcloudinary/image/upload/v1614030907/CellarDweller/Design/Onboarding/2_oped_tvvkxx.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                            topLeft: Radius.circular(38),
                            topRight: Radius.circular(24),
                          ),
                          child: Image.network(
                            'https://res.cloudinary.com/rigcloudinary/image/upload/v1614030907/CellarDweller/Design/Onboarding/3_oped_oxznkl.jpg',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: smooth_page_indicator.SmoothPageIndicator(
                    controller: pageViewController ??=
                        PageController(initialPage: 0),
                    count: 3,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (i) {
                      pageViewController!.animateToPage(
                        i,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    effect: smooth_page_indicator.ExpandingDotsEffect(
                      expansionFactor: 3,
                      spacing: 8,
                      radius: 16,
                      dotWidth: 8,
                      dotHeight: 8,
                      dotColor: Color(0x89FDBEEB),
                      activeDotColor: FlutterFlowTheme.of(context).purplePastel,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
          child: FFButtonWidget(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: 400,
                      child: NewTourBottomsheetWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            text: 'Create Tour',
            options: FFButtonOptions(
              width: 180,
              height: 46,
              color: FlutterFlowTheme.of(context).black,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
              elevation: 8,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ],
    );
  }
}
