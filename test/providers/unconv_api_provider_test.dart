import 'dart:convert';

import 'package:environment_monitor/models/user/auth_request.dart';
import 'package:environment_monitor/models/user/auth_response.dart';
import 'package:environment_monitor/providers/unconv_api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'unconv_api_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('login should return AuthResponse on successful login', () async {
    Map<String, dynamic> successResponse = {
      "expires": 3600,
      "unconvUser": {
        "id": "6b7e32a7-0c42-4bf4-95d0-e6e2c4d1e3e7",
        "username": "test_user",
        "email": "test_user@email.com",
        "accountNonExpired": true,
        "accountNonLocked": true,
        "credentialsNonExpired": true,
        "enabled": true,
        "authorities": [
          {'authority': 'UNCONV_USER'},
        ],
      },
      "token":
          "hICKORYdICKORYdOCK_THEmOUSErANupTHecLOCK_tHEcLOCKSTRUCKONE_THEmOUSErANdown_hICKORYdICKORYdOCK"
    };

    final mockClient = MockClient();

    final mockResponse = http.Response(
      jsonEncode(successResponse),
      200,
    );

    when(
      mockClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ),
    ).thenAnswer((_) async => mockResponse);

    final authRequest = AuthRequest(
      "test_user",
      "password",
    );

    final UnconvApiProvider unconvApiProvider = UnconvApiProvider(mockClient);

    final result = await unconvApiProvider.login(authRequest);

    expect(result, isA<AuthResponse>());

    verify(mockClient.post(any,
            headers: anyNamed('headers'), body: anyNamed('body')))
        .called(1);
  });
}
