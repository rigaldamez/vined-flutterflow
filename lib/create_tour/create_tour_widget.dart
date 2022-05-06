import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/create_new_tour_empty_state_widget.dart';
import '../create_new_tour1/create_new_tour1_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CreateTourWidget extends StatefulWidget {
  const CreateTourWidget({
    Key key,
    this.state,
  }) : super(key: key);

  final dynamic state;

  @override
  _CreateTourWidgetState createState() => _CreateTourWidgetState();
}

class _CreateTourWidgetState extends State<CreateTourWidget> {
  PagingController<DocumentSnapshot, ToursRecord> _pagingController;
  Query _pagingQuery;

  TextEditingController tourNameTextFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    tourNameTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
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
          padding: EdgeInsetsDirectional.fromSTEB(0, 26, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Tours',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Text(
                                    'Tour name',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.98,
                                height: 54,
                                decoration: BoxDecoration(
                                  color: Color(0x00EEEEEE),
                                  borderRadius: BorderRadius.circular(34),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    controller: tourNameTextFieldController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'eg; Wine Time Fun!',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(34),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(34),
                                      ),
                                      filled: true,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 0, 0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.94,
                            child: Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 58,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 60,
                                        color: Color(0xFF333333),
                                        spreadRadius: 1,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(34),
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (!(functions.isStringNotEmpty(
                                          tourNameTextFieldController.text))) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Tour name can not be empty',
                                              style: TextStyle(
                                                color: Color(0xFFF4F4F4),
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .black,
                                          ),
                                        );
                                        return;
                                      } else {
                                        setState(() => FFAppState()
                                                .newTourName =
                                            tourNameTextFieldController.text);
                                      }

                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          duration: Duration(milliseconds: 150),
                                          reverseDuration:
                                              Duration(milliseconds: 150),
                                          child: CreateNewTour1Widget(),
                                        ),
                                      );
                                    },
                                    text: 'Create Tour',
                                    options: FFButtonOptions(
                                      width: 390,
                                      height: 58,
                                      color: FlutterFlowTheme.of(context).black,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 34,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Text(
                              'Join a friend\'s tour',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                            InkWell(
                              onTap: () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Navigating to screen...',
                                      style: TextStyle(
                                        color: Color(0xFFEEEEEE),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).black,
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 20, 0),
                      child: Text(
                        'My tours ',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.53,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      color: Color(0x4C000000),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(42),
                    topRight: Radius.circular(42),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 2, 0),
                  child: PagedListView<DocumentSnapshot<Object>, ToursRecord>(
                    pagingController: () {
                      final Query<Object> Function(Query<Object>) queryBuilder =
                          (toursRecord) => toursRecord
                              .where('uid', isEqualTo: currentUserReference)
                              .orderBy('tour_date', descending: true);
                      if (_pagingController != null) {
                        final query = queryBuilder(ToursRecord.collection);
                        if (query != _pagingQuery) {
                          // The query has changed
                          _pagingQuery = query;

                          _pagingController.refresh();
                        }
                        return _pagingController;
                      }

                      _pagingController = PagingController(firstPageKey: null);
                      _pagingQuery = queryBuilder(ToursRecord.collection);
                      _pagingController
                          .addPageRequestListener((nextPageMarker) {
                        queryToursRecordPage(
                          queryBuilder: (toursRecord) => toursRecord
                              .where('uid', isEqualTo: currentUserReference)
                              .orderBy('tour_date', descending: true),
                          nextPageMarker: nextPageMarker,
                          pageSize: 25,
                          isStream: false,
                        ).then((page) {
                          _pagingController.appendPage(
                            page.data,
                            page.nextPageMarker,
                          );
                        });
                      });
                      return _pagingController;
                    }(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<ToursRecord>(
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
                      noItemsFoundIndicatorBuilder: (_) =>
                          CreateNewTourEmptyStateWidget(),
                      itemBuilder: (context, _, listViewIndex) {
                        final listViewToursRecord =
                            _pagingController.itemList[listViewIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.98,
                              height: MediaQuery.of(context).size.height * 0.18,
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.white,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: StreamBuilder<RegionsRecord>(
                                        stream: RegionsRecord.getDocument(
                                            listViewToursRecord.regionID),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .purplePastel,
                                                ),
                                              ),
                                            );
                                          }
                                          final rowRegionsRecord =
                                              snapshot.data;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 4, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 4, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.34,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.14,
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              28),
                                                                      child: Image
                                                                          .network(
                                                                        rowRegionsRecord
                                                                            .image,
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.34,
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.2,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.34,
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.2,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x56000000),
                                                                        borderRadius:
                                                                            BorderRadius.circular(28),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          rowRegionsRecord
                                                                              .name,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFFF4F4F4),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          6,
                                                                          0,
                                                                          4),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          listViewToursRecord
                                                                              .tourName
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                16,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .people_outline,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          listViewToursRecord
                                                                              .passengers
                                                                              .toString()
                                                                              .maybeHandleOverflow(
                                                                                maxChars: 25,
                                                                                replacement: '…',
                                                                              ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF333333),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .calendar_today_outlined,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                              'MMMMEEEEd',
                                                                              listViewToursRecord.tourDate),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .person_pin_circle_outlined,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            16,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          listViewToursRecord
                                                                              .pickupAddress
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                20,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF333333),
                                                                                fontSize: 12,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(-0.88, -0.58),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0x80000000),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.directions_bus_rounded,
                                              color: Color(0xFFF4F4F4),
                                              size: 18,
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
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
