import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config/globals.dart';
import '../config/secrets.dart';
import '../models/user/unconv_user.dart';
import 'api_provider.dart';

class UnconvUserProvider with ChangeNotifier {
  final http.Client httpClient;

  UnconvUserProvider(
    this.httpClient,
  );

  Future<UnconvUser> createUnconvUser(UnconvUser unconvUser) async {
    Uri uri = Uri(
      scheme: Globals.uriScheme,
      host: Secrets.baseApiUrl,
      port: Secrets.baseApiPort,
      path: '/UnconvUser',
    );

    ApiProvider apiProvider = ApiProvider(
      httpClient,
    );
    final response = await apiProvider.makeHttpPost(
      uri,
      null,
      unconvUser.toJson(),
    );
    return UnconvUser.fromJson(
      response['entity'],
    );
  }
}
