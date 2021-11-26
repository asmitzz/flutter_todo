import 'dart:convert';

import 'http_service_helper.dart';

class HttpService extends HttpServiceHelper {
  ///[requestType] can be GET, POST, PUT, PATCH, DELETE
  Future<Map<String, dynamic>> httpRequests(
    Uri url,
    String requestType, {
    Map<String, String>? headers,
    dynamic body,
    Encoding? encoding,
  }) async {
    if ((requestType == "GET" || requestType == "DELETE") &&
        (body != null || encoding != null)) {
      throw _errorResponse(
          "You can not pass body or encoding to GET or DELETE request");
    }

    return httpRequestsHandler(url, requestType,
        headers: headers, body: body, encoding: encoding);
  }

  Map<String, dynamic> _errorResponse(String message) {
    Map<String, dynamic> responseMap = {
      'success': false,
      'messsage': message,
      'data': null
    };
    return responseMap;
  }
}
