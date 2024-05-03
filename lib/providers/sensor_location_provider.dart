import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/secrets.dart';
import '../models/sensor_location/sensor_location.dart';
import 'api_provider.dart';

class SensorLocationProvider with ChangeNotifier {
  final http.Client httpClient;

  final String baseUrlPath = "/SensorLocation";

  SensorLocationProvider(
    this.httpClient,
  );

  Future<List<SensorLocation>> fetchSensorLocations(String unconvUserId) async {
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
    ) as List;

    List<SensorLocation> sensorList =
        response.map((dynamic item) => SensorLocation.fromJson(item)).toList();

    return sensorList;
  }

  Future<SensorLocation> createSensorLocation(
      SensorLocation sensorLocation) async {
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
      sensorLocation.toJson(),
    );

    return SensorLocation.fromJson(response);
  }
}
