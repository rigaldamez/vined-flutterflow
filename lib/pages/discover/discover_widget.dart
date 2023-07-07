import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'discover_model.dart';
export 'discover_model.dart';

class DiscoverWidget extends StatefulWidget {
  const DiscoverWidget({Key? key}) : super(key: key);

  @override
  _DiscoverWidgetState createState() => _DiscoverWidgetState();
}

class _DiscoverWidgetState extends State<DiscoverWidget>
    with TickerProviderStateMixin {
  late DiscoverModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
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
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -47.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiscoverModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      _model.pageLoaded = true;
      _model.highlightsCount = await actions.countCollectionDocs(
        'highlights',
      );
      setState(() {
        _model.activeHighlights = _model.highlightsCount! >= 1;
      });
      setState(() {
        _model.upcomingeventsCount = _model.highlightsCount;
      });
      _model.venuesList = await actions.getDocsFromCollectionVenues(
        _model.choiceChipsValue,
      );
      _model.sortedVenuesByDistanceOutput = await actions.sortVenuesByDistance(
        _model.venuesList?.toList(),
        currentUserLocationValue,
      );
      setState(() {
        _model.venuesSortedByDistancePS =
            _model.sortedVenuesByDistanceOutput!.toList().cast<VenuesRecord>();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'On Page Load completed',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).black,
            ),
          ),
          duration: Duration(milliseconds: 1000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));

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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).cultured,
        body: StreamBuilder<List<VenuesRecord>>(
          stream: queryVenuesRecord(
            queryBuilder: (venuesRecord) => venuesRecord
                .where('country_state_display_name',
                    isEqualTo: _model.choiceChipsValue)
                .where('isActive', isEqualTo: true),
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
            List<VenuesRecord> containerMainVenuesRecordList = snapshot.data!;
            return Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
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
                      width: MediaQuery.sizeOf(context).width * 1.0,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
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
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
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
                                        queryBuilder: (statesRecord) =>
                                            statesRecord.where('isServiced',
                                                isEqualTo: true),
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
                                          onChanged: (val) async {
                                            setState(() => _model
                                                .choiceChipsValue = val?.first);
                                            currentUserLocationValue =
                                                await getCurrentUserLocation(
                                                    defaultLocation:
                                                        LatLng(0.0, 0.0));
                                            var _shouldSetState = false;
                                            if (_model.pageLoaded == true) {
                                              setState(() {
                                                _model.pageLoaded = false;
                                              });
                                            } else {
                                              _model.venuesListChoiceChips =
                                                  await actions
                                                      .getDocsFromCollectionVenues(
                                                _model.choiceChipsValue,
                                              );
                                              _shouldSetState = true;
                                              _model.sortedVenuesByDistanceOutputChoiceChips =
                                                  await actions
                                                      .sortVenuesByDistance(
                                                _model.venuesListChoiceChips
                                                    ?.toList(),
                                                currentUserLocationValue,
                                              );
                                              _shouldSetState = true;
                                              setState(() {
                                                _model.venuesSortedByDistancePS =
                                                    _model
                                                        .sortedVenuesByDistanceOutputChoiceChips!
                                                        .toList()
                                                        .cast<VenuesRecord>();
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Choice Chip selected',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .black,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 2000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .black,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                          controller: _model
                                                  .choiceChipsValueController ??=
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
                    ),
                    if (_model.activeHighlights ?? true)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Highlights',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.34,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFECF6),
                                    Color(0xFFB19CD9)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(0.0, -1.0),
                                  end: AlignmentDirectional(0, 1.0),
                                ),
                              ),
                              child: StreamBuilder<List<HighlightsRecord>>(
                                stream: queryHighlightsRecord(
                                  queryBuilder: (highlightsRecord) =>
                                      highlightsRecord.where('is_active',
                                          isEqualTo: true),
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
                                  List<HighlightsRecord>
                                      listViewEventsHighlightsRecordList =
                                      snapshot.data!;
                                  return ListView.builder(
                                    padding: EdgeInsets.fromLTRB(
                                      10.0,
                                      0,
                                      10.0,
                                      0,
                                    ),
                                    primary: false,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        listViewEventsHighlightsRecordList
                                            .length,
                                    itemBuilder:
                                        (context, listViewEventsIndex) {
                                      final listViewEventsHighlightsRecord =
                                          listViewEventsHighlightsRecordList[
                                              listViewEventsIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight:
                                                  Radius.circular(50.0),
                                              topLeft: Radius.circular(50.0),
                                              topRight: Radius.circular(0.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.92,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 6.0, 6.0, 6.0),
                                                  child: Hero(
                                                    tag:
                                                        listViewEventsHighlightsRecord
                                                            .image,
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                50.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                50.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      child: Image.network(
                                                        listViewEventsHighlightsRecord
                                                            .image,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(),
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
                          ),
                        ],
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
                                  color: Color(0x8DF5F5F5),
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(
                                    color: Color(0x19000000),
                                    width: 1.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
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
                                                buttonSize: 30.0,
                                                fillColor: Color(0x00F4F4F4),
                                                icon: FaIcon(
                                                  FontAwesomeIcons.search,
                                                  color: Colors.black,
                                                  size: 14.0,
                                                ),
                                                onPressed: () {
                                                  print(
                                                      'IconButton pressed ...');
                                                },
                                              ).animateOnPageLoad(animationsMap[
                                                  'iconButtonOnPageLoadAnimation']!),
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
                                      ]
                                          .divide(SizedBox(width: 6.0))
                                          .addToStart(SizedBox(width: 6.0)),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Nearby',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w800,
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
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w800,
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
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.26,
                      decoration: BoxDecoration(),
                      child:
                          // Venue list comes from Page State
                          Builder(
                        builder: (context) {
                          final sortedVenuesByDistance =
                              _model.venuesSortedByDistancePS.toList();
                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              10.0,
                              0,
                              10.0,
                              0,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: sortedVenuesByDistance.length,
                            itemBuilder:
                                (context, sortedVenuesByDistanceIndex) {
                              final sortedVenuesByDistanceItem =
                                  sortedVenuesByDistance[
                                      sortedVenuesByDistanceIndex];
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(34.0),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.92,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 6.0, 6.0, 6.0),
                                        child: Hero(
                                          tag: sortedVenuesByDistanceItem.image,
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(34.0),
                                            child: Image.network(
                                              sortedVenuesByDistanceItem.image,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.9),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(34.0),
                                                bottomRight:
                                                    Radius.circular(34.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Container(
                                          height: 46.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .cultured,
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      functions
                                                          .upperCaseString(
                                                              sortedVenuesByDistanceItem
                                                                  .name)
                                                          .maybeHandleOverflow(
                                                            maxChars: 24,
                                                            replacement: '…',
                                                          ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.location_pin,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black,
                                                          size: 16.0,
                                                        ),
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future:
                                                              GETMapboxDrivingDirectionsCall
                                                                  .call(
                                                            coordinates: functions
                                                                .getLngLatCoordinatesMapbox(
                                                                    currentUserLocationValue,
                                                                    sortedVenuesByDistanceItem
                                                                        .latLong),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: Color(
                                                                        0xFFB19CD9),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final textGETMapboxDrivingDirectionsResponse =
                                                                snapshot.data!;
                                                            return Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.convertMtsToKmsLabel(
                                                                    GETMapboxDrivingDirectionsCall
                                                                        .distance(
                                                                  textGETMapboxDrivingDirectionsResponse
                                                                      .jsonBody,
                                                                )),
                                                                'kms',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 2.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.8, -0.5),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  100.0, 0.0, 0.0, 100.0),
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                if (sortedVenuesByDistanceItem
                                                    .isFavouritedBy
                                                    .contains(
                                                        currentUserReference))
                                                  Icon(
                                                    Icons.favorite_rounded,
                                                    color: Color(0xFFFF006E),
                                                    size: 28.0,
                                                  ),
                                                if (!sortedVenuesByDistanceItem
                                                    .isFavouritedBy
                                                    .contains(
                                                        currentUserReference))
                                                  Icon(
                                                    Icons.favorite_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .black,
                                                    size: 28.0,
                                                  ),
                                                Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .cultured,
                                                  size: 28.0,
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    currentUserLocationValue =
                                                        await getCurrentUserLocation(
                                                            defaultLocation:
                                                                LatLng(
                                                                    0.0, 0.0));
                                                    if (sortedVenuesByDistanceItem
                                                        .isFavouritedBy
                                                        .contains(
                                                            currentUserReference)) {
                                                      await sortedVenuesByDistanceItem
                                                          .reference
                                                          .update({
                                                        'is_favourited_by':
                                                            FieldValue
                                                                .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      });
                                                      setState(() {
                                                        _model.venuesSortedByDistancePS = _model
                                                            .sortedVenuesByDistanceOutput!
                                                            .toList()
                                                            .cast<
                                                                VenuesRecord>();
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Remove from set',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .cultured,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  1000),
                                                          backgroundColor:
                                                              Color(0xFFFF006E),
                                                        ),
                                                      );
                                                    } else {
                                                      await sortedVenuesByDistanceItem
                                                          .reference
                                                          .update({
                                                        'is_favourited_by':
                                                            FieldValue
                                                                .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      });
                                                      setState(() {
                                                        _model.venuesSortedByDistancePS = _model
                                                            .sortedVenuesByDistanceOutput!
                                                            .toList()
                                                            .cast<
                                                                VenuesRecord>();
                                                      });
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Add to set',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .black,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .magicMint,
                                                        ),
                                                      );
                                                    }

                                                    _model.venuesList2 =
                                                        await actions
                                                            .getDocsFromCollectionVenues(
                                                      _model.choiceChipsValue,
                                                    );
                                                    _model.sortedVenuesByDistanceOutput2 =
                                                        await actions
                                                            .sortVenuesByDistance(
                                                      _model.venuesList2
                                                          ?.toList(),
                                                      currentUserLocationValue,
                                                    );
                                                    setState(() {
                                                      _model.venuesSortedByDistancePS =
                                                          _model
                                                              .sortedVenuesByDistanceOutput2!
                                                              .toList()
                                                              .cast<
                                                                  VenuesRecord>();
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'completed \'fav\' action chain',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .black,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    );

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.8, -0.8),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.24,
                                          height: 28.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              sortedVenuesByDistanceItem
                                                  .regionName
                                                  .maybeHandleOverflow(
                                                maxChars: 14,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .cultured,
                                                        fontSize: 11.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ).animateOnPageLoad(
                              animationsMap['listViewOnPageLoadAnimation']!);
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Featured',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w800,
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
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w800,
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
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.26,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<VenuesRecord>>(
                        stream: queryVenuesRecord(
                          queryBuilder: (venuesRecord) => venuesRecord
                              .where('country_state_display_name',
                                  isEqualTo: _model.choiceChipsValue)
                              .where('isActive', isEqualTo: true)
                              .where('featured_venue', isEqualTo: true),
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
                            padding: EdgeInsets.fromLTRB(
                              10.0,
                              0,
                              0,
                              0,
                            ),
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
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.92,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 6.0, 6.0, 6.0),
                                        child: Hero(
                                          tag: listViewFeaturedVenuesRecord
                                              .image,
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(34.0),
                                            child: Image.network(
                                              listViewFeaturedVenuesRecord
                                                  .image,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.9),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(34.0),
                                                bottomRight:
                                                    Radius.circular(34.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 46.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .cultured,
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      functions
                                                          .upperCaseString(
                                                              listViewFeaturedVenuesRecord
                                                                  .name)
                                                          .maybeHandleOverflow(
                                                            maxChars: 18,
                                                            replacement: '…',
                                                          ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.location_pin,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black,
                                                          size: 16.0,
                                                        ),
                                                        FutureBuilder<
                                                            ApiCallResponse>(
                                                          future:
                                                              GETMapboxDrivingDirectionsCall
                                                                  .call(
                                                            coordinates: functions
                                                                .getLngLatCoordinatesMapbox(
                                                                    currentUserLocationValue,
                                                                    listViewFeaturedVenuesRecord
                                                                        .latLong),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: Color(
                                                                        0xFFB19CD9),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final textGETMapboxDrivingDirectionsResponse =
                                                                snapshot.data!;
                                                            return Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.convertMtsToKmsLabel(
                                                                    GETMapboxDrivingDirectionsCall
                                                                        .distance(
                                                                  textGETMapboxDrivingDirectionsResponse
                                                                      .jsonBody,
                                                                )),
                                                                'kms',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .black,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 2.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.8, -0.5),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  100.0, 0.0, 0.0, 100.0),
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                if (listViewFeaturedVenuesRecord
                                                    .isFavouritedBy
                                                    .contains(
                                                        currentUserReference))
                                                  Icon(
                                                    Icons.favorite_rounded,
                                                    color: Color(0xFFFF006E),
                                                    size: 28.0,
                                                  ),
                                                if (!listViewFeaturedVenuesRecord
                                                    .isFavouritedBy
                                                    .contains(
                                                        currentUserReference))
                                                  Icon(
                                                    Icons.favorite_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .black,
                                                    size: 28.0,
                                                  ),
                                                Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .cultured,
                                                  size: 28.0,
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    currentUserLocationValue =
                                                        await getCurrentUserLocation(
                                                            defaultLocation:
                                                                LatLng(
                                                                    0.0, 0.0));
                                                    if (listViewFeaturedVenuesRecord
                                                        .isFavouritedBy
                                                        .contains(
                                                            currentUserReference)) {
                                                      await listViewFeaturedVenuesRecord
                                                          .reference
                                                          .update({
                                                        'is_favourited_by':
                                                            FieldValue
                                                                .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      });
                                                    } else {
                                                      await listViewFeaturedVenuesRecord
                                                          .reference
                                                          .update({
                                                        'is_favourited_by':
                                                            FieldValue
                                                                .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      });
                                                    }

                                                    _model.venuesList3 =
                                                        await actions
                                                            .getDocsFromCollectionVenues(
                                                      _model.choiceChipsValue,
                                                    );
                                                    _model.sortedVenuesByDistanceOutput3 =
                                                        await actions
                                                            .sortVenuesByDistance(
                                                      _model.venuesList3
                                                          ?.toList(),
                                                      currentUserLocationValue,
                                                    );
                                                    setState(() {
                                                      _model.venuesSortedByDistancePS =
                                                          _model
                                                              .sortedVenuesByDistanceOutput3!
                                                              .toList()
                                                              .cast<
                                                                  VenuesRecord>();
                                                    });

                                                    setState(() {});
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.8, -0.8),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.24,
                                          height: 28.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              listViewFeaturedVenuesRecord
                                                  .regionName
                                                  .maybeHandleOverflow(
                                                maxChars: 14,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .cultured,
                                                        fontSize: 11.0,
                                                      ),
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Trending Live',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
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
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w800,
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
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.26,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final trendingVenues = functions
                                  .sortVenuesByViewDateTrending(
                                      containerMainVenuesRecordList.toList())
                                  ?.toList() ??
                              [];
                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              10.0,
                              0,
                              10.0,
                              0,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: trendingVenues.length,
                            itemBuilder: (context, trendingVenuesIndex) {
                              final trendingVenuesItem =
                                  trendingVenues[trendingVenuesIndex];
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.white,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(34.0),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.44,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 4.0, 4.0),
                                        child: Hero(
                                          tag: trendingVenuesItem.image,
                                          transitionOnUserGestures: true,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(34.0),
                                            child: Image.network(
                                              trendingVenuesItem.image,
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.24,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.9),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 0.0, 4.0, 0.0),
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
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(34.0),
                                                bottomRight:
                                                    Radius.circular(34.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Container(
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .cultured,
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              functions
                                                  .upperCaseString(
                                                      trendingVenuesItem.name)
                                                  .maybeHandleOverflow(
                                                    maxChars: 18,
                                                    replacement: '…',
                                                  ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .black,
                                                    fontSize: 10.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.5, -0.64),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  100.0, 0.0, 0.0, 100.0),
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                if (trendingVenuesItem
                                                    .isFavouritedBy
                                                    .contains(
                                                        currentUserReference))
                                                  Icon(
                                                    Icons.favorite_rounded,
                                                    color: Color(0xFFFF006E),
                                                    size: 24.0,
                                                  ),
                                                if (!trendingVenuesItem
                                                    .isFavouritedBy
                                                    .contains(
                                                        currentUserReference))
                                                  Icon(
                                                    Icons.favorite_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .black,
                                                    size: 24.0,
                                                  ),
                                                Icon(
                                                  Icons.favorite_border_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .cultured,
                                                  size: 24.0,
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    currentUserLocationValue =
                                                        await getCurrentUserLocation(
                                                            defaultLocation:
                                                                LatLng(
                                                                    0.0, 0.0));
                                                    if (trendingVenuesItem
                                                        .isFavouritedBy
                                                        .contains(
                                                            currentUserReference)) {
                                                      await trendingVenuesItem
                                                          .reference
                                                          .update({
                                                        'is_favourited_by':
                                                            FieldValue
                                                                .arrayRemove([
                                                          currentUserReference
                                                        ]),
                                                      });
                                                    } else {
                                                      await trendingVenuesItem
                                                          .reference
                                                          .update({
                                                        'is_favourited_by':
                                                            FieldValue
                                                                .arrayUnion([
                                                          currentUserReference
                                                        ]),
                                                      });
                                                    }

                                                    _model.venuesList5 =
                                                        await actions
                                                            .getDocsFromCollectionVenues(
                                                      _model.choiceChipsValue,
                                                    );
                                                    _model.sortedVenuesByDistanceOutput5 =
                                                        await actions
                                                            .sortVenuesByDistance(
                                                      _model.venuesList5
                                                          ?.toList(),
                                                      currentUserLocationValue,
                                                    );
                                                    setState(() {
                                                      _model.venuesSortedByDistancePS =
                                                          _model
                                                              .sortedVenuesByDistanceOutput5!
                                                              .toList()
                                                              .cast<
                                                                  VenuesRecord>();
                                                    });

                                                    setState(() {});
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.7, -0.8),
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.2,
                                          height: 28.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .black,
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              trendingVenuesItem.regionName
                                                  .maybeHandleOverflow(
                                                maxChars: 14,
                                                replacement: '…',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .cultured,
                                                        fontSize: 9.0,
                                                      ),
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Most viewed',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
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
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w800,
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
                    StreamBuilder<List<VenuesRecord>>(
                      stream: queryVenuesRecord(
                        queryBuilder: (venuesRecord) => venuesRecord
                            .where('country_state_display_name',
                                isEqualTo: _model.choiceChipsValue)
                            .where('isActive', isEqualTo: true),
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
                        List<VenuesRecord> containerMostViewsVenuesRecordList =
                            snapshot.data!;
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.26,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final popularVenues = functions
                                      .sortVenuesByViewsCount(
                                          containerMostViewsVenuesRecordList
                                              .toList())
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  10.0,
                                  0,
                                  10.0,
                                  0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: popularVenues.length,
                                itemBuilder: (context, popularVenuesIndex) {
                                  final popularVenuesItem =
                                      popularVenues[popularVenuesIndex];
                                  return Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.white,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(34.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 4.0),
                                            child: Hero(
                                              tag: popularVenuesItem.image,
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(34.0),
                                                child: Image.network(
                                                  popularVenuesItem.image,
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.24,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.9),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
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
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(34.0),
                                                    bottomRight:
                                                        Radius.circular(34.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .cultured,
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  functions
                                                      .upperCaseString(
                                                          popularVenuesItem
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.5, -0.64),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      100.0, 0.0, 0.0, 100.0),
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  children: [
                                                    if (popularVenuesItem
                                                        .isFavouritedBy
                                                        .contains(
                                                            currentUserReference))
                                                      Icon(
                                                        Icons.favorite_rounded,
                                                        color:
                                                            Color(0xFFFF006E),
                                                        size: 24.0,
                                                      ),
                                                    if (!popularVenuesItem
                                                        .isFavouritedBy
                                                        .contains(
                                                            currentUserReference))
                                                      Icon(
                                                        Icons.favorite_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                        size: 24.0,
                                                      ),
                                                    Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .cultured,
                                                      size: 24.0,
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        currentUserLocationValue =
                                                            await getCurrentUserLocation(
                                                                defaultLocation:
                                                                    LatLng(0.0,
                                                                        0.0));
                                                        if (popularVenuesItem
                                                            .isFavouritedBy
                                                            .contains(
                                                                currentUserReference)) {
                                                          await popularVenuesItem
                                                              .reference
                                                              .update({
                                                            'is_favourited_by':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              currentUserReference
                                                            ]),
                                                          });
                                                        } else {
                                                          await popularVenuesItem
                                                              .reference
                                                              .update({
                                                            'is_favourited_by':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          });
                                                        }

                                                        _model.venuesList4 =
                                                            await actions
                                                                .getDocsFromCollectionVenues(
                                                          _model
                                                              .choiceChipsValue,
                                                        );
                                                        _model.sortedVenuesByDistanceOutput4 =
                                                            await actions
                                                                .sortVenuesByDistance(
                                                          _model.venuesList4
                                                              ?.toList(),
                                                          currentUserLocationValue,
                                                        );
                                                        setState(() {
                                                          _model.venuesSortedByDistancePS = _model
                                                              .sortedVenuesByDistanceOutput4!
                                                              .toList()
                                                              .cast<
                                                                  VenuesRecord>();
                                                        });

                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            popularVenuesItem.viewsCount
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .cultured,
                                                  fontSize: 20.0,
                                                ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              currentUserLocationValue =
                                                  await getCurrentUserLocation(
                                                      defaultLocation:
                                                          LatLng(0.0, 0.0));

                                              await VenueViewsRecord.createDoc(
                                                      popularVenuesItem
                                                          .reference)
                                                  .set(
                                                      createVenueViewsRecordData(
                                                viewedBy: currentUserReference,
                                                viewedDate: getCurrentTimestamp,
                                                viewedFromLatlong:
                                                    currentUserLocationValue,
                                              ));

                                              await popularVenuesItem.reference
                                                  .update({
                                                ...createVenuesRecordData(
                                                  lastVenueViewDate:
                                                      getCurrentTimestamp,
                                                ),
                                                'views_count':
                                                    FieldValue.increment(1),
                                              });
                                            },
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.1,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.7, -0.8),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.2,
                                              height: 28.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black,
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  popularVenuesItem.regionName
                                                      .maybeHandleOverflow(
                                                    maxChars: 14,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .cultured,
                                                        fontSize: 9.0,
                                                      ),
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
                        );
                      },
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Just for You',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w800,
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
                                        fontFamily: 'Poppins',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w800,
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
                    StreamBuilder<List<VenuesRecord>>(
                      stream: queryVenuesRecord(
                        queryBuilder: (venuesRecord) => venuesRecord
                            .where('country_state_display_name',
                                isEqualTo: _model.choiceChipsValue)
                            .where('isActive', isEqualTo: true),
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
                        List<VenuesRecord> containerJustForYouVenuesRecordList =
                            snapshot.data!;
                        return Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.26,
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final venuesJustForYou = functions
                                  .shuffleCollection(
                                      containerJustForYouVenuesRecordList
                                          .toList())
                                  .toList()
                                  .take(4)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.fromLTRB(
                                  10.0,
                                  0,
                                  10.0,
                                  0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: venuesJustForYou.length,
                                itemBuilder: (context, venuesJustForYouIndex) {
                                  final venuesJustForYouItem =
                                      venuesJustForYou[venuesJustForYouIndex];
                                  return Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.white,
                                    elevation: 4.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(34.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.44,
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 4.0),
                                            child: Hero(
                                              tag: venuesJustForYouItem.image,
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(34.0),
                                                child: Image.network(
                                                  venuesJustForYouItem.image,
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.24,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.9),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 4.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
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
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(34.0),
                                                    bottomRight:
                                                        Radius.circular(34.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Container(
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .cultured,
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  functions
                                                      .upperCaseString(
                                                          venuesJustForYouItem
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .black,
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.7, -0.8),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.2,
                                              height: 28.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black,
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  venuesJustForYouItem
                                                      .regionName
                                                      .maybeHandleOverflow(
                                                    maxChars: 14,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .cultured,
                                                        fontSize: 9.0,
                                                      ),
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
                        );
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(34.0),
                            topRight: Radius.circular(34.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0),
                              ),
                              child: Image.network(
                                'https://res.cloudinary.com/rigcloudinary/image/upload/v1688608846/CellarDweller/App%20Images/French-Chateau_pydq7j.webp',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.22,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 14.0, 14.0, 14.0),
                                              child: Text(
                                                'Can\'t find your favourite Venue?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .cultured,
                                                          fontSize: 30.0,
                                                          letterSpacing: 0.1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Stack(
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 4.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .softPurple,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                10.0,
                                                                16.0,
                                                                10.0),
                                                    child: Text(
                                                      'Suggest venue',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]
                                        .divide(SizedBox(height: 10.0))
                                        .around(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
