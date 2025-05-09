import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/globals.dart';
import '../config/secrets.dart';
import '../consts/app_constants.dart';
import '../models/sensor_location/sensor_location.dart';
import '../utils/token_singleton.dart';
import 'api_provider.dart';

class SensorLocationProvider with ChangeNotifier {
  final http.Client httpClient;

  final String baseUrlPath = "/SensorLocation";

  SensorLocationProvider(
    this.httpClient,
  );

  Future<List<SensorLocation>> fetchSensorLocations(String unconvUserId) async {
    Map<String, String> headers = {
      AppConstants.contentTypeKey: AppConstants.contentTypeValue,
      AppConstants.authorizationKey:
          "${AppConstants.bearerPrefix}${TokenSingleton().bearerToken}",
    };

    Uri uri = Uri(
      scheme: Globals.uriScheme,
      host: Secrets.baseApiUrl,
      port: Secrets.baseApiPort,
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
      AppConstants.contentTypeKey: AppConstants.contentTypeValue,
      AppConstants.authorizationKey:
          "${AppConstants.bearerPrefix}${TokenSingleton().bearerToken}",
    };

    Uri uri = Uri(
      scheme: Globals.uriScheme,
      host: Secrets.baseApiUrl,
      port: Secrets.baseApiPort,
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
