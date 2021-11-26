import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpServiceHelper extends _HttpServiceHelper {
  Future<Map<String, dynamic>> httpRequestsHandler(
    Uri url,
    String requestType, {
    Map<String, String>? headers,
    dynamic body,
    Encoding? encoding,
  }) async {
    http.Response response;
    try {
      switch (requestType) {
        case "GET":
          response = await http.get(url, headers: headers);
          break;
        case "POST":
          response = await http.post(url,
              headers: headers, body: body, encoding: encoding);
          break;
        case "PUT":
          response = await http.put(url,
              headers: headers, body: body, encoding: encoding);
          break;
        case "PATCH":
          response = await http.patch(url,
              headers: headers, body: body, encoding: encoding);
          break;
        case "DELETE":
          response = await http.delete(url, headers: headers);
          break;
        default:
          throw "No method type match";
      }
    } catch (exception) {
      return _serverError(exception.toString());
    }
    return _handleResponse(response);
  }
}

class _HttpServiceHelper {
  Map<String, dynamic> _handleResponse(response) {
    if (response != null) {
      return _identifyResponse(response);
    }
    return _serverError("response is null");
  }

  Map<String, dynamic> _identifyResponse(
    http.Response response,
  ) {
    final int _statusCode = response.statusCode;

    //write your status error here
    if (_statusCode >= 400) {
      return _errorResponse(response);
    } else if (_statusCode >= 200 && _statusCode < 300) {
      return _successResponse(response);
    } else {
      return _errorResponse(response);
    }
  }

  Map<String, dynamic> _successResponse(
    http.Response response,
  ) {
    try {
      dynamic decodeBody;

      if (response.headers["content-type"]!.contains("application/json")) {
        decodeBody = json.decode(response.body);
      } else if (response.headers["content-type"]!.contains("text/plain")) {
        decodeBody = response.body;
      }

      Map<String, dynamic> responseMap = {
        'success': true,
        'data': decodeBody,
        'statusCode': response.statusCode,
        'message': "API call successfully done."
      };
      return responseMap;
    } catch (exception) {
      return _serverError("Unable to decode body");
    }
  }

  Map<String, dynamic> _errorResponse(
    http.Response response,
  ) {
    try {
      dynamic decodeBody;

      if (response.headers["content-type"]!.contains("application/json")) {
        decodeBody = json.decode(response.body);
      } else if (response.headers["content-type"]!.contains("text/plain")) {
        decodeBody = response.body;
      }
      Map<String, dynamic> responseMap = {
        'success': false,
        'statusCode': response.statusCode,
        'message': decodeBody["message"]
      };
      return responseMap;
    } catch (exception) {
      return _serverError("Unable to decode body");
    }
  }

  Map<String, dynamic> _serverError(String message) {
    Map<String, dynamic> responseMap = {
      'success': false,
      'message': message,
      'data': null
    };
    return responseMap;
  }
}
