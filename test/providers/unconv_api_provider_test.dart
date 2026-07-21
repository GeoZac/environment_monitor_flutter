import 'dart:convert';

import 'package:environment_monitor/models/shared/message_response.dart';
import 'package:environment_monitor/models/user/auth_request.dart';
import 'package:environment_monitor/models/user/auth_response.dart';
import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:environment_monitor/models/user/unconv_user_dto.dart';
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

  test('Signup should return UnconvUserDTO on successful signup', () async {
    Map<String, dynamic> successResponse = {
      "message": "User created successfully",
      "entity": {
        "id": "8a0f4636-87d2-4a87-9967-e575f32e3c82",
        "username": "SomeUserName",
        "email": "email@provider.com",
        "password": null,
        "currentPassword": null,
        "authorities": [
          {"authority": "UNCONV_USER"}
        ],
        "enabled": false,
        "accountNonExpired": false,
        "credentialsNonExpired": false,
        "accountNonLocked": false
      }
    };

    final mockClient = MockClient();

    final mockResponse = http.Response(
      jsonEncode(successResponse),
      201,
    );

    when(
      mockClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ),
    ).thenAnswer((_) async => mockResponse);

    final UnconvUserSignup unconvUserSignup = UnconvUserSignup(
      username: "SomeUserName",
      email: 'email@provider.com',
      password: '\$ecreT123',
    );

    final UnconvApiProvider unconvApiProvider = UnconvApiProvider(
      mockClient,
    );

    final result = await unconvApiProvider.signup(
      unconvUserSignup,
    );

    expect(result, isA<MessageResponse<UnconvUser>>());

    verify(mockClient.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).called(1);
  });
}
