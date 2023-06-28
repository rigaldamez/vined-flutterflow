import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GETGeolocationFORAddressCall {
  static Future<ApiCallResponse> call({
    String? address = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Geolocation FOR Address',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=AIzaSyA1rjhxywp_z2GbG-GNbGMnNMiB-YLH2C8',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GETDistanceBetwenTwoGeopointsCall {
  static Future<ApiCallResponse> call({
    String? destinations = '',
    String? origins = '-34.92834680474008, 138.60001165070216',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Distance betwen two geopoints',
      apiUrl: 'https://maps.googleapis.com/maps/api/distancematrix/json?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyA1rjhxywp_z2GbG-GNbGMnNMiB-YLH2C8",
        'destinations': destinations,
        'origins': origins,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic travelDistance(dynamic response) => getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
      );
  static dynamic travelTime(dynamic response) => getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.text''',
      );
  static dynamic responseStatus(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class GETMapboxDrivingDirectionsCall {
  static Future<ApiCallResponse> call({
    String? coordinates =
        '151.2149685,-33.857158999999996;151.069576,-33.846503',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Mapbox driving directions',
      apiUrl:
          'https://api.mapbox.com/directions/v5/mapbox/driving/${coordinates}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'coordinates': coordinates,
        'annotations': "distance,duration",
        'geometries': "geojson",
        'overview': "full",
        'access_token':
            "pk.eyJ1IjoicmlnYWxkYW1leiIsImEiOiJjbGo4MXByMzAwdnVpM2VwMjB4dnIyNTFtIn0.M07_W0GyVQVWuILkYCt86g",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic duration(dynamic response) => getJsonField(
        response,
        r'''$.routes[:].duration''',
      );
  static dynamic distance(dynamic response) => getJsonField(
        response,
        r'''$.routes[:].distance''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
