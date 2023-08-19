import 'dart:convert';
import 'dart:io';

import 'package:environment_monitor/models/http/custom_exception.dart';
import 'package:environment_monitor/providers/api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('ApiProvider tests', () {
    final mockClient = MockClient();
    ApiProvider apiProvider = ApiProvider(mockClient);

    test('Test makeHttpGet success', () async {
      final url = Uri.parse('https://example.com/api/endpoint');
      final expectedResponse = {'key': 'value'};

      when(
        mockClient.get(
          url,
          headers: anyNamed('headers'),
        ),
      ).thenAnswer((_) async => http.Response(
            '{"key": "value"}',
            200,
          ));

      final response = await apiProvider.makeHttpGet(
        url,
      );

      expect(response, expectedResponse);
    });

    test('Test makeHttpGet failure', () {
      final url = Uri.parse('https://example.com/api/invalid_endpoint');

      when(
        mockClient.get(
          url,
          headers: anyNamed('headers'),
        ),
      ).thenThrow(
        const SocketException(
          'No Internet connection',
        ),
      );

      expect(
        () async => await apiProvider.makeHttpGet(url),
        throwsA(
          isA<FetchDataException>(),
        ),
      );
    });

    test('Test makeHttpPost success', () async {
      final url = Uri.parse('https://example.com/api/endpoint');
      final requestBody = {'key': 'value'};
      final expectedResponse = {'key': 'value'};

      when(
        mockClient.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '{"key": "value"}',
          200,
        ),
      );

      final response = await apiProvider.makeHttpPost(
        url,
        null,
        requestBody,
      );

      expect(response, expectedResponse);
    });

    test('Test makeHttpPost failure', () {
      final url = Uri.parse('https://example.com/api/invalid_endpoint');
      final requestBody = {'key': 'value'};

      when(
        mockClient.post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody),
        ),
      ).thenThrow(
        const SocketException('No Internet connection'),
      );

      expect(
        () async => await apiProvider.makeHttpPost(
          url,
          null,
          requestBody,
        ),
        throwsA(
          isA<FetchDataException>(),
        ),
      );
    });
  });
}
