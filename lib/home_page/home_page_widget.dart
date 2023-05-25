import '/auth/firebase_auth/auth_util.dart';
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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    _model = createModel(context, () => HomePageModel());

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
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).pinkPastel,
              FlutterFlowTheme.of(context).greenPastel
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Explore',
                        style:
                            FlutterFlowTheme.of(context).displaySmall.override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w800,
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
                                  4.0, 0.0, 4.0, 0.0),
                              child: StreamBuilder<List<RegionsRecord>>(
                                stream: queryRegionsRecord(
                                  queryBuilder: (regionsRecord) => regionsRecord
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
                                  List<RegionsRecord>
                                      choiceChipsRegionsRecordList =
                                      snapshot.data!;
                                  return FlutterFlowChoiceChips(
                                    options: choiceChipsRegionsRecordList
                                        .map((e) => e.name)
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
                                    multiselect: false,
                                    initialized:
                                        _model.choiceChipsValue != null,
                                    alignment: WrapAlignment.start,
                                    controller:
                                        _model.choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                      ['Adelaide Hills'],
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
                    stream: queryVenuesRecord(),
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
                              color: Color(0xFFF5F5F5),
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34.0),
                              ),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
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
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
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
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
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
                                    alignment: AlignmentDirectional(0.9, -0.64),
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .pinkPastel,
                                                    size: 16.0,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons
                                                        .favorite_border_rounded,
                                                    color: FlutterFlowTheme.of(
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
                          );
                        },
                      );
                    },
                  ),
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
                          'Explore',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(),
                  child:
                      PagedListView<DocumentSnapshot<Object?>?, VenuesRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder = (venuesRecord) => venuesRecord;
                      if (_model.pagingController != null) {
                        final query = queryBuilder(VenuesRecord.collection);
                        if (query != _model.pagingQuery) {
                          // The query has changed
                          _model.pagingQuery = query;
                          _model.streamSubscriptions
                              .forEach((s) => s?.cancel());
                          _model.streamSubscriptions.clear();
                          _model.pagingController!.refresh();
                        }
                        return _model.pagingController!;
                      }

                      _model.pagingController =
                          PagingController(firstPageKey: null);
                      _model.pagingQuery =
                          queryBuilder(VenuesRecord.collection);
                      _model.pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryVenuesRecordPage(
                          queryBuilder: (venuesRecord) => venuesRecord,
                          nextPageMarker: nextPageMarker,
                          pageSize: 10,
                          isStream: true,
                        ).then((page) {
                          _model.pagingController!.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                          final streamSubscription =
                              page.dataStream?.listen((data) {
                            data.forEach((item) {
                              final itemIndexes = _model
                                  .pagingController!.itemList!
                                  .asMap()
                                  .map((k, v) => MapEntry(v.reference.id, k));
                              final index = itemIndexes[item.reference.id];
                              final items = _model.pagingController!.itemList!;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _model.pagingController!.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _model.streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _model.pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<VenuesRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: CircularProgressIndicator(
                            color: Color(0xFFB19CD9),
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewVenuesRecord =
                            _model.pagingController!.itemList![listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(34.0),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional(1.0, 0.9),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 6.0, 6.0, 6.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(34.0),
                                        child: Image.network(
                                          listViewVenuesRecord.image,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: 200.0,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 6.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100.0,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 6.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                functions.upperCaseString(
                                                    listViewVenuesRecord.name),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .cultured,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.9, -0.64),
                                                child: Container(
                                                  width: 50.0,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width: 34.0,
                                                          height: 34.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x7F000000),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: ToggleIcon(
                                                            onPressed:
                                                                () async {
                                                              final isFavouritedByElement =
                                                                  currentUserReference;
                                                              final isFavouritedByUpdate = listViewVenuesRecord
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
                                                              final venuesUpdateData =
                                                                  {
                                                                'is_favourited_by':
                                                                    isFavouritedByUpdate,
                                                              };
                                                              await listViewVenuesRecord
                                                                  .reference
                                                                  .update(
                                                                      venuesUpdateData);
                                                            },
                                                            value: listViewVenuesRecord
                                                                .isFavouritedBy
                                                                .contains(
                                                                    currentUserReference),
                                                            onIcon: Icon(
                                                              Icons
                                                                  .favorite_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .pinkPastel,
                                                              size: 16.0,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons
                                                                  .favorite_border_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .cultured,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (listViewVenuesRecord
                                                                .isFavouritedBy
                                                                .contains(
                                                                    currentUserReference)) {
                                                              final venuesUpdateData1 =
                                                                  {
                                                                'is_favourited_by':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  currentUserReference
                                                                ]),
                                                              };
                                                              await listViewVenuesRecord
                                                                  .reference
                                                                  .update(
                                                                      venuesUpdateData1);
                                                            } else {
                                                              final venuesUpdateData2 =
                                                                  {
                                                                'is_favourited_by':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  currentUserReference
                                                                ]),
                                                              };
                                                              await listViewVenuesRecord
                                                                  .reference
                                                                  .update(
                                                                      venuesUpdateData2);
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 34.0,
                                                            height: 34.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
