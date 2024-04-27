import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/globals.dart';
import '../config/secrets.dart';
import '../models/sensor_system/sensor_system_response.dart';
import 'api_provider.dart';

class SensorSystemProvider with ChangeNotifier {
  final http.Client httpClient;

  SensorSystemProvider(
    this.httpClient,
  );

  Future<SensorSystemResponse> fetchSensorSystems(String unconvUserId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${Secrets.bearerToken}",
    };

    Uri uri = Uri(
      scheme: Globals.uriScheme,
      host: Secrets.baseApiUrl,
      path: '/SensorSystem/UnconvUser/$unconvUserId',
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
}
