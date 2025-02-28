import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/globals.dart';
import '../config/secrets.dart';
import '../models/envt_reading/envt_reading_response.dart';
import '../utils/token_singleton.dart';
import 'api_provider.dart';

class EnvironmentalReadingProvider with ChangeNotifier {
  final http.Client httpClient;

  EnvironmentalReadingProvider(
    this.httpClient,
  );

  Future<EnvironmentalReadingResponse>
      fetchEnvironmentalReadingsOfSpecificSensor(String sensorSystemId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${TokenSingleton().bearerToken}",
    };

    Uri uri = Uri(
      scheme: Globals.uriScheme,
      host: Secrets.baseApiUrl,
      port: Secrets.baseApiPort,
      path: '/EnvironmentalReading/SensorSystem/$sensorSystemId',
    );

    ApiProvider apiProvider = ApiProvider(
      httpClient,
    );
    final response = await apiProvider.makeHttpGet(
      uri,
      headers: headers,
    );

    return EnvironmentalReadingResponse.fromJson(response);
  }
}
