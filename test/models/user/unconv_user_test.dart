import 'package:environment_monitor/models/user/unconv_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test SensorSystem.fromJson', () {
    // Sample JSON data
    final json = {
      "id": "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
      "username": "Test User",
      "email": "noname@email.com"
    };

    // Perform the model mapping
    final user = UnconvUser.fromJson(json);

    // Verify the values
    expect(user.id, "a5bbd1bd-c89b-4219-b0a8-379abe41b879");
    expect(user.username, "Test User");
    expect(user.email, "noname@email.com");
  });

  test("Failure", (() {
    // Test case 2: JSON missing 'id' field
    final json2 = {"username": "Test User", "email": "noname@email.com"};

    expect(() => UnconvUser.fromJson(json2), throwsFormatException);
  }));

  test('toJson() should return a valid JSON map', () {
    // Create an instance of the class to test
    final instance = UnconvUser(
      id: "a5bbd1bd-c89b-4219-b0a8-379abe41b879",
      username: "Test User",
      email: "test@example.com",
    );

    final json = instance.toJson();

    expect(json, isA<Map<String, dynamic>>());

    expect(json['id'], equals('a5bbd1bd-c89b-4219-b0a8-379abe41b879'));
    expect(json['username'], equals("Test User"));
    expect(json['email'], equals("test@example.com"));
  });
}
