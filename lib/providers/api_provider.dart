import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import '../models/http/custom_exception.dart';

class ApiProvider {
  final http.Client httpClient;

  ApiProvider(
    this.httpClient,
  );

  Future<dynamic> makeHttpGet(
    Uri url, {
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    try {
      final response = await httpClient.get(
        url,
        headers: headers,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<dynamic> makeHttpPost(
    Uri url,
    Map<String, String>? headers,
    Map<String, dynamic> body,
  ) async {
    dynamic responseJson;
    try {
      final response = await httpClient.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }
}
