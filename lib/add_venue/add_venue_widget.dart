import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AddVenueWidget extends StatefulWidget {
  const AddVenueWidget({
    Key key,
    this.tourID,
  }) : super(key: key);

  final DocumentReference tourID;

  @override
  _AddVenueWidgetState createState() => _AddVenueWidgetState();
}

class _AddVenueWidgetState extends State<AddVenueWidget> {
  PagingController<DocumentSnapshot, VenuesRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: StreamBuilder<ToursRecord>(
          stream: ToursRecord.getDocument(widget.tourID),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: SpinKitDualRing(
                    color: FlutterFlowTheme.of(context).purplePastel,
                    size: 20,
                  ),
                ),
              );
            }
            final containerToursRecord = snapshot.data;
            return Container(
              width: double.infinity,
              height: double.infinity,
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: StreamBuilder<List<AppConfigRecord>>(
                  stream: queryAppConfigRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: SpinKitDualRing(
                            color: FlutterFlowTheme.of(context).purplePastel,
                            size: 20,
                          ),
                        ),
                      );
                    }
                    List<AppConfigRecord> columnAppConfigRecordList =
                        snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
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
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                              Text(
                                'Add venue',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 24,
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
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(),
                                    child: TextFormField(
                                      controller: textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'textController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Search venue',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x19000000),
                                        suffixIcon: textController
                                                .text.isNotEmpty
                                            ? InkWell(
                                                onTap: () => setState(
                                                  () => textController?.clear(),
                                                ),
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 20,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                          ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEEEEEE),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 14,
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: PagedListView<DocumentSnapshot<Object>,
                                VenuesRecord>(
                              pagingController: () {
                                final Query<Object> Function(Query<Object>)
                                    queryBuilder = (venuesRecord) =>
                                        venuesRecord.where('region_Ref',
                                            isEqualTo:
                                                containerToursRecord.regionID);
                                if (_pagingController != null) {
                                  final query =
                                      queryBuilder(VenuesRecord.collection);
                                  if (query != _pagingQuery) {
                                    // The query has changed
                                    _pagingQuery = query;
                                    _streamSubscriptions
                                        .forEach((s) => s?.cancel());
                                    _streamSubscriptions.clear();
                                    _pagingController.refresh();
                                  }
                                  return _pagingController;
                                }

                                _pagingController =
                                    PagingController(firstPageKey: null);
                                _pagingQuery =
                                    queryBuilder(VenuesRecord.collection);
                                _pagingController
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
                                    _pagingController.appendPage(
                                      page.data,
                                      page.nextPageMarker,
                                    );
                                    final streamSubscription =
                                        page.dataStream?.listen((data) {
                                      final itemIndexes = _pagingController
                                          .itemList
                                          .asMap()
                                          .map((k, v) =>
                                              MapEntry(v.reference.id, k));
                                      data.forEach((item) {
                                        final index =
                                            itemIndexes[item.reference.id];
                                        if (index != null) {
                                          _pagingController.itemList
                                              .replaceRange(
                                                  index, index + 1, [item]);
                                        }
                                      });
                                      setState(() {});
                                    });
                                    _streamSubscriptions
                                        .add(streamSubscription);
                                  });
                                });
                                return _pagingController;
                              }(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              builderDelegate:
                                  PagedChildBuilderDelegate<VenuesRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: SpinKitDualRing(
                                      color: FlutterFlowTheme.of(context)
                                          .purplePastel,
                                      size: 20,
                                    ),
                                  ),
                                ),

                                itemBuilder: (context, _, listViewIndex) {
                                  final listViewVenuesRecord =
                                      _pagingController.itemList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        6, 0, 0, 6),
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
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(28),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 4, 0, 0),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: Colors.white,
                                                  elevation: 14,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            28),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6, 6, 6, 6),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(28),
                                                          child: Image.network(
                                                            listViewVenuesRecord
                                                                .image,
                                                            width: 150,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6,
                                                                      10,
                                                                      6,
                                                                      10),
                                                          child: Container(
                                                            width: 170,
                                                            height: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          28),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          50,
                                                                          0),
                                                              child: Container(
                                                                height: 130,
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
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).black,
                                                                                    fontSize: 16,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                              child: Text(
                                                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                                                                maxLines: 3,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 10,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              4,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.remove_red_eye_rounded,
                                                                                color: Colors.black,
                                                                                size: 18,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                child: Text(
                                                                                  '143',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 9,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                child: Icon(
                                                                                  Icons.star_rounded,
                                                                                  color: Colors.black,
                                                                                  size: 18,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                child: Text(
                                                                                  '5.0',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        fontSize: 9,
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
                                                                0.89, 0),
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
                                                                            .tourID),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 20,
                                                                  height: 20,
                                                                  child:
                                                                      SpinKitDualRing(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .purplePastel,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<SelectedVenuesRecord>
                                                                containerSelectedVenuesRecordList =
                                                                snapshot.data;
                                                            return Container(
                                                              width: 30,
                                                              height: 30,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .black,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: InkWell(
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
                                                                          final selectedVenuesCreateData =
                                                                              createSelectedVenuesRecordData(
                                                                            venueRef:
                                                                                listViewVenuesRecord.reference,
                                                                            tourRef:
                                                                                containerToursRecord.reference,
                                                                            addedByUid:
                                                                                currentUserReference,
                                                                            isLunchVenue:
                                                                                false,
                                                                            tastingFee:
                                                                                listViewVenuesRecord.tastingFee,
                                                                            addedDate:
                                                                                getCurrentTimestamp,
                                                                            bookingReference:
                                                                                '',
                                                                            regionID:
                                                                                containerToursRecord.regionID,
                                                                            reservationTime:
                                                                                functions.epochTime(),
                                                                          );
                                                                          await SelectedVenuesRecord
                                                                              .collection
                                                                              .doc()
                                                                              .set(selectedVenuesCreateData);

                                                                          final toursUpdateData =
                                                                              {
                                                                            'venues':
                                                                                FieldValue.arrayUnion([
                                                                              listViewVenuesRecord.reference
                                                                            ]),
                                                                          };
                                                                          await widget
                                                                              .tourID
                                                                              .update(toursUpdateData);
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Venue added to tour',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).cultured,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontSize: 12,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 2000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).black,
                                                                            ),
                                                                          );
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
                                                                      .add_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .cultured,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.9, 0.7),
                                                        child: Container(
                                                          width: 34,
                                                          height: 34,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF5F5F5),
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
                                                                .isFavouritedBy
                                                                .toList()
                                                                .contains(
                                                                    currentUserReference),
                                                            onIcon: Icon(
                                                              Icons
                                                                  .food_bank_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .salmonPink,
                                                              size: 18,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons
                                                                  .food_bank_outlined,
                                                              color:
                                                                  Colors.black,
                                                              size: 18,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (!(functions.isVenueOpen(
                                                              listViewVenuesRecord
                                                                  .openDays
                                                                  .toList(),
                                                              containerToursRecord)) ??
                                                          true)
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              1,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x80000000),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        28),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Text(
                                                              'CLOSED',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .cultured,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
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
