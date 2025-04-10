import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/globals.dart';
import '../config/secrets.dart';
import '../models/user/auth_request.dart';
import '../models/user/auth_response.dart';
import 'api_provider.dart';

class UnconvApiProvider with ChangeNotifier {
  final http.Client httpClient;

  UnconvApiProvider(
    this.httpClient,
  );

  Future<dynamic> login(AuthRequest authRequest) async {
    Uri uri = Uri(
      scheme: Globals.uriScheme,
      host: Secrets.baseApiUrl,
      port: Secrets.baseApiPort,
      path: '/auth/login',
    );

    ApiProvider apiProvider = ApiProvider(
      httpClient,
    );
    final response = await apiProvider.makeHttpPost(
      uri,
      null,
      authRequest.toJson(),
    );
    return AuthResponse.fromJson(response);
  }
}
