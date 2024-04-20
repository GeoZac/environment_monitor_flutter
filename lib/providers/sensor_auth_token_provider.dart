import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SensorAuthTokenProvider with ChangeNotifier {
  final http.Client httpClient;

  final String baseUrlPath = "/SensorAuthToken";

  SensorAuthTokenProvider(
    this.httpClient,
  );
}
