import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GETGeolocationFORAddressCall {
  static Future<ApiCallResponse> call({
    String address = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GET Geolocation FOR Address',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=AIzaSyA1rjhxywp_z2GbG-GNbGMnNMiB-YLH2C8',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
