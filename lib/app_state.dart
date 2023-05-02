import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _newTourName = '';
  String get newTourName => _newTourName;
  set newTourName(String _value) {
    _newTourName = _value;
  }

  String _newTourRegionID = '';
  String get newTourRegionID => _newTourRegionID;
  set newTourRegionID(String _value) {
    _newTourRegionID = _value;
  }

  String _newTourRegionName = '';
  String get newTourRegionName => _newTourRegionName;
  set newTourRegionName(String _value) {
    _newTourRegionName = _value;
  }

  int _newTourNoOfPassengers = 0;
  int get newTourNoOfPassengers => _newTourNoOfPassengers;
  set newTourNoOfPassengers(int _value) {
    _newTourNoOfPassengers = _value;
  }

  double _newTourPricePP = 0.0;
  double get newTourPricePP => _newTourPricePP;
  set newTourPricePP(double _value) {
    _newTourPricePP = _value;
  }

  DocumentReference? _newTourRegionRef;
  DocumentReference? get newTourRegionRef => _newTourRegionRef;
  set newTourRegionRef(DocumentReference? _value) {
    _newTourRegionRef = _value;
  }

  DocumentReference? _lunchVenueReff;
  DocumentReference? get lunchVenueReff => _lunchVenueReff;
  set lunchVenueReff(DocumentReference? _value) {
    _lunchVenueReff = _value;
  }

  int _perPersonTourCostTotal = 0;
  int get perPersonTourCostTotal => _perPersonTourCostTotal;
  set perPersonTourCostTotal(int _value) {
    _perPersonTourCostTotal = _value;
  }

  String _perPersonTourCostString = '';
  String get perPersonTourCostString => _perPersonTourCostString;
  set perPersonTourCostString(String _value) {
    _perPersonTourCostString = _value;
  }

  int _largeGroupVenueEarlySeatingSelectedCount = 0;
  int get largeGroupVenueEarlySeatingSelectedCount =>
      _largeGroupVenueEarlySeatingSelectedCount;
  set largeGroupVenueEarlySeatingSelectedCount(int _value) {
    _largeGroupVenueEarlySeatingSelectedCount = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
