import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'iconButtonOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => HomeModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              color: Color(0xFFB19CD9),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).cultured,
        body: Container(
          width: MediaQuery.of(context).size.width * 1.0,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName != null &&
                                    currentUserDisplayName != ''
                                ? ((String var1) {
                                    return "Hey " + var1;
                                  }(currentUserDisplayName))
                                : 'Discover'.maybeHandleOverflow(
                                    maxChars: 16,
                                    replacement: '…',
                                  ),
                            style: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 50.0,
                        buttonSize: 46.0,
                        fillColor: Color(0x00F4F4F4),
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ).animateOnPageLoad(
                          animationsMap['iconButtonOnPageLoadAnimation']!),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Color(0x00F4F4F4),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 8.0, 4.0, 8.0),
                              child: StreamBuilder<List<StatesRecord>>(
                                stream: queryStatesRecord(
                                  queryBuilder: (statesRecord) => statesRecord
                                      .where('isServiced', isEqualTo: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 20.0,
                                        height: 20.0,
                                        child: CircularProgressIndicator(
                                          color: Color(0xFFB19CD9),
                                        ),
                                      ),
                                    );
                                  }
                                  List<StatesRecord>
                                      choiceChipsStatesRecordList =
                                      snapshot.data!;
                                  return FlutterFlowChoiceChips(
                                    options: choiceChipsStatesRecordList
                                        .map((e) => e.stateDisplayName)
                                        .toList()
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) => setState(() =>
                                        _model.choiceChipsValue = val?.first),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).black,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      iconColor: Colors.white,
                                      iconSize: 18.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 4.0, 6.0, 4.0),
                                      elevation: 4.0,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF262D34),
                                          ),
                                      iconColor: Color(0xFF262D34),
                                      iconSize: 18.0,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10.0, 4.0, 10.0, 4.0),
                                      elevation: 2.0,
                                    ),
                                    chipSpacing: 10.0,
                                    rowSpacing: 12.0,
                                    multiselect: false,
                                    initialized:
                                        _model.choiceChipsValue != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      ['South Australia'],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Featured',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Nunito',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w900,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Text(
                              'See All',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<VenuesRecord>>(
                    stream: queryVenuesRecord(
                      queryBuilder: (venuesRecord) => venuesRecord.where(
                          'country_state_display_name',
                          isEqualTo: _model.choiceChipsValue),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              color: Color(0xFFB19CD9),
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
                              width: MediaQuery.of(context).size.width * 0.96,
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
                                    alignment: AlignmentDirectional(0.0, 0.9),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 6.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.12,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xE6000000)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(34.0),
                                            bottomRight: Radius.circular(34.0),
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
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 6.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future:
                                            GETDistanceBetwenTwoGeopointsCall
                                                .call(
                                          origins: currentUserLocationValue
                                              ?.toString(),
                                          destinations:
                                              listViewFeaturedVenuesRecord
                                                  .latLong
                                                  ?.toString(),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 20.0,
                                                height: 20.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Color(0xFFB19CD9),
                                                ),
                                              ),
                                            );
                                          }
                                          final rowGETDistanceBetwenTwoGeopointsResponse =
                                              snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.9, 0.7),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    functions
                                                        .upperCaseString(
                                                            listViewFeaturedVenuesRecord
                                                                .name)
                                                        .maybeHandleOverflow(
                                                          maxChars: 18,
                                                          replacement: '…',
                                                        ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .cultured,
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.9, 0.7),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    GETDistanceBetwenTwoGeopointsCall
                                                            .travelDistance(
                                                      rowGETDistanceBetwenTwoGeopointsResponse
                                                          .jsonBody,
                                                    )
                                                        .toString()
                                                        .maybeHandleOverflow(
                                                          maxChars: 18,
                                                          replacement: '…',
                                                        ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .cultured,
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.8, -0.5),
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
                                                final venuesUpdateData = {
                                                  'is_favourited_by':
                                                      isFavouritedByUpdate,
                                                };
                                                await listViewFeaturedVenuesRecord
                                                    .reference
                                                    .update(venuesUpdateData);
                                              },
                                              value:
                                                  listViewFeaturedVenuesRecord
                                                      .isFavouritedBy
                                                      .contains(
                                                          currentUserReference),
                                              onIcon: Icon(
                                                Icons.favorite_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .pinkPastel,
                                                size: 18.0,
                                              ),
                                              offIcon: Icon(
                                                Icons.favorite_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                  final venuesUpdateData1 = {
                                                    'is_favourited_by':
                                                        FieldValue.arrayRemove([
                                                      currentUserReference
                                                    ]),
                                                  };
                                                  await listViewFeaturedVenuesRecord
                                                      .reference
                                                      .update(
                                                          venuesUpdateData1);
                                                } else {
                                                  final venuesUpdateData2 = {
                                                    'is_favourited_by':
                                                        FieldValue.arrayUnion([
                                                      currentUserReference
                                                    ]),
                                                  };
                                                  await listViewFeaturedVenuesRecord
                                                      .reference
                                                      .update(
                                                          venuesUpdateData2);
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Adelaide Hills',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Text(
                              'See All',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<VenuesRecord>>(
                    stream: queryVenuesRecord(
                      queryBuilder: (venuesRecord) => venuesRecord.where(
                          'country_state_display_name',
                          isEqualTo: _model.choiceChipsValue),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              color: Color(0xFFB19CD9),
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
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34.0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Hero(
                                        tag: listViewFeaturedVenuesRecord.image,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(34.0),
                                          child: Image.network(
                                            listViewFeaturedVenuesRecord.image,
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.24,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.9),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
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
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-0.5, 0.7),
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
                                          AlignmentDirectional(0.5, -0.64),
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
                                                  final venuesUpdateData = {
                                                    'is_favourited_by':
                                                        isFavouritedByUpdate,
                                                  };
                                                  await listViewFeaturedVenuesRecord
                                                      .reference
                                                      .update(venuesUpdateData);
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
                                                  size: 16.0,
                                                ),
                                                offIcon: Icon(
                                                  Icons.favorite_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .cultured,
                                                  size: 16.0,
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
                                                    final venuesUpdateData1 = {
                                                      'is_favourited_by':
                                                          FieldValue
                                                              .arrayRemove([
                                                        currentUserReference
                                                      ]),
                                                    };
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update(
                                                            venuesUpdateData1);
                                                  } else {
                                                    final venuesUpdateData2 = {
                                                      'is_favourited_by':
                                                          FieldValue
                                                              .arrayUnion([
                                                        currentUserReference
                                                      ]),
                                                    };
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update(
                                                            venuesUpdateData2);
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
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Barossa Valley',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Text(
                              'See All',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<VenuesRecord>>(
                    stream: queryVenuesRecord(
                      queryBuilder: (venuesRecord) => venuesRecord.where(
                          'country_state_display_name',
                          isEqualTo: _model.choiceChipsValue),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              color: Color(0xFFB19CD9),
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
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34.0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Hero(
                                        tag: listViewFeaturedVenuesRecord.image,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(34.0),
                                          child: Image.network(
                                            listViewFeaturedVenuesRecord.image,
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.24,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.9),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
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
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-0.5, 0.7),
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
                                          AlignmentDirectional(0.9, -0.64),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            100.0, 0.0, 0.0, 100.0),
                                        child: Container(
                                          height: 40.0,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x65000000),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ToggleIcon(
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
                                                      final venuesUpdateData = {
                                                        'is_favourited_by':
                                                            isFavouritedByUpdate,
                                                      };
                                                      await listViewFeaturedVenuesRecord
                                                          .reference
                                                          .update(
                                                              venuesUpdateData);
                                                    },
                                                    value: listViewFeaturedVenuesRecord
                                                        .isFavouritedBy
                                                        .contains(
                                                            currentUserReference),
                                                    onIcon: Icon(
                                                      Icons.favorite_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pinkPastel,
                                                      size: 16.0,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons
                                                          .favorite_border_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .cultured,
                                                      size: 14.0,
                                                    ),
                                                  ),
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
                                                    final venuesUpdateData1 = {
                                                      'is_favourited_by':
                                                          FieldValue
                                                              .arrayRemove([
                                                        currentUserReference
                                                      ]),
                                                    };
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update(
                                                            venuesUpdateData1);
                                                  } else {
                                                    final venuesUpdateData2 = {
                                                      'is_favourited_by':
                                                          FieldValue
                                                              .arrayUnion([
                                                        currentUserReference
                                                      ]),
                                                    };
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update(
                                                            venuesUpdateData2);
                                                  }
                                                },
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
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
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'McLaren Vale',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Text(
                              'See All',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<VenuesRecord>>(
                    stream: queryVenuesRecord(
                      queryBuilder: (venuesRecord) => venuesRecord.where(
                          'country_state_display_name',
                          isEqualTo: _model.choiceChipsValue),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              color: Color(0xFFB19CD9),
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
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34.0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Hero(
                                        tag: listViewFeaturedVenuesRecord.image,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(34.0),
                                          child: Image.network(
                                            listViewFeaturedVenuesRecord.image,
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.24,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.9),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
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
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-0.5, 0.7),
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
                                          AlignmentDirectional(0.9, -0.64),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            100.0, 0.0, 0.0, 100.0),
                                        child: Container(
                                          height: 40.0,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x65000000),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ToggleIcon(
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
                                                      final venuesUpdateData = {
                                                        'is_favourited_by':
                                                            isFavouritedByUpdate,
                                                      };
                                                      await listViewFeaturedVenuesRecord
                                                          .reference
                                                          .update(
                                                              venuesUpdateData);
                                                    },
                                                    value: listViewFeaturedVenuesRecord
                                                        .isFavouritedBy
                                                        .contains(
                                                            currentUserReference),
                                                    onIcon: Icon(
                                                      Icons.favorite_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pinkPastel,
                                                      size: 16.0,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons
                                                          .favorite_border_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .cultured,
                                                      size: 14.0,
                                                    ),
                                                  ),
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
                                                    final venuesUpdateData1 = {
                                                      'is_favourited_by':
                                                          FieldValue
                                                              .arrayRemove([
                                                        currentUserReference
                                                      ]),
                                                    };
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update(
                                                            venuesUpdateData1);
                                                  } else {
                                                    final venuesUpdateData2 = {
                                                      'is_favourited_by':
                                                          FieldValue
                                                              .arrayUnion([
                                                        currentUserReference
                                                      ]),
                                                    };
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update(
                                                            venuesUpdateData2);
                                                  }
                                                },
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
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
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Langhorne Creek',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        height: 40.0,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Text(
                              'See All',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<VenuesRecord>>(
                    stream: queryVenuesRecord(
                      queryBuilder: (venuesRecord) => venuesRecord.where(
                          'country_state_display_name',
                          isEqualTo: _model.choiceChipsValue),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              color: Color(0xFFB19CD9),
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
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34.0),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: Hero(
                                        tag: listViewFeaturedVenuesRecord.image,
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(34.0),
                                          child: Image.network(
                                            listViewFeaturedVenuesRecord.image,
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.24,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.9),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
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
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-0.5, 0.7),
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
                                          AlignmentDirectional(0.9, -0.64),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            100.0, 0.0, 0.0, 100.0),
                                        child: Container(
                                          height: 40.0,
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x65000000),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: ToggleIcon(
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
                                                      final venuesUpdateData = {
                                                        'is_favourited_by':
                                                            isFavouritedByUpdate,
                                                      };
                                                      await listViewFeaturedVenuesRecord
                                                          .reference
                                                          .update(
                                                              venuesUpdateData);
                                                    },
                                                    value: listViewFeaturedVenuesRecord
                                                        .isFavouritedBy
                                                        .contains(
                                                            currentUserReference),
                                                    onIcon: Icon(
                                                      Icons.favorite_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pinkPastel,
                                                      size: 16.0,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons
                                                          .favorite_border_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .cultured,
                                                      size: 14.0,
                                                    ),
                                                  ),
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
                                                    final venuesUpdateData1 = {
                                                      'is_favourited_by':
                                                          FieldValue
                                                              .arrayRemove([
                                                        currentUserReference
                                                      ]),
                                                    };
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update(
                                                            venuesUpdateData1);
                                                  } else {
                                                    final venuesUpdateData2 = {
                                                      'is_favourited_by':
                                                          FieldValue
                                                              .arrayUnion([
                                                        currentUserReference
                                                      ]),
                                                    };
                                                    await listViewFeaturedVenuesRecord
                                                        .reference
                                                        .update(
                                                            venuesUpdateData2);
                                                  }
                                                },
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
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
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 1.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
