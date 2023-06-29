import 'package:flutter/material.dart';

import '../config/secrets.dart';
import '../models/envt_reading/envt_reading_response.dart';
import 'api_provider.dart';

class EnvironmentalReadingProvider with ChangeNotifier {
  Future<EnvironmentalReadingResponse>
      fetchEnvironmentalReadingsOfSpecificSensor(String sensorSystemId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${Secrets.bearerToken}",
    };

    Uri uri = Uri(
      scheme: 'https',
      host: Secrets.baseApiUrl,
      path: '/EnvironmentalReading/SensorSystem/$sensorSystemId',
      queryParameters: {
        "sortBy": "timestamp",
        "sortDir": "desc",
      },
    );

    ApiProvider apiProvider = ApiProvider();
    final response = await apiProvider.makeHttpGet(
      uri,
      headers: headers,
    );

    return EnvironmentalReadingResponse.fromJson(response);
  }
}
