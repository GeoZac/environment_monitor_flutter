import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/secrets.dart';
import '../models/sensor_auth_token/sensor_auth_token.dart';
import '../models/shared/message_response.dart';
import 'api_provider.dart';

class SensorAuthTokenProvider with ChangeNotifier {
  final http.Client httpClient;

  final String baseUrlPath = "/SensorAuthToken";

  SensorAuthTokenProvider(
    this.httpClient,
  );

  Future<SensorAuthToken?> fetchSensorAuthToken(String sensorSystemId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${Secrets.bearerToken}",
    };

    Uri uri = Uri(
      scheme: 'https',
      host: Secrets.baseApiUrl,
      path: '$baseUrlPath/SensorSystem/$sensorSystemId',
    );

    ApiProvider apiProvider = ApiProvider(
      httpClient,
    );
    final response = await apiProvider.makeHttpGet(
      uri,
      headers: headers,
    );

    if (response == null) {
      return null;
    }
    return SensorAuthToken.fromJson(response);
  }

  Future<MessageResponse<SensorAuthToken>> generateSensorAuthToken(
      String sensorSystemId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${Secrets.bearerToken}",
    };

    Uri uri = Uri(
      scheme: 'https',
      host: Secrets.baseApiUrl,
      path: '$baseUrlPath/GenerateToken/SensorSystem/$sensorSystemId',
    );

    ApiProvider apiProvider = ApiProvider(
      httpClient,
    );
    final response = await apiProvider.makeHttpGet(
      uri,
      headers: headers,
    );

    return MessageResponse.fromJson(
        response, (p0) => SensorAuthToken.fromJson(p0));
  }
}
