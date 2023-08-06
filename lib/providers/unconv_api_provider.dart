import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/secrets.dart';
import '../models/user/auth_request.dart';
import '../models/user/auth_response.dart';
import 'api_provider.dart';

class UnconvApiProvider with ChangeNotifier {
  Future<dynamic> login(AuthRequest authRequest) async {
    Uri uri = Uri(
      scheme: 'https',
      host: Secrets.baseApiUrl,
      path: '/auth/login',
    );

    ApiProvider apiProvider = ApiProvider(http.Client());
    final response = await apiProvider.makeHttpPost(
      uri,
      null,
      authRequest.toJson(),
    );
    return AuthResponse.fromJson(response);
  }
}
