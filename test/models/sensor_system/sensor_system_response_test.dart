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
          "id": "d68bdb26-2bd3-48b6-8044-4a5578ce8bca",
          "sensorName": "ARIVMWR",
          "description": "PBTKBFBUF",
          "deleted": true,
          "sensorStatus": "ACTIVE",
          "sensorLocation": {
            "id": "61d7b1ab-9899-4ed4-82f3-970dd6166382",
            "sensorLocationText": "LYYAU",
            "latitude": -42.97525086713861,
            "longitude": 77.58744178604718,
            "sensorLocationType": "INDOOR"
          },
          "unconvUser": {
            "id": "606e3bd7-c573-4ed9-b87c-0bc426e49dd4",
            "username": "NHVZSSET",
            "email": "UUCPUHJA",
            "accountNonExpired": true,
            "accountNonLocked": true,
            "credentialsNonExpired": true,
            "enabled": true,
            "authorities": [
              {'authority': 'UNCONV_USER'},
            ],
          },
          "readingCount": 9,
          "latestReading": {
            "temperature": 1210.396,
            "humidity": 93.574,
            "timestamp": "2020-07-25T12:33:20.398478Z",
          },
          "createdDate": "2024-02-29T14:57:56.795247158Z",
          "updatedDate": "2025-01-23T12:57:56.795270236Z",
        },
        {
          "id": "384711f2-9ded-4ab3-9278-bf6da61c9e96",
          "sensorName": "CTQSJRMEMS",
          "description": "OPMWSEV",
          "deleted": false,
          "sensorStatus": "ACTIVE",
          "sensorLocation": {
            "id": "798b659c-d819-465c-a8ec-9f1ed4ae0b4a",
            "sensorLocationText": "EKFNFSZRJ",
            "latitude": 48.0885153966079,
            "longitude": 39.386615766503326,
            "sensorLocationType": "INDOOR"
          },
          "unconvUser": {
            "id": "a4c30a5c-4d50-4435-9283-de003be0cc86",
            "username": "UZW",
            "email": "TMABI",
            "accountNonExpired": true,
            "accountNonLocked": true,
            "credentialsNonExpired": true,
            "enabled": true,
            "authorities": [
              {'authority': 'UNCONV_USER'},
            ],
          },
          "readingCount": 10,
          "latestReading": {
            "temperature": 8198.453,
            "humidity": 72.599,
            "timestamp": "2020-10-24T01:53:15.231347Z",
          },
          "createdDate": "2024-02-29T14:57:56.795247158Z",
          "updatedDate": "2025-01-23T12:57:56.795270236Z",
        },
        {
          "id": "44930f19-4434-43dc-8196-4aeb5bc75aa5",
          "sensorName": "FDXRKM",
          "description": "BZOQAMUQ",
          "deleted": false,
          "sensorStatus": "ACTIVE",
          "sensorLocation": {
            "id": "30bccb6e-f910-4c17-8aea-2b9ca7cabb4d",
            "sensorLocationText": "LYYAU",
            "latitude": -42.97525086713861,
            "longitude": 77.58744178604718,
            "sensorLocationType": "INDOOR"
          },
          "unconvUser": {
            "id": "43641895-4fe6-44ad-b96c-1d40527337cf",
            "username": "MAIPG",
            "email": "VGH",
            "accountNonExpired": true,
            "accountNonLocked": true,
            "credentialsNonExpired": true,
            "enabled": true,
            "authorities": [
              {'authority': 'UNCONV_USER'},
            ],
          },
          "readingCount": 11,
          "latestReading": {
            "temperature": 3453.62,
            "humidity": 17.621,
            "timestamp": "2018-07-08T03:17:34.010608Z",
          },
          "createdDate": "2024-02-29T14:57:56.795247158Z",
          "updatedDate": "2025-01-23T12:57:56.795270236Z",
        },
        {
          "id": "e282fe65-8761-41c7-b16e-551a7f507600",
          "sensorName": "HLL",
          "description": "IZIAHYQYYG",
          "deleted": false,
          "sensorStatus": "INACTIVE",
          "sensorLocation": {
            "id": "a5fa2c6a-71a1-4285-9a65-e96403cf2475",
            "sensorLocationText": "UDIWBIFK",
            "latitude": -54.3283592620056,
            "longitude": -163.23090951955032,
            "sensorLocationType": "INDOOR"
          },
          "unconvUser": {
            "id": "79d5c30d-f845-420c-b728-e33df4f52d46",
            "username": "HCUSFPYUN",
            "email": "ZZNI",
            "accountNonExpired": true,
            "accountNonLocked": true,
            "credentialsNonExpired": true,
            "enabled": true,
            "authorities": [
              {'authority': 'UNCONV_USER'},
            ],
          },
          "readingCount": 6,
          "latestReading": {
            "temperature": 7084.018,
            "humidity": 37.392,
            "timestamp": "2017-04-09T00:23:35.110871Z",
          },
          "createdDate": "2024-02-29T14:57:56.795247158Z",
          "updatedDate": "2025-01-23T12:57:56.795270236Z",
        },
        {
          "id": "ff74bb42-778a-4c2c-ba29-3f60b5fb8365",
          "sensorName": "XPNDF",
          "description": "ZOUSQS",
          "deleted": true,
          "sensorStatus": "ACTIVE",
          "sensorLocation": {
            "id": "10043a1a-653b-42a8-bd79-01b55474d595",
            "sensorLocationText": "FFVIOHQTQ",
            "latitude": 48.15583668884807,
            "longitude": 12.738341809483046,
            "sensorLocationType": "OUTDOOR"
          },
          "unconvUser": {
            "id": "fc28bbc3-2aa2-4e12-9ee1-601468ddc582",
            "username": "ZEMYEEU",
            "email": "PYX",
            "accountNonExpired": true,
            "accountNonLocked": true,
            "credentialsNonExpired": true,
            "enabled": true,
            "authorities": [
              {'authority': 'UNCONV_USER'},
            ],
          },
          "readingCount": 9,
          "latestReading": {
            "temperature": 9988.489,
            "humidity": 38.377,
            "timestamp": "2017-10-17T13:25:36.745426Z",
          },
          "createdDate": "2024-02-29T14:57:56.795247158Z",
          "updatedDate": "2025-01-23T12:57:56.795270236Z",
        },
        {
          "id": "c1d99a5e-86f8-4480-ab14-3abef9de7d59",
          "sensorName": "ZUJSM",
          "description": "SQZDYFZV",
          "deleted": false,
          "sensorStatus": "INACTIVE",
          "sensorLocation": {
            "id": "ea74f5ad-2a89-46c9-9727-ae50e368a2b3",
            "sensorLocationText": "ZPBXKE",
            "latitude": 60.25241853371955,
            "longitude": -166.3957984174083,
            "sensorLocationType": "OUTDOOR"
          },
          "unconvUser": {
            "id": "4f85034f-c39a-4a81-8a35-b98a3f4c947f",
            "username": "IPNCRAYBID",
            "email": "QVTEVOXGV",
            "accountNonExpired": true,
            "accountNonLocked": true,
            "credentialsNonExpired": true,
            "enabled": true,
            "authorities": [
              {'authority': 'UNCONV_USER'},
            ],
          },
          "readingCount": 5,
          "latestReading": {
            "temperature": -773.543,
            "humidity": 53.601,
            "timestamp": "2023-04-28T03:44:17.879594Z",
          },
          "createdDate": "2024-02-29T14:57:56.795247158Z",
          "updatedDate": "2025-01-23T12:57:56.795270236Z",
        }
      ],
      "totalElements": 6,
      "pageNumber": 1,
      "totalPages": 1
    };

    SensorSystemResponse sensorSystemResponse =
        SensorSystemResponse.fromJson(jsonData);
    expect(sensorSystemResponse.pageNumber, equals(1));
    expect(sensorSystemResponse.data.length, equals(6));
    expect(sensorSystemResponse.hasNext, equals(false));
    expect(sensorSystemResponse.hasPrevious, equals(false));
    expect(sensorSystemResponse.isFirst, equals(true));
    expect(sensorSystemResponse.isLast, equals(true));
    expect(sensorSystemResponse.totalElements, equals(6));
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
