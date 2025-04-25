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

    test('Test makeHttpGet timeout failure', () async {
      final url = Uri.parse('https://example.com/api/timeout_endpoint');

      when(
        mockClient.get(
          url,
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) => Future.delayed(
          const Duration(seconds: 11),
          () => http.Response('{}', 200),
        ),
      );

      expect(
        () async => await apiProvider.makeHttpGet(url),
        throwsA(isA<FetchDataException>()),
      );
    });

    test('Test makeHttpPost success', () async {
      final url = Uri.parse('https://example.com/api/endpoint');
      final requestBody = {'key': 'value'};
      final expectedResponse = {'key': 'value'};

      when(
        mockClient.post(
          url,
          headers: anyNamed('headers'),
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
          headers: anyNamed('headers'),
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

    test('Test makeHttpPost timeout failure', () async {
      final url = Uri.parse('https://example.com/api/endpoint');
      final requestBody = {'key': 'value'};

      when(
        mockClient.post(
          url,
          headers: anyNamed('headers'),
          body: jsonEncode(requestBody),
        ),
      ).thenAnswer(
        (_) => Future.delayed(
          const Duration(seconds: 11), // Simulate delay to trigger timeout
          () => http.Response('{}', 200),
        ),
      );

      expect(
        () async => await apiProvider.makeHttpPost(url, null, requestBody),
        throwsA(isA<FetchDataException>()),
      );
    });
  });

  test('Test makeHttpPost 400 failure', () {
    final mockClient = MockClient();
    ApiProvider apiProvider = ApiProvider(mockClient);

    final url = Uri.parse('https://example.com/api/invalid_endpoint');
    final requestBody = {'key': 'value'};

    when(
      mockClient.post(
        url,
        headers: anyNamed('headers'),
        body: jsonEncode(requestBody),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        '{"key": "value"}',
        400,
      ),
    );

    expect(
      () async => await apiProvider.makeHttpPost(
        url,
        null,
        requestBody,
      ),
      throwsA(
        isA<BadRequestException>(),
      ),
    );
  });

  test('Test makeHttpPost 401 failure', () {
    final mockClient = MockClient();
    ApiProvider apiProvider = ApiProvider(mockClient);

    final url = Uri.parse('https://example.com/api/invalid_endpoint');
    final requestBody = {'key': 'value'};

    when(
      mockClient.post(
        url,
        headers: anyNamed('headers'),
        body: jsonEncode(requestBody),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        '{"key": "value"}',
        401,
      ),
    );

    expect(
      () async => await apiProvider.makeHttpPost(
        url,
        null,
        requestBody,
      ),
      throwsA(
        isA<UnauthorisedException>(),
      ),
    );
  });

  test('Test makeHttpPost 403 failure', () {
    final mockClient = MockClient();
    ApiProvider apiProvider = ApiProvider(mockClient);

    final url = Uri.parse('https://example.com/api/invalid_endpoint');
    final requestBody = {'key': 'value'};

    when(
      mockClient.post(
        url,
        headers: anyNamed('headers'),
        body: jsonEncode(requestBody),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        '{"key": "value"}',
        403,
      ),
    );

    expect(
      () async => await apiProvider.makeHttpPost(
        url,
        null,
        requestBody,
      ),
      throwsA(
        isA<UnauthorisedException>(),
      ),
    );
  });

  test('Test makeHttpPost 500 failure', () {
    final mockClient = MockClient();
    ApiProvider apiProvider = ApiProvider(mockClient);

    final url = Uri.parse('https://example.com/api/invalid_endpoint');
    final requestBody = {'key': 'value'};

    when(
      mockClient.post(
        url,
        headers: anyNamed('headers'),
        body: jsonEncode(requestBody),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        '{"key": "value"}',
        500,
      ),
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

  test('Test makeHttpPost Unhandled failure with 404', () {
    final mockClient = MockClient();
    ApiProvider apiProvider = ApiProvider(mockClient);

    final url = Uri.parse('https://example.com/api/invalid_endpoint');
    final requestBody = {'key': 'value'};

    when(
      mockClient.post(
        url,
        headers: anyNamed('headers'),
        body: jsonEncode(requestBody),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        '{"key": "value"}',
        404,
      ),
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
}
