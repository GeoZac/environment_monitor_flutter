import 'package:flutter/material.dart';

import '../config/secrets.dart';
import '../models/sensor_system/sensor_system_response.dart';
import 'api_provider.dart';

class SensorSystemProvider with ChangeNotifier {
  Future<SensorSystemResponse> fetchSensorSystems(String unconvUserId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${Secrets.bearerToken}",
    };

    Uri uri = Uri(
      scheme: 'https',
      host: Secrets.baseApiUrl,
      path: '/SensorSystem/UnconvUser/$unconvUserId',
      queryParameters: {
        "sortBy": "sensorName",
        "sortDir": "asc",
      },
    );

    ApiProvider apiProvider = ApiProvider();
    final response = await apiProvider.makeHttpGet(
      uri,
      headers: headers,
    );

    return SensorSystemResponse.fromJson(response);
  }
}
