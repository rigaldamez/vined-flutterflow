import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_all_model.dart';
export 'search_all_model.dart';

class SearchAllWidget extends StatefulWidget {
  const SearchAllWidget({Key? key}) : super(key: key);

  @override
  _SearchAllWidgetState createState() => _SearchAllWidgetState();
}

class _SearchAllWidgetState extends State<SearchAllWidget>
    with TickerProviderStateMixin {
  late SearchAllModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconButtonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
    'iconButtonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchAllModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).cultured,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).softPurple,
                FlutterFlowTheme.of(context).greenPastel,
                Color(0xFFB19CD9)
              ],
              stops: [0.0, 0.6, 1.0],
              begin: AlignmentDirectional(0.87, -1.0),
              end: AlignmentDirectional(-0.87, 1.0),
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Container(
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(14.0),
                              border: Border.all(
                                color: Color(0x19000000),
                                width: 1.0,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 4.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 1.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x7FF5F5F5),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                buttonSize: 30.0,
                                                fillColor: Color(0x00F4F4F4),
                                                icon: Icon(
                                                  Icons.arrow_back_rounded,
                                                  color: Colors.black,
                                                  size: 14.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconButtonOnPageLoadAnimation1']!),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Search venue, apply filters',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF878787),
                                              ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 1.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0x7FF5F5F5),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 30.0,
                                            fillColor: Color(0x00F4F4F4),
                                            icon: FaIcon(
                                              FontAwesomeIcons.stream,
                                              color: Colors.black,
                                              size: 14.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ).animateOnPageLoad(animationsMap[
                                              'iconButtonOnPageLoadAnimation2']!),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(),
                    child: StreamBuilder<List<VenuesRecord>>(
                      stream: queryVenuesRecord(),
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
                        List<VenuesRecord> listViewFeaturedVenuesRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: listViewFeaturedVenuesRecordList.length,
                          itemBuilder: (context, listViewFeaturedIndex) {
                            final listViewFeaturedVenuesRecord =
                                listViewFeaturedVenuesRecordList[
                                    listViewFeaturedIndex];
                            return Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34.0),
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.96,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 6.0, 6.0, 6.0),
                                      child: Hero(
                                        tag: listViewFeaturedVenuesRecord.image,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(34.0),
                                          child: Image.network(
                                            listViewFeaturedVenuesRecord.image,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.90),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 0.0, 6.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.12,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Color(0xE6000000)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(34.0),
                                              bottomRight:
                                                  Radius.circular(34.0),
                                              topLeft: Radius.circular(0.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-0.90, 0.70),
                                        child: Text(
                                          functions
                                              .upperCaseString(
                                                  listViewFeaturedVenuesRecord
                                                      .name)
                                              .maybeHandleOverflow(
                                                maxChars: 18,
                                                replacement: '…',
                                              ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .cultured,
                                                fontSize: 10.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.80, -0.50),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            100.0, 0.0, 0.0, 100.0),
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              ToggleIcon(
                                                onPressed: () async {
                                                  final isFavouritedByElement =
                                                      currentUserReference;
                                                  final isFavouritedByUpdate =
                                                      listViewFeaturedVenuesRecord
                                                              .isFavouritedBy
                                                              .contains(
                                                                  isFavouritedByElement)
                                                          ? FieldValue
                                                              .arrayRemove([
                                                              isFavouritedByElement
                                                            ])
                                                          : FieldValue
                                                              .arrayUnion([
                                                              isFavouritedByElement
                                                            ]);
                                                  await listViewFeaturedVenuesRecord
                                                      .reference
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'is_favourited_by':
                                                            isFavouritedByUpdate,
                                                      },
                                                    ),
                                                  });
                                                },
                                                value:
                                                    listViewFeaturedVenuesRecord
                                                        .isFavouritedBy
                                                        .contains(
                                                            currentUserReference),
                                                onIcon: Icon(
                                                  Icons.favorite_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .pinkPastel,
                                                  size: 18.0,
                                                ),
                                                offIcon: Icon(
                                                  Icons.favorite_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .cultured,
                                                  size: 18.0,
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (listViewFeaturedVenuesRecord
                                                      .isFavouritedBy
                                                      .contains(
                                                          currentUserReference)) {
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'is_favourited_by':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            currentUserReference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  } else {
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'is_favourited_by':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
