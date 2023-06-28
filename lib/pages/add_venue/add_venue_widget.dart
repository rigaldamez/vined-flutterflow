import '/backend/backend.dart';
import '/components/select_experience_btmsheet/select_experience_btmsheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'add_venue_model.dart';
export 'add_venue_model.dart';

class AddVenueWidget extends StatefulWidget {
  const AddVenueWidget({
    Key? key,
    this.tourReff,
  }) : super(key: key);

  final DocumentReference? tourReff;

  @override
  _AddVenueWidgetState createState() => _AddVenueWidgetState();
}

class _AddVenueWidgetState extends State<AddVenueWidget> {
  late AddVenueModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddVenueModel());

    _model.textController ??= TextEditingController();
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: StreamBuilder<ToursRecord>(
          stream: ToursRecord.getDocument(widget.tourReff!),
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
            final containerToursRecord = snapshot.data!;
            return Container(
              width: double.infinity,
              height: double.infinity,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: StreamBuilder<List<AppConfigRecord>>(
                  stream: queryAppConfigRecord(
                    singleRecord: true,
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
                    List<AppConfigRecord> columnAppConfigRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final columnAppConfigRecord =
                        columnAppConfigRecordList.isNotEmpty
                            ? columnAppConfigRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 60.0,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.black,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                              Text(
                                'Add venue',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w800,
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
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Search venue',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x19000000),
                                        suffixIcon: _model
                                                .textController!.text.isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.textController
                                                      ?.clear();
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 20.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                      textAlign: TextAlign.start,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: PagedListView<DocumentSnapshot<Object?>?,
                                VenuesRecord>(
                              pagingController: () {
                                final Query<Object?> Function(Query<Object?>)
                                    queryBuilder = (venuesRecord) =>
                                        venuesRecord.where('region_Ref',
                                            isEqualTo:
                                                containerToursRecord.regionID);
                                if (_model.pagingController != null) {
                                  final query =
                                      queryBuilder(VenuesRecord.collection);
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
                                    queryBuilder: (venuesRecord) =>
                                        venuesRecord.where('region_Ref',
                                            isEqualTo:
                                                containerToursRecord.regionID),
                                    nextPageMarker: nextPageMarker,
                                    pageSize: 25,
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
                                            .map((k, v) =>
                                                MapEntry(v.reference.id, k));
                                        final index =
                                            itemIndexes[item.reference.id];
                                        final items =
                                            _model.pagingController!.itemList!;
                                        if (index != null) {
                                          items.replaceRange(
                                              index, index + 1, [item]);
                                          _model.pagingController!.itemList = {
                                            for (var item in items)
                                              item.reference: item
                                          }.values.toList();
                                        }
                                      });
                                      setState(() {});
                                    });
                                    _model.streamSubscriptions
                                        .add(streamSubscription);
                                  });
                                });
                                return _model.pagingController!;
                              }(),
                              padding: EdgeInsets.zero,
                              reverse: false,
                              scrollDirection: Axis.vertical,
                              builderDelegate:
                                  PagedChildBuilderDelegate<VenuesRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: CircularProgressIndicator(
                                      color: Color(0xFFB19CD9),
                                    ),
                                  ),
                                ),

                                itemBuilder: (context, _, listViewIndex) {
                                  final listViewVenuesRecord = _model
                                      .pagingController!
                                      .itemList![listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6.0, 0.0, 0.0, 6.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.94,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    1.0,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.white,
                                                  elevation: 14.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28.0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    6.0,
                                                                    6.0,
                                                                    6.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      28.0),
                                                          child: Image.network(
                                                            listViewVenuesRecord
                                                                .image,
                                                            width: 150.0,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      10.0,
                                                                      6.0,
                                                                      10.0),
                                                          child: Container(
                                                            width: 170.0,
                                                            height: 130.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          28.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          50.0,
                                                                          0.0),
                                                              child: Container(
                                                                height: 130.0,
                                                                child: Stack(
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              functions.upperCaseString(listViewVenuesRecord.name).maybeHandleOverflow(
                                                                                    maxChars: 20,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              textAlign: TextAlign.start,
                                                                              maxLines: 3,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).black,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                                                                maxLines: 3,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 10.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.remove_red_eye_rounded,
                                                                                color: Colors.black,
                                                                                size: 18.0,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '143',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 9.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Icon(
                                                                                  Icons.star_rounded,
                                                                                  color: Colors.black,
                                                                                  size: 18.0,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '5.0',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 9.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.89, 0.0),
                                                        child: FutureBuilder<
                                                            List<
                                                                SelectedVenuesRecord>>(
                                                          future:
                                                              querySelectedVenuesRecordOnce(
                                                            queryBuilder: (selectedVenuesRecord) =>
                                                                selectedVenuesRecord.where(
                                                                    'tourRef',
                                                                    isEqualTo:
                                                                        widget
                                                                            .tourReff),
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
                                                            List<SelectedVenuesRecord>
                                                                containerSelectedVenuesRecordList =
                                                                snapshot.data!;
                                                            return Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (functions
                                                                      .isTourInDraftState(
                                                                          containerToursRecord
                                                                              .tourState)) {
                                                                    if (functions.isTourStopsCountLessThanLimitAllowed(
                                                                        containerToursRecord
                                                                            .venues
                                                                            .toList(),
                                                                        columnAppConfigRecord)) {
                                                                      if (functions.meetsVenueCapacity(
                                                                          containerToursRecord,
                                                                          listViewVenuesRecord
                                                                              .capacity)) {
                                                                        if (functions.isVenueAlreadyAdded(
                                                                            containerSelectedVenuesRecordList.toList(),
                                                                            listViewVenuesRecord.reference)) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Already Added'),
                                                                                content: Text('This venue is already in your itinerary'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        } else {
                                                                          if (listViewVenuesRecord
                                                                              .isLunchVenueOnly) {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 250.0,
                                                                                      child: SelectExperienceBtmsheetWidget(
                                                                                        venueRec: listViewVenuesRecord,
                                                                                        tourReff: widget.tourReff,
                                                                                        regionReff: containerToursRecord.regionID,
                                                                                        tourDoc: containerToursRecord,
                                                                                        isLargeGroupEarlySeatingOnlyVenue: false,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));
                                                                          } else {
                                                                            if (functions.isIntegerOneSmallOrEqualThanIntegerTwo(containerToursRecord.passengers,
                                                                                columnAppConfigRecord!.largeGroupThreshold)) {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Colors.transparent,
                                                                                barrierColor: Color(0x00000000),
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return GestureDetector(
                                                                                    onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: 250.0,
                                                                                        child: SelectExperienceBtmsheetWidget(
                                                                                          venueRec: listViewVenuesRecord,
                                                                                          tourReff: widget.tourReff,
                                                                                          regionReff: containerToursRecord.regionID,
                                                                                          tourDoc: containerToursRecord,
                                                                                          isLargeGroupEarlySeatingOnlyVenue: false,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            } else {
                                                                              if (functions.isIntegerOneSmallerThanIntegerTwoOrArguement3IsTrue(containerToursRecord.largeGroupVenueEarlySeatingCount, columnAppConfigRecord!.largeGroupVenuesEarlySeatingThreshold, listViewVenuesRecord.largeGroupEarlySeatingOnly)) {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.of(context).viewInsets,
                                                                                        child: Container(
                                                                                          height: 250.0,
                                                                                          child: SelectExperienceBtmsheetWidget(
                                                                                            venueRec: listViewVenuesRecord,
                                                                                            tourReff: widget.tourReff,
                                                                                            regionReff: containerToursRecord.regionID,
                                                                                            tourDoc: containerToursRecord,
                                                                                            isLargeGroupEarlySeatingOnlyVenue: true,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              } else {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: Text('Can\'t add venue'),
                                                                                      content: Text('You already have an \'ealy-seating only\' venue for large groups in your itinerary'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Group Capacity Exceeded'),
                                                                              content: Text('Your tour group exceeds the max group capacity set by this venue'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Venue Limit Reached'),
                                                                            content:
                                                                                Text('You have reached the max number venues allowed'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    }
                                                                  }
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .black,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      if (!functions.isVenueOpen(
                                                          listViewVenuesRecord
                                                              .openDays
                                                              .toList(),
                                                          containerToursRecord))
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x80000000),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        28.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'CLOSED',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .cultured,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      StreamBuilder<
                                                          List<
                                                              SelectedVenuesRecord>>(
                                                        stream:
                                                            querySelectedVenuesRecord(
                                                          queryBuilder: (selectedVenuesRecord) =>
                                                              selectedVenuesRecord
                                                                  .where(
                                                                      'tourRef',
                                                                      isEqualTo:
                                                                          widget
                                                                              .tourReff),
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
                                                          List<SelectedVenuesRecord>
                                                              containerSelectSelectedVenuesRecordList =
                                                              snapshot.data!;
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (functions
                                                                  .isTourInDraftState(
                                                                      containerToursRecord
                                                                          .tourState)) {
                                                                if (functions.isTourStopsCountLessThanLimitAllowed(
                                                                    containerToursRecord
                                                                        .venues
                                                                        .toList(),
                                                                    columnAppConfigRecord)) {
                                                                  if (functions.meetsVenueCapacity(
                                                                      containerToursRecord,
                                                                      listViewVenuesRecord
                                                                          .capacity)) {
                                                                    if (functions.isVenueAlreadyAdded(
                                                                        containerSelectSelectedVenuesRecordList
                                                                            .toList(),
                                                                        listViewVenuesRecord
                                                                            .reference)) {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Already Added'),
                                                                            content:
                                                                                Text('This venue is already in your itinerary'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    } else {
                                                                      if (listViewVenuesRecord
                                                                          .isLunchVenueOnly) {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          barrierColor:
                                                                              Color(0x00000000),
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return GestureDetector(
                                                                              onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                              child: Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: Container(
                                                                                  height: 250.0,
                                                                                  child: SelectExperienceBtmsheetWidget(
                                                                                    venueRec: listViewVenuesRecord,
                                                                                    tourReff: widget.tourReff,
                                                                                    regionReff: containerToursRecord.regionID,
                                                                                    tourDoc: containerToursRecord,
                                                                                    isLargeGroupEarlySeatingOnlyVenue: false,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      } else {
                                                                        if (functions.isIntegerOneSmallOrEqualThanIntegerTwo(
                                                                            containerToursRecord.passengers,
                                                                            columnAppConfigRecord!.largeGroupThreshold)) {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            barrierColor:
                                                                                Color(0x00000000),
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return GestureDetector(
                                                                                onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                child: Padding(
                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                  child: Container(
                                                                                    height: 250.0,
                                                                                    child: SelectExperienceBtmsheetWidget(
                                                                                      venueRec: listViewVenuesRecord,
                                                                                      tourReff: widget.tourReff,
                                                                                      regionReff: containerToursRecord.regionID,
                                                                                      tourDoc: containerToursRecord,
                                                                                      isLargeGroupEarlySeatingOnlyVenue: false,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        } else {
                                                                          if (functions.isIntegerOneSmallerThanIntegerTwoOrArguement3IsTrue(
                                                                              containerToursRecord.largeGroupVenueEarlySeatingCount,
                                                                              columnAppConfigRecord!.largeGroupVenuesEarlySeatingThreshold,
                                                                              listViewVenuesRecord.largeGroupEarlySeatingOnly)) {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: Color(0x00000000),
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 250.0,
                                                                                      child: SelectExperienceBtmsheetWidget(
                                                                                        venueRec: listViewVenuesRecord,
                                                                                        tourReff: widget.tourReff,
                                                                                        regionReff: containerToursRecord.regionID,
                                                                                        tourDoc: containerToursRecord,
                                                                                        isLargeGroupEarlySeatingOnlyVenue: true,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));
                                                                          } else {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Can\'t add venue'),
                                                                                  content: Text('You already have an \'ealy-seating only\' venue for large groups in your itinerary'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Group Capacity Exceeded'),
                                                                          content:
                                                                              Text('Your tour group exceeds the max group capacity set by this venue'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  }
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Venue Limit Reached'),
                                                                        content:
                                                                            Text('You have reached the max number venues allowed'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                }
                                                              }
                                                            },
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  1.0,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
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
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
