import 'package:environment_monitor/models/sensor_system/sensor_system_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create SensorSystemReponse from JSON data with all fields', () {
    Map<String, dynamic> jsonData = {
      "isFirst": true,
      "isLast": true,
      "hasNext": false,
      "hasPrevious": false,
      "data": [
        {
          "id": "2d1f53b1-a177-484c-a323-a3cd91134fb8",
          "sensorName": "EFBMOVZ",
          "sensorLocation": null,
          "unconvUser": {
            "id": "9c06ee96-4353-4377-b423-83a186da7f7a",
            "username": "Specific UnconvUser",
            "email": "unconvuser@email.com",
          },
          "readingCount": 0,
          "latestReading": null
        },
        {
          "id": "b7a30f45-fa48-4cff-b111-a2931d270809",
          "sensorName": "FCT",
          "sensorLocation": null,
          "unconvUser": {
            "id": "9c06ee96-4353-4377-b423-83a186da7f7a",
            "username": "Specific UnconvUser",
            "email": "unconvuser@email.com",
          },
          "readingCount": 0,
          "latestReading": null
        },
        {
          "id": "5e93949d-fc9b-441a-a46a-3d69179234df",
          "sensorName": "KJEYMAS",
          "sensorLocation": null,
          "unconvUser": {
            "id": "9c06ee96-4353-4377-b423-83a186da7f7a",
            "username": "Specific UnconvUser",
            "email": "unconvuser@email.com",
          },
          "readingCount": 0,
          "latestReading": null
        },
        {
          "id": "d466e8cd-d901-49a0-a4de-9c3cefe3bd64",
          "sensorName": "UMQK",
          "sensorLocation": null,
          "unconvUser": {
            "id": "9c06ee96-4353-4377-b423-83a186da7f7a",
            "username": "Specific UnconvUser",
            "email": "unconvuser@email.com",
          },
          "readingCount": 0,
          "latestReading": null
        },
        {
          "id": "a40cf42e-fa5d-4e81-95c1-eb76b0d748c4",
          "sensorName": "VDMN",
          "sensorLocation": null,
          "unconvUser": {
            "id": "9c06ee96-4353-4377-b423-83a186da7f7a",
            "username": "Specific UnconvUser",
            "email": "unconvuser@email.com",
          },
          "readingCount": 0,
          "latestReading": null
        }
      ],
      "totalElements": 5,
      "pageNumber": 1,
      "totalPages": 1
    };

    SensorSystemResponse sensorSystemResponse =
        SensorSystemResponse.fromJson(jsonData);
    expect(sensorSystemResponse.pageNumber, equals(1));
    expect(sensorSystemResponse.data.length, equals(5));
    expect(sensorSystemResponse.hasNext, equals(false));
    expect(sensorSystemResponse.hasPrevious, equals(false));
    expect(sensorSystemResponse.isFirst, equals(true));
    expect(sensorSystemResponse.isLast, equals(true));
    expect(sensorSystemResponse.totalElements, equals(5));
    expect(sensorSystemResponse.pageNumber, equals(1));
    expect(sensorSystemResponse.totalPages, equals(1));
  });

  testWidgets('Return exception when required fields are not found', (
    WidgetTester tester,
  ) async {
    Map<String, dynamic> json = {
      'content': null,
    };

    // Use expectLater to verify that the method throws the expected exception
    expectLater(
      () => SensorSystemResponse.fromJson(json),
      throwsFormatException,
    );
  });
}
