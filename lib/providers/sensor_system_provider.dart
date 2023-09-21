import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/secrets.dart';
import '../models/sensor_system/sensor_system.dart';
import '../models/sensor_system/sensor_system_response.dart';
import 'api_provider.dart';

class SensorSystemProvider with ChangeNotifier {
  final http.Client httpClient;

  final String baseUrlPath = "/SensorSystem";

  SensorSystemProvider(
    this.httpClient,
  );

  Future<SensorSystemResponse> fetchSensorSystems(String unconvUserId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${Secrets.bearerToken}",
    };

    Uri uri = Uri(
      scheme: 'https',
      host: Secrets.baseApiUrl,
      path: '$baseUrlPath/UnconvUser/$unconvUserId',
    );

    ApiProvider apiProvider = ApiProvider(
      httpClient,
    );
    final response = await apiProvider.makeHttpGet(
      uri,
      headers: headers,
    );

    return SensorSystemResponse.fromJson(response);
  }

  Future<SensorSystem> createSensorSystem(SensorSystem sensorSystem) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${Secrets.bearerToken}",
    };

    Uri uri = Uri(
      scheme: 'https',
      host: Secrets.baseApiUrl,
      path: baseUrlPath,
    );

    ApiProvider apiProvider = ApiProvider(
      httpClient,
    );
    final response = await apiProvider.makeHttpPost(
      uri,
      headers,
      sensorSystem.toJson(),
    );
    return SensorSystem.fromJson(response['entity']);
  }
}
