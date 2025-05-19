import 'package:environment_monitor/models/envt_reading/envt_reading_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create EnvironmentalReadingResponse from JSON data with all fields',
      () {
    Map<String, dynamic> jsonData = {
      "isFirst": true,
      "isLast": true,
      "hasNext": false,
      "hasPrevious": false,
      "data": [
        {
          "id": "c4bd4221-369f-4ba8-b3d8-a7c7d6e25c10",
          "temperature": -8532.269,
          "humidity": 74.344,
          "timestamp": "2068-11-12T07:40:41.578527Z",
          "sensorSystem": {
            "id": "eacc8c6d-d16b-4a8d-ba83-47f1a2cd4846",
            "sensorName": "Specific Sensor System",
            "description":
                "A sleek home climate control system featuring sensors that precisely monitor room temperature and humidity, adapting heating and cooling settings for optimal comfort and energy efficiency.",
            "deleted": false,
            "sensorStatus": "ACTIVE",
            "sensorLocation": {
              "id": "015d1f16-f13f-3961-bef8-3c652ab7b5cf",
              "sensorLocationText": "ETRCFOEHJN",
              "latitude": 3102.055641968899,
              "longitude": 1480.7077446255694,
              "sensorLocationType": "OUTDOOR"
            },
            "unconvUser": {
              "id": "532c476c-0eed-4d46-97f5-e7a6eefaa2d0",
              "username": "UnconvUser",
              "email": "unconvuser@email.com",
              "accountNonExpired": true,
              "accountNonLocked": true,
              "credentialsNonExpired": true,
              "enabled": true,
              "authorities": [
                {'authority': 'UNCONV_USER'},
              ],
            },
            "readingCount": 0,
            "latestReading": null,
          }
        },
        {
          "id": "260cbec2-ae11-4be2-8ff3-43610d8e22d6",
          "temperature": -9334.845,
          "humidity": 19.298,
          "timestamp": "2035-03-28T00:07:51.266706Z",
          "sensorSystem": {
            "id": "eacc8c6d-d16b-4a8d-ba83-47f1a2cd4846",
            "sensorName": "Specific Sensor System",
            "description":
                "A sleek home climate control system featuring sensors that precisely monitor room temperature and humidity, adapting heating and cooling settings for optimal comfort and energy efficiency.",
            "deleted": false,
            "sensorStatus": "ACTIVE",
            "sensorLocation": {
              "id": "fcfe6dff-a6bb-3c53-a272-3b7bf4b09c4e",
              "sensorLocationText": "NSRIZH",
              "latitude": 7670.714648114199,
              "longitude": 4376.48542429605,
              "sensorLocationType": "OUTDOOR"
            },
            "unconvUser": {
              "id": "532c476c-0eed-4d46-97f5-e7a6eefaa2d0",
              "username": "UnconvUser",
              "email": "unconvuser@email.com",
              "accountNonExpired": true,
              "accountNonLocked": true,
              "credentialsNonExpired": true,
              "enabled": true,
              "authorities": [
                {'authority': 'UNCONV_USER'},
              ],
            },
            "readingCount": 0,
            "latestReading": null,
          }
        },
        {
          "id": "3840f2f5-3db8-4d7e-9ade-6286d9494828",
          "temperature": -5938.624,
          "humidity": 83.677,
          "timestamp": "2030-07-22T10:56:28.681565Z",
          "sensorSystem": {
            "id": "eacc8c6d-d16b-4a8d-ba83-47f1a2cd4846",
            "sensorName": "Specific Sensor System",
            "description":
                "A sleek home climate control system featuring sensors that precisely monitor room temperature and humidity, adapting heating and cooling settings for optimal comfort and energy efficiency.",
            "deleted": false,
            "sensorStatus": "INACTIVE",
            "sensorLocation": {
              "id": "0902a89f-41b4-3a47-b150-60fa42feb60e",
              "sensorLocationText": "LCTGC",
              "latitude": 5246.859920461906,
              "longitude": 1403.88627798368,
              "sensorLocationType": "OUTDOOR"
            },
            "unconvUser": {
              "id": "532c476c-0eed-4d46-97f5-e7a6eefaa2d0",
              "username": "UnconvUser",
              "email": "unconvuser@email.com",
              "accountNonExpired": true,
              "accountNonLocked": true,
              "credentialsNonExpired": true,
              "enabled": true,
              "authorities": [
                {'authority': 'UNCONV_USER'},
              ],
            },
            "readingCount": 0,
            "latestReading": null,
          }
        },
        {
          "id": "24046c17-acee-40eb-bb04-6562b90ca9fc",
          "temperature": 3281.792,
          "humidity": 42.162,
          "timestamp": "1984-01-01T12:32:01.921178Z",
          "sensorSystem": {
            "id": "eacc8c6d-d16b-4a8d-ba83-47f1a2cd4846",
            "sensorName": "Specific Sensor System",
            "description": "XTNVFQDP",
            "deleted": false,
            "sensorStatus": "ACTIVE",
            "sensorLocation": {
              "id": "f247c10d-65c8-3179-a8ae-93f68c417e1b",
              "sensorLocationText": "DGVKXURVXZ",
              "latitude": 6394.838778916884,
              "longitude": 3326.533194516762,
              "sensorLocationType": "INDOOR"
            },
            "unconvUser": {
              "id": "532c476c-0eed-4d46-97f5-e7a6eefaa2d0",
              "username": "UnconvUser",
              "email": "unconvuser@email.com",
              "accountNonExpired": true,
              "accountNonLocked": true,
              "credentialsNonExpired": true,
              "enabled": true,
              "authorities": [
                {'authority': 'UNCONV_USER'},
              ],
            },
            "readingCount": 0,
            "latestReading": null,
          }
        },
        {
          "id": "9476245a-1109-4b8d-9cc4-aa156630bc65",
          "temperature": -9600.818,
          "humidity": 94.513,
          "timestamp": "1983-09-05T17:53:34.958455Z",
          "sensorSystem": {
            "id": "eacc8c6d-d16b-4a8d-ba83-47f1a2cd4846",
            "sensorName": "Specific Sensor System",
            "deleted": false,
            "sensorStatus": "ACTIVE",
            "sensorLocation": {
              "id": "85f18ec3-4a35-39db-95b1-197a6bd787a9",
              "sensorLocationText": "QPQJNRMUEW",
              "latitude": 9281.933719220495,
              "longitude": 5753.433261160702,
              "sensorLocationType": "OUTDOOR"
            },
            "unconvUser": {
              "id": "532c476c-0eed-4d46-97f5-e7a6eefaa2d0",
              "username": "UnconvUser",
              "email": "unconvuser@email.com",
              "accountNonExpired": true,
              "accountNonLocked": true,
              "credentialsNonExpired": true,
              "enabled": true,
              "authorities": [
                {'authority': 'UNCONV_USER'},
              ],
            },
            "readingCount": 0,
            "latestReading": null,
          }
        }
      ],
      "totalElements": 5,
      "pageNumber": 1,
      "totalPages": 1
    };

    EnvironmentalReadingResponse environmentalReadingResponse =
        EnvironmentalReadingResponse.fromJson(jsonData);

    expect(environmentalReadingResponse.pageNumber, equals(1));
    expect(environmentalReadingResponse.data.length, equals(5));
    expect(environmentalReadingResponse.hasNext, equals(false));
    expect(environmentalReadingResponse.hasPrevious, equals(false));
    expect(environmentalReadingResponse.isFirst, equals(true));
    expect(environmentalReadingResponse.isLast, equals(true));
    expect(environmentalReadingResponse.totalElements, equals(5));
    expect(environmentalReadingResponse.pageNumber, equals(1));
    expect(environmentalReadingResponse.totalPages, equals(1));
  });

  testWidgets('Return exception when required fields are not found', (
    WidgetTester tester,
  ) async {
    Map<String, dynamic> json = {
      'content': null,
    };

    // Use expectLater to verify that the method throws the expected exception
    expectLater(
      () => EnvironmentalReadingResponse.fromJson(json),
      throwsFormatException,
    );
  });
}
