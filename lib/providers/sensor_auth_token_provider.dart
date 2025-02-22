import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/globals.dart';
import '../config/secrets.dart';
import '../models/sensor_auth_token/sensor_auth_token.dart';
import '../models/shared/message_response.dart';
import '../utils/token_singleton.dart';
import 'api_provider.dart';

/// A class responsible for providing functionality related to sensor authentication tokens.
///
/// This class facilitates fetching and generating sensor authentication tokens
/// using HTTP requests to the API endpoints.
class SensorAuthTokenProvider with ChangeNotifier {
  /// The HTTP client used for making API requests.
  final http.Client httpClient;

  /// The base path for sensor authentication token API endpoints.
  final String baseUrlPath = "/SensorAuthToken";

  /// Constructs a [SensorAuthTokenProvider] instance with the provided HTTP client.
  ///
  /// The [httpClient] parameter is required.
  SensorAuthTokenProvider(
    this.httpClient,
  );

  /// Fetches a sensor authentication token for the specified sensor system.
  ///
  /// Returns a [Future] that resolves to a [SensorAuthToken] instance if successful,
  /// otherwise returns `null`.
  Future<SensorAuthToken?> fetchSensorAuthToken(String sensorSystemId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${TokenSingleton().bearerToken}",
    };

    Uri uri = Uri(
      scheme: Globals.uriScheme,
      host: Secrets.baseApiUrl,
      port: Secrets.baseApiPort,
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

  /// Generates a sensor authentication token for the specified sensor system.
  ///
  /// Returns a [Future] that resolves to a [MessageResponse] instance containing
  /// the generated authentication token if successful.
  Future<MessageResponse<SensorAuthToken>> generateSensorAuthToken(
      String sensorSystemId) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${TokenSingleton().bearerToken}",
    };

    Uri uri = Uri(
      scheme: Globals.uriScheme,
      host: Secrets.baseApiUrl,
      port: Secrets.baseApiPort,
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
