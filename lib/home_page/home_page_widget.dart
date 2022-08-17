import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  PagingController<DocumentSnapshot?, VenuesRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  String? choiceChipsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'iconButtonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).purplePastel,
              FlutterFlowTheme.of(context).greenPastel
            ],
            stops: [0, 1],
            begin: AlignmentDirectional(0, -1),
            end: AlignmentDirectional(0, 1),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Explore',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 50,
                        buttonSize: 46,
                        fillColor: Color(0x00F4F4F4),
                        icon: Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ).animated(
                          [animationsMap['iconButtonOnPageLoadAnimation']!]),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Wineries, Breweries and  Distilleries',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0x00F4F4F4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
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
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .purplePastel,
                                        ),
                                      ),
                                    );
                                  }
                                  List<RegionsRecord>
                                      choiceChipsRegionsRecordList =
                                      snapshot.data!;
                                  return FlutterFlowChoiceChips(
                                    initiallySelected: choiceChipsValue != null
                                        ? [choiceChipsValue!]
                                        : ['Adelaide Hills'],
                                    options: choiceChipsRegionsRecordList
                                        .map((e) => e.name!)
                                        .toList()
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => choiceChipsValue = val?.first),
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).black,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                      iconColor: Colors.white,
                                      iconSize: 18,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 4, 6, 4),
                                      elevation: 4,
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor: Colors.white,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF262D34),
                                          ),
                                      iconColor: Color(0xFF262D34),
                                      iconSize: 18,
                                      labelPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 4, 10, 4),
                                      elevation: 2,
                                    ),
                                    chipSpacing: 10,
                                    multiselect: false,
                                    initialized: choiceChipsValue != null,
                                    alignment: WrapAlignment.start,
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          'Featured',
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0, 0),
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Text(
                              'See All',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Nunito',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.26,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<VenuesRecord>>(
                    stream: queryVenuesRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).purplePastel,
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
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34),
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 6, 6, 6),
                                    child: Hero(
                                      tag: listViewFeaturedVenuesRecord.image!,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(34),
                                        child: Image.network(
                                          listViewFeaturedVenuesRecord.image!,
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
                                    alignment: AlignmentDirectional(0, 0.9),
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
                                          stops: [0, 1],
                                          begin: AlignmentDirectional(0, -1),
                                          end: AlignmentDirectional(0, 1),
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(34),
                                          bottomRight: Radius.circular(34),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
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
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .cultured,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.9, -0.64),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          100, 0, 0, 100),
                                      child: Container(
                                        height: 40,
                                        child: Stack(
                                          alignment: AlignmentDirectional(0, 0),
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: 30,
                                                height: 30,
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
                                                                .isFavouritedBy!
                                                                .toList()
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
                                                      .isFavouritedBy!
                                                      .toList()
                                                      .contains(
                                                          currentUserReference),
                                                  onIcon: Icon(
                                                    Icons.favorite_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .purplePastel,
                                                    size: 16,
                                                  ),
                                                  offIcon: Icon(
                                                    Icons
                                                        .favorite_border_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .cultured,
                                                    size: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                if (listViewFeaturedVenuesRecord
                                                    .isFavouritedBy!
                                                    .toList()
                                                    .contains(
                                                        currentUserReference)) {
                                                  final venuesUpdateData = {
                                                    'is_favourited_by':
                                                        FieldValue.arrayRemove([
                                                      currentUserReference
                                                    ]),
                                                  };
                                                  await listViewFeaturedVenuesRecord
                                                      .reference
                                                      .update(venuesUpdateData);
                                                } else {
                                                  final venuesUpdateData = {
                                                    'is_favourited_by':
                                                        FieldValue.arrayUnion([
                                                      currentUserReference
                                                    ]),
                                                  };
                                                  await listViewFeaturedVenuesRecord
                                                      .reference
                                                      .update(venuesUpdateData);
                                                }
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          'Explore',
                          style:
                              FlutterFlowTheme.of(context).subtitle1.override(
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
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0, 0),
                            child: Stack(
                              alignment: AlignmentDirectional(0, 0),
                              children: [
                                Text(
                                  'See All',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Nunito',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                Container(
                                  width: 100,
                                  height: 100,
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
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(),
                  child:
                      PagedListView<DocumentSnapshot<Object?>?, VenuesRecord>(
                    pagingController: () {
                      final Query<Object?> Function(Query<Object?>)
                          queryBuilder = (venuesRecord) => venuesRecord;
                      if (_pagingController != null) {
                        final query = queryBuilder(VenuesRecord.collection);
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;
                          _streamSubscriptions.forEach((s) => s?.cancel());
                          _streamSubscriptions.clear();
                          _pagingController!.refresh();
                        }
                        return _pagingController!;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery = queryBuilder(VenuesRecord.collection);
                      _pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        queryVenuesRecordPage(
                          queryBuilder: (venuesRecord) => venuesRecord,
                          nextPageMarker: nextPageMarker,
                          pageSize: 25,
                          isStream: true,
                        ).then((page) {
                          _pagingController!.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                          final streamSubscription =
                              page.dataStream?.listen((data) {
                            final itemIndexes = _pagingController!.itemList!
                                .asMap()
                                .map((k, v) => MapEntry(v.reference.id, k));
                            data.forEach((item) {
                              final index = itemIndexes[item.reference.id];
                              final items = _pagingController!.itemList!;
                              if (index != null) {
                                items.replaceRange(index, index + 1, [item]);
                                _pagingController!.itemList = {
                                  for (var item in items) item.reference: item
                                }.values.toList();
                              }
                            });
                            setState(() {});
                          });
                          _streamSubscriptions.add(streamSubscription);
                        });
                      });
                      return _pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<VenuesRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).purplePastel,
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewVenuesRecord =
                            _pagingController!.itemList![listViewIndex];
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(34),
                                ),
                                child: Stack(
                                  alignment: AlignmentDirectional(1, 0.9),
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 6, 6, 6),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(34),
                                        child: Image.network(
                                          listViewVenuesRecord.image!,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 200,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 0, 6, 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Color(0xE6000000)
                                            ],
                                            stops: [0, 1],
                                            begin: AlignmentDirectional(0, -1),
                                            end: AlignmentDirectional(0, 1),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(34),
                                            bottomRight: Radius.circular(34),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6, 0, 6, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
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
                                                        .bodyText1
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
                                                  width: 50,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Container(
                                                          width: 34,
                                                          height: 34,
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
                                                                      .isFavouritedBy!
                                                                      .toList()
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
                                                                .isFavouritedBy!
                                                                .toList()
                                                                .contains(
                                                                    currentUserReference),
                                                            onIcon: Icon(
                                                              Icons
                                                                  .favorite_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .purplePastel,
                                                              size: 16,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons
                                                                  .favorite_border_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .cultured,
                                                              size: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            if (listViewVenuesRecord
                                                                .isFavouritedBy!
                                                                .toList()
                                                                .contains(
                                                                    currentUserReference)) {
                                                              final venuesUpdateData =
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
                                                                      venuesUpdateData);
                                                            } else {
                                                              final venuesUpdateData =
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
                                                                      venuesUpdateData);
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 34,
                                                            height: 34,
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
