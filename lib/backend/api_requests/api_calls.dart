import 'dart:convert';

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
      cache: false,
    );
  }
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
